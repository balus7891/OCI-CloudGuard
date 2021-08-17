
resource oci_ons_notification_topic cg-topc {
  count = var.ons_enabled == true ? 1 : 0
  compartment_id = var.tenancy_ocid
  description = "Notifaction for CloudGuard"
  name = "CloudGuard-Notification-Topic"
}

resource oci_ons_subscription subscription {
  count = var.ons_enabled == true ? 1 : 0
  compartment_id = var.tenancy_ocid
  delivery_policy = "{\"backoffRetryPolicy\":{\"maxRetryDuration\":7200000,\"policyType\":\"EXPONENTIAL\"}}"
  endpoint        = var.email_id
  freeform_tags = {
  }
  protocol = "EMAIL"
  topic_id = oci_ons_notification_topic.cg-topc[count.index].id
}

## This configuration is for CloudGuard Event service

resource oci_events_rule cg-rule {
  count = var.ons_enabled == true ? 1 : 0
  compartment_id = var.tenancy_ocid
  actions {
    actions {
      action_type = "ONS"
      is_enabled = "true"
      topic_id = oci_ons_notification_topic.cg-topc[count.index].id
    }
  }

  condition      = "{\"eventType\":[\"com.oraclecloud.cloudguard.problemdetected\",\"com.oraclecloud.cloudguard.problemdismissed\",\"com.oraclecloud.cloudguard.problemremediated\",\"com.oraclecloud.cloudguard.problemthresholdreached\"],\"data\":{}}"
  display_name = "CloudGuard-Event-Rule"
  freeform_tags = {
  }
  is_enabled = "true"
}

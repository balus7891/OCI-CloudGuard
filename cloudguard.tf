resource "oci_cloud_guard_cloud_guard_configuration" "enable_cloud_guard" {

  compartment_id   = var.tenancy_ocid
  reporting_region = var.cg_region
  status           = "ENABLED"
  #depends_on = [oci_identity_policy.cg_policy]
  depends_on = [time_sleep.wait_45_seconds]


}


resource "oci_cloud_guard_responder_recipe" "Cloned-Responder" {
  compartment_id = var.tenancy_ocid
  description  = "Cloned for notification service "
  display_name = "Cloned-Responder"
  source_responder_recipe_id = data.oci_cloud_guard_responder_recipes.list_responder_recipes.responder_recipe_collection.0.items.0.id

  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "true"
    }
    responder_rule_id = "EVENT"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "true"
    }
    responder_rule_id = "MAKE_BUCKET_PRIVATE"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "DELETE_PUBLIC_IP"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "true"
    }
    responder_rule_id = "STOP_INSTANCE"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "TERMINATE_INSTANCE"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "DISABLE_IAM_USER"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "ROTATE_VAULT_KEY"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "DELETE_IAM_POLICY"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "ENABLE_DB_BACKUP"
  }
  responder_rules {
    compartment_id = var.tenancy_ocid
    details {
      is_enabled = "false"
    }
    responder_rule_id = "DELETE_INTERNET_GATEWAY"
  }
depends_on = [oci_cloud_guard_cloud_guard_configuration.enable_cloud_guard, oci_identity_policy.cg_policy]
}

resource "oci_cloud_guard_target" "cg_target" {
  compartment_id = var.tenancy_ocid
  display_name = "CloudGuard-target"
  state = "ACTIVE"
  target_detector_recipes {
    detector_recipe_id = data.oci_cloud_guard_detector_recipes.activity_detector_recipes.detector_recipe_collection[0].items.0.id
  }
  target_detector_recipes {
    detector_recipe_id = data.oci_cloud_guard_detector_recipes.activity_detector_recipes.detector_recipe_collection[0].items.1.id
  }
  target_resource_id   = var.tenancy_ocid
  target_resource_type = "COMPARTMENT"
  target_responder_recipes {
    responder_recipe_id = oci_cloud_guard_responder_recipe.Cloned-Responder.id
    responder_rules {
      details {

        mode = var.mode

      }
      responder_rule_id = "EVENT"
    }
  }
}

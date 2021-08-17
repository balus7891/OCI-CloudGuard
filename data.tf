data "oci_identity_policies" "test_policies" {
    #Required
    compartment_id = var.tenancy_ocid

    #Optional
    name = "CloudGuardPolicies"
    #state = var.policy_state
}

locals {
  policy_exist = try(lookup(zipmap(data.oci_identity_policies.test_policies.policies.*.name, data.oci_identity_policies.test_policies.policies.*.name), "CloudGuardPolicies"), "Not-found")
}

locals {
  policy_state = data.oci_identity_policies.test_policies.policies[*].state
}
/*
output "Cloudguard-policy"{
value = try(lookup(zipmap(data.oci_identity_policies.test_policies.policies.*.name, data.oci_identity_policies.test_policies.policies.*.name), "CloudGuardPolicies"), "Not-found")
}

output "policy_state" {
  value = formatlist("%v", data.oci_identity_policies.test_policies.policies[*].state)
}
*/
#####################################################################################################################
#CloudGuardPolicies

data "oci_cloud_guard_responder_recipes" "list_responder_recipes" {
  compartment_id = var.tenancy_ocid
  state          = "ACTIVE"
  display_name   = "OCI Responder Recipe"

  depends_on = [oci_cloud_guard_cloud_guard_configuration.enable_cloud_guard, oci_identity_policy.cg_policy]
}

data "oci_cloud_guard_detector_recipes" "config_detector_recipes" {

  compartment_id = var.tenancy_ocid
  state          = "ACTIVE"
  display_name   = "OCI Configuration Detector Recipe"

  depends_on = [oci_cloud_guard_cloud_guard_configuration.enable_cloud_guard, oci_identity_policy.cg_policy]
}


data "oci_cloud_guard_detector_recipes" "activity_detector_recipes" {

  compartment_id = var.tenancy_ocid
  state          = "ACTIVE"
  #display_name   = "OCI Activity Detector RecipeR"

  depends_on = [oci_cloud_guard_cloud_guard_configuration.enable_cloud_guard, oci_identity_policy.cg_policy]
}

/*
output "config_detector_recipes"{

value = data.oci_cloud_guard_detector_recipes.config_detector_recipes.detector_recipe_collection.0.items.0.id
}

output "activity_detector_recipes"{

value = data.oci_cloud_guard_detector_recipes.activity_detector_recipes.detector_recipe_collection[0].items.1.id
}
*/
output "Deployment-Output"{

value = "Sucessfully enabled Oracle Cloud Guard in the tenancy. Please check the inbox & authorize/confirm the subscription for email notification service. (if you enabled optional email notification)"
}

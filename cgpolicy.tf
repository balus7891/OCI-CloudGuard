
resource "oci_identity_policy" "cg_policy" {
  count = local.policy_exist == "Not-found" || local.policy_state != ["ACTIVE"] ? 1 : 0
    #Required
    compartment_id = var.tenancy_ocid
    description = "Policy for CloudGuard"
    name = "CloudGuardPolicies"
    statements = [
      "allow service cloudguard to read vaults in tenancy",
      "allow service cloudguard to read keys in tenancy",
      "allow service cloudguard to read compartments in tenancy",
      "allow service cloudguard to read tenancies in tenancy",
      "allow service cloudguard to read audit-events in tenancy",
      "allow service cloudguard to read compute-management-family in tenancy",
      "allow service cloudguard to read instance-family in tenancy",
      "allow service cloudguard to read virtual-network-family in tenancy",
      "allow service cloudguard to read volume-family in tenancy",
      "allow service cloudguard to read database-family in tenancy",
      "allow service cloudguard to read object-family in tenancy",
      "allow service cloudguard to read load-balancers in tenancy",
      "allow service cloudguard to read users in tenancy",
      "allow service cloudguard to read groups in tenancy",
      "allow service cloudguard to read policies in tenancy",
      "allow service cloudguard to read dynamic-groups in tenancy",
      "allow service cloudguard to read authentication-policies in tenancy",
      "allow service cloudguard to use network-security-groups in tenancy",
    ]
}

resource "null_resource" "previous" {}

resource "time_sleep" "wait_45_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "55s"
}

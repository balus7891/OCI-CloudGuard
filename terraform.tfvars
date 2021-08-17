
#Necessary fields to connect to your target OCI tenancy
#ssh_public_key   = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAkRO/LmxbJ0ZCOefcRwxVSN1THNNLzqU8lCX6FCOYCYBj+jqazL7vCEgxNP9UYQZOy6TxnW6oMjTZT05XN9u6cPK4hDPIepdwvfpiJIHTBOZL038M3NSA620mwzPKdHzOqbYjuq3WKAUPWKmBAeFDNprFxK3ReahngPqpKAN2s0f2pM9dM6qlqgVK2l2iaXe3acbv4sxFz8ljXTtSZUQQm/YAAtPimwgQ/Plhn/Cp2AbLUaXWM7K6BZeJ8mWQXcDPFAJYefTl6IUEP41+HwG5z0EE/5vdrWZHMv1HdHuEoeTVHk+orBUm1nWV2fpNqq4S7Dk9HYgK18h3+L9pzwGPoQ== Bala_Sunil_SSHkey"
tenancy_ocid     = "ocid1.tenancy.oc1..aaaaaaaaxn3r3dh.............r4wzlahs3u76c4enhckxhy4kpaa"
user_ocid        = "ocid1.user.oc1..aaaaaaaaxbo27v..........dil44br42ymwowq"
fingerprint      = "87:18:64:9a:45:3c:b1:07:02:25:5d:3f:53:d8:9d:fb"
private_key_path = "C:/Program Files/Git/root/.oci/oci_api_key.pem"   #Provide the path of api private key (This is windows format)
region           = "eu-amsterdam-1"
compartment_ocid = "ocid1.compartment.oc1..aaaaaaaav2idy.......ibfetpq"



#To enable Events and notification email for cloudguard detected problems, make ons_enabled = true else ons_enabled = false
ons_enabled = "true"

#Region where cloudguard needs to be enabled
cg_region = "eu-frankfurt-1"

#Email id which you want to send cloudguard Notification
email_id = "balasubramannyam.sunil@oracle.com"



variable "tenancy_ocid" {
  type = string

}
variable "user_ocid" {
  type = string

}
variable "fingerprint" {
  type = string

}
variable "private_key_path" {
  type = string

}
variable "region" {
  type    = string
  default = "eu-frankfurt-1"
}

variable "compartment_ocid" {
  type = string

}




###################################################################
#CG Variables


variable "prefix" {
  description = "Service Name"
  default     = "1"
}

variable "cg_region" {
  type    = string
  default = "eu-frankfurt-1"
}

variable "mode" {
  default = "AUTOACTION"
}

variable "email_id" {
  default = "balasubramannyam.sunil@oracle.com"
}

variable "ons_enabled" {
  type = bool
  default = "false"
}

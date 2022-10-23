variable "region" {
  type = map(any)
  default = {
    "us-payroll"    = "us-west-1"
    "uk-payroll"    = "us-west-2"
    "india-payroll" = "us-east-1"
  }

}
variable "ami" {
  type = map(any)
  default = {
    "us-payroll"    = "ami-02ea247e531eb3ce6"
    "uk-payroll"    = "ami-017fecd1353bcc96e"
    "india-payroll" = "ami-08c40ec9ead489470"
  }
}
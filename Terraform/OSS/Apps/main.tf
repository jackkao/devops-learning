module "payroll_app" {
  source     = "../../OSS/Modules"
  app_region = lookup(var.region, terraform.workspace)
  ami        = lookup(var.ami, terraform.workspace)

}

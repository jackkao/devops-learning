module "Modules" {
  source     = "../../../Module/Apps/Modules"
  app_region = "us-west-2"
  ami        = "ami-08e2d37b6a0129927"
}
module "subnet" {
  source       = "./modules/subnet/volcengine"
  project_name = var.project_name
  tags         = var.tags
}


module "alb_load_balancer" {
  source       = "./modules/alb_load_balancer/volcengine"
  project_name = var.project_name
  tags         = var.tags
}

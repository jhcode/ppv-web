data "credstash_secret" "password" {                                                                                                                                                                                                                          
  name = "${var.project}-${var.environment}-couchdb-password"                                                                                                                                                                                                       
}

module "peculiar-ppv" {
  source                    = "git::ssh://git@bitbucket.org/mettalloids/terraform-modules.git//generic_ecs_service"
  environment               = "${var.environment}"
  project                   = "${var.project}"
  data_dir                  = "/var/www/html/ppv-web"
  database_hostname         = "not_required"
  app                       = "peculiar-ppv"
  application_memory        = 128
  http_rule_priority        = 4
  domain                    = "peculiarppv.com"
  url                       = "www"
}

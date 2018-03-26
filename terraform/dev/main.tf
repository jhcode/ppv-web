data "credstash_secret" "password" {                                                                                                                                                                                                                          
  name = "${var.project}-${var.environment}-couchdb-password"                                                                                                                                                                                                       
}

data "credstash_secret" "hostname" {
  name = "${var.project}-${var.environment}-database-hostname"
}

module "peculiar-ppv" {
  source                    = "git::ssh://git@bitbucket.org/mettalloids/terraform-modules.git//generic_ecs_service"
  environment               = "${var.environment}"
  project                   = "${var.project}"
  data_dir                  = "/var/www/html/ppv-web"
  database_hostname         = "${data.credstash_secret.hostname.value}"
  app                       = "peculiar-ppv"
  application_memory        = 128
  http_rule_priority        = 4
  cert_domain               = "${var.cert_domain}"
  route_53_zone             = "${var.route_53_zone}"
  cluster                   = "${var.cluster}"
  http_listener_arn         = "${var.http_listener_arn}"
  https_listener_arn        = "${var.https_listener_arn}"
  domain                    = "dev.mettalloids.com"
  url                       = "peculiarppv"
}
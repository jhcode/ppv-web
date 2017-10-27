resource "aws_ecs_task_definition" "ppv" {
  family                = "picogauge-${var.env}"
  container_definitions = "${file("task-definitions/service.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  volume {
    name = "ppv-app"
    host_path = "/ecs/ppv-app"
  }
}

resource "aws_ecs_service" "ppv" {
  name            = "ppv-${var.env}-api"
  cluster         = "${aws_ecs_cluster.ppv.id}"
  task_definition = "${aws_ecs_task_definition.ppv.arn}"
  desired_count   = 1
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent = 200

  placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
}

resource "aws_ecs_task_definition" "ppv-nginx" {
  family                = "ppv-${var.env}-nginx"
  container_definitions = "${file("task-definitions/service-nginx.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage/nginx"
  }

  volume {
    name = "letsencrypt"
    host_path = "/ecs/letsencrypt"
  }

  volume {
    name = "ppv-app"
    host_path = "/ecs/ppv-app"
  }

  volume {
    name      = "ppv-website"
    host_path = "/ecs/ppv-website"
  }
}

resource "aws_ecs_service" "ppv-nginx" {
  name            = "ppv-${var.env}-nginx"
  cluster         = "${aws_ecs_cluster.ppv.id}"
  task_definition = "${aws_ecs_task_definition.ppv-nginx.arn}"
  desired_count   = 1
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent = 200

  placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
}

resource "aws_ecs_task_definition" "ppv-website" {
  family                = "ppv-${var.env}-website"
  container_definitions = "${file("task-definitions/service-ppv-website.json")}"

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage/ppv-website"
  }

  volume {
    name      = "ppv-website"
    host_path = "/ecs/ppv-website"
  }
}

resource "aws_ecs_service" "ppv-website" {
  name            = "ppv-${var.env}-website"
  cluster         = "${aws_ecs_cluster.ppv.id}"
  task_definition = "${aws_ecs_task_definition.ppv-website.arn}"
  desired_count   = 1
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent = 200

  placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
}

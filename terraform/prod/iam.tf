/* ecs iam role and policies */
resource "aws_iam_role" "ecs_role" {
  name               = "ppv-prod-ecs_role"
  assume_role_policy = "${file("policies/ecs-role.json")}"
}

/* ec2 container instance role & policy */
resource "aws_iam_role_policy" "ecs_instance_role_policy" {
  name     = "ppv-prod-ecs_instance_role_policy"
  policy   = "${file("policies/ecs-instance-role-policy.json")}"
  role     = "${aws_iam_role.ecs_role.id}"
}

/**
 * IAM profile to be used in auto-scaling launch configuration.
 */
resource "aws_iam_instance_profile" "ecs" {
  name = "ppv-prod-ecs-instance-profile"
  path = "/"
  role = "${aws_iam_role.ecs_role.name}"
}
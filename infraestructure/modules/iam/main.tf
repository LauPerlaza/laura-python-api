# Terraform Module to create IAM Rol and Police

#   #   # ECS Role Creation For ECS # #

resource "aws_iam_role" "ecs_role" {
  name = "ecs-role-${var.name_role}"
  assume_role_policy = jsonencode({

    "Version" = "2012-10-17",
    "Statement" = [
      {
        "Effect" = "Allow",
        "Principal" = {
          "Service" = "ecs-tasks.amazonaws.com"
        },
        "Action" = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = "ecs-role-${var.name_role}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
/*
# Definición del recurso IAM Policy
resource "aws_iam_policy" "policy_for_role" {
  name        = "ecs_Policy_${var.name_policy}"
  description = "Policy for Role ${var.name_policy}"
  policy      = var.policy
}
*/
# Adjunto de la política al rol IAM
resource "aws_iam_role_policy_attachment" "attachment_to_role" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.ecs_role.name

  lifecycle {
    create_before_destroy = true
  }
}




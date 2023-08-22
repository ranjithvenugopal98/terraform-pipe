resource "aws_lb" "ext-alb" {
  name               = "External-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demosg.id]
  subnets            = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}
resource "aws_lb_target_group" "target-elb" {
  name               = "ALB-TG"
  port               = 80
  protocol           = "HTTP"
  vpc_id             = aws_vpc.my-vpc.id
}
resource "aws_lb_target_group_attachment" "attachment" {
  target_group_arn   = aws_lb_target_group.target-elb.arn
  target_id          = aws_instance.terraform-2.id
  port               = 80
depends_on = [
  aws_instance.terraform-2,
]
}

resource "aws_lb_target_group_attachment" "attachment1" {
  target_group_arn   = aws_lb_target_group.target-elb.arn
  target_id          = aws_instance.terraform-3.id
  port               = 80
depends_on = [
  aws_instance.terraform-3,
]
}

resource "aws_lb_listener" "ext-alb" {
  load_balancer_arn  = aws_lb.ext-alb.arn
  port               = 80
  protocol           = "HTTP"
default_action {
   type              = "forward"
   target_group_arn  = aws_lb_target_group.target-elb.arn
}
}

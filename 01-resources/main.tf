terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "v5.21.0"
    }
  }
}


resource "aws_instance" "web" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z088606431E8311EPHBFV"
  name    = "test.malleswaridevops.online"
  type    = "A"
  ttl     = 30
  records = [ aws_instance.web.private_ip ]
}













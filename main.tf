//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/akentosh/ec2-instance/aws"
  version = "1.21.0"

  ami = "ami-0ff8a91507f77f867"
  instance_count = 1
  instance_type = "t2.micro"
  name = "adam"
  vpc_security_group_ids = "default"
}

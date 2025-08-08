variable "vpc_cidr" { default = "192.168.0.0/16" }
variable "key_name" { default = "goorm-keypair" }  # SSH 키 페어 이름
variable "ami_id" { default = "ami-0811349cae530179a" }  # Amazon Linux 2 AMI, 필요 시 data로 자동화

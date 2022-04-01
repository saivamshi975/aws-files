variable "vpc_cidr"{
   default = "10.0.0.0/16"
   }
variable "pub_sn_cidr"{
   default = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
   }
variable "prv_sn_cidr"{
   default = ["10.0.3.0/24","10.0.4.0/24","10.0.5.0/24"]
   }
variable "azs"{
   default = ["ap-southeast-2a","ap-southeast-2b","ap-southeast-2c"]
   }
   
resource aws_vpc "vpc1" {
   cidr_block = var.vpc_cidr
   tags = {
   "Name" = "myvpc-1"
   }

resource aws_subnet "sn1" {
   count = length(var.pub_sn_cidr)
   vpc_id = aws_vpc.vpc1.id
   cidr_block = var.pub_sn_cidr[count.index]
   }
resource aws_subnet "sn4" {
   count = length(var.prv_sn_cidr)
   vpc_id = aws_vpc.vpc1.id
   cidr_block = var.prv_sn_cidr[count.index]
   }
   
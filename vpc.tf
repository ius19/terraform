resource "aws_vpc" "vm2_vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "vm2_vpc"
  }
}

resource "aws_subnet" "vm2_subnet" {
  vpc_id                  = aws_vpc.vm2_vpc.id
  cidr_block              = var.cidr_block
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "vm2_subnet"
  }
}


resource "aws_security_group" "vm2_SG" {
  vpc_id      = aws_vpc.vm2_vpc.id
  name        = "vm2_security_group"
  description = "This SG is created for testing the the connection of vm"

  # allowing inbound traffic
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "allow inbound ssh traffic"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
    },

    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow inbound icmp traffic"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "icmp"
      security_groups  = []
      self             = false
      to_port          = 0
    },

    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow all inbound tcp traffic"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 0
    }

  ]

  # allowing outbound traffic
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow all outbound traffic"
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]


  tags = {
    Name = "vm2_SG"
  }
}

resource "aws_internet_gateway" "vm2_IGW" {
  vpc_id = aws_vpc.vm2_vpc.id

  tags = {
    Name = "vm2_IGW"
  }
}

resource "aws_default_route_table" "vm2_DRT" {
  default_route_table_id = aws_vpc.vm2_vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vm2_IGW.id
  }

  tags = {
    Name = "vm2_DRT"
  }

}
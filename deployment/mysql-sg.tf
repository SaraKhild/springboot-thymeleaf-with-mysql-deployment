resource "alicloud_security_group" "mysql-sg" {
  description = "mysql security group"
  vpc_id      = alicloud_vpc.vpc.id
}
resource "alicloud_security_group_rule" "allow-mysql-to-ssh" {
  type                     = "ingress"
  ip_protocol              = "tcp"
  policy                   = "accept"
  port_range               = "22/22"
  priority                 = 1
  security_group_id        = alicloud_security_group.mysql-sg.id
  source_security_group_id = alicloud_security_group.bastion-sg.id
}


resource "alicloud_security_group_rule" "allow-employee-to-mysql" {
  type                     = "ingress"
  ip_protocol              = "tcp"
  policy                   = "accept"
  port_range               = "3306/3306"
  priority                 = 1
  security_group_id        = alicloud_security_group.mysql-sg.id
  source_security_group_id = alicloud_security_group.employee-sg.id
}
resource "aws_efs_file_system" "wordpress_efs" {
  creation_token   = "wordpress-efs"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true
  tags = {
    Name = "wordpress-efs"
  }

}

resource "aws_efs_mount_target" "wordpress_efs_mount_target" {
  for_each = {
    subnet_a = aws_subnet.privada-app-A.id
    subnet_b = aws_subnet.privada-app-B.id
  }
  file_system_id  = aws_efs_file_system.wordpress_efs.id
  security_groups = [aws_security_group.efs_sg.id]
  subnet_id       = each.value
}
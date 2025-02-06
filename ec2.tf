
# Lançamento de Template para a Instância WordPress
resource "aws_launch_template" "wordpress_template" {
  name_prefix   = "wordpress-template-"   # Prefixo para evitar conflitos de nomes
  image_id      = "ami-0c614dee691cbbf37" # ID da sua AMI
  instance_type = "t2.micro"              # Tipo de instância
  key_name      = "wordpress-key"         # Nome da chave SSH

  # Perfil IAM associado à instância
  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_instance_profile.name # Perfil IAM
  }

  # Configurações de rede da instância
  network_interfaces {
    subnet_id                   = aws_subnet.privada-app-A.id          # Sub-rede privada A
    security_groups             = [aws_security_group.wordpress_sg.id] # Grupo de segurança
    associate_public_ip_address = false                                # Não associar IP público em sub-redes privadas
  }

  # Especificações de tags para a instância e volume
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name       = "PB - NOV 2024"
      CostCenter = "C092000024"
      Project    = "PB - NOV 2024"
    }
  }

  tag_specifications {
    resource_type = "volume"
    tags = {
      Name       = "PB - NOV 2024"
      CostCenter = "C092000024"
      Project    = "PB - NOV 2024"
    }
  }

  # User data para inicialização (configuração personalizada)
  user_data = base64encode(templatefile("${path.module}/userdata.sh", {
    db_endpoint = aws_db_instance.rds.endpoint               # Endpoint do RDS
    efs_dns     = aws_efs_file_system.wordpress_efs.dns_name # DNS do EFS
  }))
}

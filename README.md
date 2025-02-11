# 📚 Atividade 2 Docker PB - NOV 2024 Turma DevSecOps

## 🌐 Projeto Terraform para Infraestrutura AWS

## 📄 Descrição

Este projeto foi desenvolvido com o objetivo de criar uma infraestrutura robusta e escalável na AWS, garantindo alta disponibilidade para a aplicação WordPress. Utilizando uma combinação de tecnologias modernas, conseguimos proporcionar uma solução eficiente e resiliente, capaz de atender a demandas variáveis de tráfego e garantir a continuidade do serviço. Decidimos utilizar Terraform para provisionar uma infraestrutura na AWS, uma ferramenta muito conhecida e com uma documentação muito abrangente. Infraestrutura como código (IaC) que o provisionamento e o gerenciamento de recursos de infraestrutura de maneira declarativa e automatizada.

- **Amazon Web Services (AWS):** Plataforma de serviços em nuvem que oferece uma ampla gama de serviços de computação, armazenamento e rede.
- **VPC (Virtual Private Cloud):** Rede virtual isolada onde todos os recursos são provisionados, garantindo segurança e controle de tráfego.
- **EC2 (Elastic Compute Cloud):** Instâncias de servidores virtuais que hospedam a aplicação WordPress.
- **Auto Scaling Group (ASG):** Mecanismo que ajusta automaticamente o número de instâncias EC2 em resposta à demanda de tráfego, garantindo escalabilidade e alta disponibilidade.
- **Elastic Load Balancer (ELB):** Distribui o tráfego de entrada entre várias instâncias EC2, assegurando balanceamento de carga e redundância.
- **RDS (Relational Database Service):** Banco de dados relacional gerenciado, utilizado para armazenar os dados da aplicação WordPress com alta disponibilidade e backups automáticos.
- **EFS (Elastic File System):** Sistema de arquivos distribuído e escalável, permitindo armazenamento compartilhado entre múltiplas instâncias EC2.
- **Docker:** Facilita a criação, implantação e execução de aplicações em contêineres, garantindo consistência e portabilidade.
- **Docker Compose:** Simplifica a configuração e a orquestração dos serviços.

## 🏗️ Arquitetura de Alta Disponibilidade

A arquitetura foi projetada para garantir alta disponibilidade e resiliência, utilizando os seguintes componentes:

- **Multi-AZ Deployment:** Recursos distribuídos em múltiplas zonas de disponibilidade (AZs) para garantir redundância e tolerância a falhas.
- **Auto Scaling:** Ajuste automático da capacidade de computação com base na demanda, garantindo que a aplicação possa lidar com picos de tráfego sem interrupções.
- **Load Balancing:** Distribuição eficiente do tráfego de rede entre as instâncias EC2, assegurando que nenhuma instância fique sobrecarregada.
- **Escalabilidade:** Capacidade de escalar automaticamente os recursos de computação para atender a variações de demanda.
- **Resiliência:** Arquitetura distribuída e redundante que garante a continuidade do serviço mesmo em caso de falhas em componentes individuais.
- **Eficiência Operacional:** Automação de tarefas de provisionamento, configuração e gerenciamento de infraestrutura, reduzindo a carga operacional e minimizando erros humanos.

## 🚀 Pré-requisitos

- Instale o [Terraform](https://www.terraform.io/downloads.html) v1.10.5 ou superior
- Conta AWS com permissões adequadas
- Chave SSH para acesso às instâncias EC2

## 💻 Instalação

1. Clone o repositório:
    ```sh
    git clone https://github.com/JulioMourajr/Compass-PB-NOV2024-Docker
    cd Compass-PB-NOV2024-Docker
    ```

2. Inicialize o Terraform:
    ```sh
    terraform init
    ```

## ⚙️ Configuração

1. Crie um arquivo `terraform.tfvars` com as variáveis necessárias:
    ```ini
    aws_access_key = "sua_chave_de_acesso"
    aws_secret_key = "sua_chave_secreta"
    region         = "us-east-1"
    ```

2. Ajuste as variáveis no arquivo [variables.tf](https://medium.com/@habbema/terraform-variables-e2f46ebe3f32) conforme necessário.

## 🛠️ Uso

1. Planeje a infraestrutura:
    ```sh
    terraform plan
    ```

2. Aplique a infraestrutura:
    ```sh
    terraform apply -auto-approve
    ```

## 🏗️ Arquitetura

![Arquitetura do Projeto](./Arquitetura.png)

### Recursos Provisionados

- **VPC:** Rede virtual para isolar a infraestrutura.
- **Subnets:** Sub-redes públicas e privadas.
- **Security Groups:** Controle de acesso para os recursos.
- **EC2 Instances:** Instâncias para hospedar o WordPress.
- **Auto Scaling Group:** Escalonamento automático das instâncias.
- **Elastic Load Balancer:** Distribuição de tráfego.
- **RDS:** Banco de dados relacional para o WordPress.
- **EFS:** Sistema de arquivos para armazenamento compartilhado.

![Arquitetura do Projeto 2](./Rotas.png)

![Arquitetura do Projeto 2](./ALB.png)

![Arquitetura do Projeto 2](./Arquirtetura2.png)

## 📈 Melhorias

### Monitoramento

Implementar um sistema de monitoramento robusto utilizando Prometheus e Grafana para garantir a observabilidade da aplicação. Com o Prometheus, é possível coletar métricas detalhadas sobre o desempenho e a saúde dos componentes da infraestrutura. O Grafana, por sua vez, permite a criação de dashboards interativos e visualizações personalizadas, facilitando a análise e a identificação de possíveis problemas.

### Modularização

Refatorar o código Terraform para utilizar módulos. A criação de módulos permitirá a reutilização de componentes de infraestrutura em diferentes projetos, facilitando a manutenção e a escalabilidade do código. Por exemplo, criar módulos para VPC, sub-redes, grupos de segurança, instâncias EC2, Auto Scaling, Load Balancer, RDS e EFS.

### Recurso Data

Utilizar o recurso `data` do Terraform para obter informações sobre recursos existentes na AWS. Isso permitirá que o código seja mais dinâmico e adaptável a diferentes ambientes, sem a necessidade de hardcoding de valores. Por exemplo, obter IDs de AMIs, VPCs, sub-redes e grupos de segurança existentes.

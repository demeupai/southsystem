## DESAFIO DEV OPS - SOUTH 
### Challenge
* Provisioning EKS cluster. (Ok)
* Provisioning and deploy a data structure store (like MongoDB or Redis) (Ok)
* Deploy a test app image (don’t need to create the image). (Ok)
* Configure auto scaling. (Ok)
* Expose the endpoint test through web. 
* Create automated test to check the endpoint. (Ok)
### Requirements
* Use AWS cloud. (Ok)
* The provisioning should be infra as code. (Ok) 
* The code should be idempotent. (Ok)
* The image should be deployed through Jenkins pipeline. 
* Submit the code to Github. (Ok)
* Create usability instructions on readme file. (Ok)

______
# Como validar a solução

### Requisitos
É necessário dois binários para build do projeto

| Binário | Download |
| ------ | ------ |
| Terraform | https://www.terraform.io/downloads.html |
| Kubectl | https://v1-18.docs.kubernetes.io/docs/tasks/tools/install-kubectl/ |

Há três diretórios na raiz do projeto, um com o código necessário para subir o cluster k8s em na solução de EKS da aws. Para subir este projeto é necessário executar os comandos abaixo.
### Terraform
Ajuste o arquivo abaixo conforme a tabela, para poder realizar o deploy do ambiente.
```sh
$ cd terraform/aws
```
##### terraform.tfvars
| Campoo | Valor |
| ------ | ------ |
| aws_access_key | Valor |
| aws_secret_key | Valor |
| rancher_server_admin_password | Valor |

```sh
$ terraform init
$ terraform plan
$ terraform apply
```

#### Acessando o cluster via Web UI
Ao final do processo será informado a URL de acesso ao rancher server, vamos acessa-lo com a senha que definimos anteriormente. 
#### Acessando o cluster a partir do kubeconfig
Vamos copiar o conteúdo do kubeconfig do cluster e adicionar no nosso config local, por padrão o conf está em 
```sh
kubectl get nodes --kubeconfig aws/kube_config_workload.yaml
```
# Deploy dos manifestos 
Vamos acessar a pasta raiz do projeto e acessar o diretório 
```sh
$ cd manifest_k8s/
$ kubectl apply -f app-health.yml --kubeconfig ../terraform/aws/kube_config_workload.yaml
$ kubectl apply -f app-hpa.yml --kubeconfig ../terraform/aws/kube_config_workload.yaml
$ kubectl apply -f bd-redis.yml --kubeconfig ../terraform/aws/kube_config_workload.yaml
```

## Manifestos YML
#### app-health
Foi utilizado uma imagem padrão para utilização do liveness que escuta no respectivo path e porta, a partir de uma imagem padrão para esta finalidade.
#### app-hpa
Foi configurado HPA, um deployment e um service para uma aplicação padrão para este conceito.

## Deploy aplicação utilizando jenkins
Vamos configurar a interação do Jenkins com o Github, com base na documentação abaixo
- https://rancher.com/docs/rancher/v2.x/en/admin-settings/authentication/github/




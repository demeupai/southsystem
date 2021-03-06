# Required variables
# - Fill in before beginning south
# ==========================================================

# AWS Access Key
aws_access_key = ""

# AWS Secret Key
aws_secret_key = ""

# Password used to log in to the `admin` account on the new Rancher server
rancher_server_admin_password = ""


# Optional variables, uncomment to customize the south
# ----------------------------------------------------------

# AWS region for all resources
# aws_region = "" q

# Prefix for all resources created by south
# prefix = ""

# EC2 instance size of all created instances
# instance_type = ""

# Docker version installed on target hosts
# - Must be a version supported by the Rancher install scripts
# docker_version = ""

# Kubernetes version used for creating management server cluster
# - Must be supported by RKE terraform provider 1.0.1
# rke_kubernetes_version = ""

# Kubernetes version used for creating workload cluster
# - Must be supported by RKE terraform provider 1.0.1
# workload_kubernetes_version = ""

# Version of cert-manager to install, used in case of older Rancher versions
# cert_manager_version = ""

# Version of Rancher to install
# rancher_version = ""


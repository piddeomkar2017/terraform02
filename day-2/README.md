terraform apply -auto-approve
terraform plan -var="instance_type=t2.nano"
export TF_VAR_instance_type="t3.micro"
terraform plan -var-file=dev-var.tfvars 
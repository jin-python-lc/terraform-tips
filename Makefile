# do export AWS_PROFILE=terraform@local2 before use
fmt:
	@terraform fmt
init:
	@terraform init -backend-config=./config/dev/ap-northeast-1.backend -upgrade
plan:
	@terraform plan -var-file=./config/dev/ap-northeast-1.tfvars
	@terraform plan -var-file=./config/dev/ap-northeast-1.tfvars -no-color > plan.txt
state:
	@terraform state list
apply:
	@terraform apply -var-file=./config/dev/ap-northeast-1.tfvars
destroy:
	@terraform destroy -var-file=./config/dev/ap-northeast-1.tfvars
init:
	@terraform init -backend-config=./config/dev/ap-northeast-1.backend -upgrade
plan:
	@terraform plan -var-file=./config/dev/ap-northeast-1.tfvars
	@terraform plan -var-file=./config/dev/ap-northeast-1.tfvars -no-color > plan.txt
state:
	@terraform state list
terraform-apply:
	eval $(egrep -v '^#' .env | xargs) terraform apply

terraform-plan:
	"$(grep -v '^#' .env | xargs)" terraform plan

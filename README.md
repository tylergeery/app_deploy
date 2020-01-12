# app_deploy
Infrastructure to deploy multi-tenant apps across cloud providers

## SSH servers help
```bash
terraform show -json | jq .values | grep public_dns
ssh -i credentials/aws-mini <public_dns>
```

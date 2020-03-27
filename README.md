# app_deploy
Infrastructure to deploy multi-tenant apps across cloud providers

## SSH servers help
```bash
# Example for aws-mini
terraform show -json | jq .values.root_module.resources[0].values.public_dns
ssh -i aws-mini ubuntu@<public_dns>
```

### TodoList
- Add certificate for base/naked domain (geerydev.com)
- Sync application code with server (ansible deploy)
- Add deploy playbooks or CLI to other repos
- Handle graceful deploys (rolling) `nginx reload -s`

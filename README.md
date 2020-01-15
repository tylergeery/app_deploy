# app_deploy
Infrastructure to deploy multi-tenant apps across cloud providers

## SSH servers help
```bash
terraform show -json | jq .values | grep public_dns
ssh -i credentials/aws-mini <public_dns>
```

### TODO
- Create from root directory
  - Add to makefile
- Sync application code with server
  - Ansible?
  - Rsync
  - Parse public DNS from terraform state
- Run deploy commands on server
  - Rust Image Analyzer
- Add DNS for app
  - Reuse geerydev?
- Set up Reverse Proxy on server
  - Deploy
  - Handle vhosts
  - SSL certs
- Create Configuration File for deploy commands on server
- Handle graceful deploys (rolling)
- Add ability for others to sync state

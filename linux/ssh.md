# 禁用 StrictHostKeyChecking
ssh -o "StrictHostKeyChecking no" user@host

# 写入 `known_hosts`
`ssh-keyscan github.com >> /root/.ssh/known_hosts`

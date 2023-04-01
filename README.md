# Docker-Action-Runner  
## Create image
`docker build -t gh-action-runner .`
## Run container
`docker run --rm -it gh-action-runner`
## Enter into terminal  
### Template  
`C:/actions-runner/config.cmd --url 'repo-url' --pat 'personal access token' --unattended --replace --name Windows --work _work --labels 'self-hosted','Windows','X64' && C:/actions-runner/run.cmd`

### Example  
`C:/actions-runner/config.cmd --url https://github.com/octocat/Hello-World --pat kaTGzR37o06R95W9p9bO --unattended --replace --name Windows --work _work --labels 'self-hosted','Windows','X64' && C:/actions-runner/run.cmd`

# Working output
![Terminal showing runner registration](https://user-images.githubusercontent.com/55410510/229319402-05295004-994e-4822-aecc-9ab59a2466dd.png)

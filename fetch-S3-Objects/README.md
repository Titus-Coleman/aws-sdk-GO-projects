## Project Goals
- This repo is for reference / testing only
- Testing Terraform resource plans specific to S3
- Testing AWS-SDK-GO for basic fetching from S3



### Get-Objects
- touch main.go
- import aws-sdk-go modules
- go mod init [insert name for module]
- go get github.com/aws/aws-sdk-go-v2
- go get github.com/aws/aws-sdk-go-v2/config
- go get github.com/aws/aws-sdk-go-v2/service/s3
- go mod tidy

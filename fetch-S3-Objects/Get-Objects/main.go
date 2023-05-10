package main

import (
	"context"
	"fmt"
	"log"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/s3"
)

func main() {
	//loads AWS Config
	cfg, err := config.LoadDefaultConfig(context.TODO(), config.WithSharedConfigProfile("default"))
	fmt.Println(err)
	// init s3 client
	client := s3.NewFromConfig(cfg)

	//ListObjectsV2 called to pull objects from bucket named in aws.String("")
	output, err := client.ListObjectsV2(context.TODO(), &s3.ListObjectsV2Input{

		//  - manual for now - needs refactor to auto pull from terraform output
		Bucket: aws.String("public-test-bucket-20230510003313335300000001"),
	})
	for _, object := range output.Contents {
		log.Printf("key=%s size=%d", aws.ToString(object.Key), object.Size)
	}

}

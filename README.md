# demo
graph TD
    VPC["VPC"]
    SubnetA["Subnet A (Public)"]
    SubnetB["Subnet B (Private)"]
    Lambda["Lambda Function"]
    S3["S3 Bucket"]

    VPC --> SubnetA
    VPC --> SubnetB
    SubnetB --> Lambda
    Lambda --> S3

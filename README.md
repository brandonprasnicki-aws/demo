# demo mermaid test

flowchart TD
    %% VPC Layer
    VPC[VPC]

    %% Subnets
    SubnetA[Subnet A (Public)]
    SubnetB[Subnet B (Private)]

    %% Resources
    Lambda[Lambda Function]
    S3[S3 Bucket]
    APIGW[API Gateway]

    %% Connections
    VPC --> SubnetA
    VPC --> SubnetB
    SubnetA --> APIGW
    SubnetB --> Lambda
    APIGW --> Lambda
    Lambda --> S3

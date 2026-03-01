# demo mermaid test

flowchart TD
    %% VPC Layer
    VPC["VPC"]

    %% Subnets
    SubnetA["Subnet A (Public)"]
    SubnetB["Subnet B (Private)"]

    %% Resources
    Lambda["Lambda Function"]
    S3["S3 Bucket"]
    APIGW["API Gateway"]

    %% Connections
    VPC --> SubnetA
    VPC --> SubnetB
    SubnetA --> APIGW
    SubnetB --> Lambda
    APIGW --> Lambda
    Lambda --> S3

    %% Styling for clarity
    style VPC fill:#f9f,stroke:#333,stroke-width:2px
    style SubnetA fill:#ccf,stroke:#333,stroke-width:1px
    style SubnetB fill:#ccf,stroke:#333,stroke-width:1px
    style Lambda fill:#9f9,stroke:#333,stroke-width:2px
    style S3 fill:#fc9,stroke:#333,stroke-width:2px
    style APIGW fill:#ff9,stroke:#333,stroke-width:2px

# demo mermaid test

\```mermaid
flowchart TD
    %% VPC
    VPC[VPC]

    %% Subnets
    SubnetA[Subnet A (Public)]
    SubnetB[Subnet B (Private)]

    %% Instances
    Instance1[EC2 Instance 1]
    Instance2[EC2 Instance 2]

    %% Target Group / Load Balancer
    TG[Target Group]
    LB[Application Load Balancer]

    %% Connections
    VPC --> SubnetA
    VPC --> SubnetB
    SubnetA --> LB
    LB --> TG
    TG --> Instance1
    TG --> Instance2
    SubnetB --> Instance1
    SubnetB --> Instance2
\```

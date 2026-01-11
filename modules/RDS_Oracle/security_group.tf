/*resource "aws_security_group" "RDSSecurityGroup" {
    description = "allows access to DB from app sg"
    name = "${var.aws_account_name}.${var.aws_region}.rds.sg.portal"
    tags = {

    }
    vpc_id = var.vpc_id
    ingress {
       from_port   = var.port
       to_port     = var.port
       protocol    = "tcp"
       security_groups = [var.app_security_group_ingress]
    }
    ingress {
       from_port   = var.sslport
       to_port     = var.sslport
       protocol    = "tcp"
       security_groups = [var.app_security_group_ingress]
    }
    egress {
        cidr_blocks = [
            "0.0.0.0/0"
        ]
        from_port = 0
        protocol = "-1"
        to_port = 0
    }
}

 */
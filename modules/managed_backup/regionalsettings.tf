
####################
#Regardless of the account configuration, using this module enables the Managed Backup for the supported resources type 
###################

resource "aws_backup_region_settings" "main" {
  resource_type_opt_in_preference = {
    "DynamoDB"        = true
    "Aurora"          = true
    "EBS"             = true
    "EC2"             = true
    "EFS"             = true
    "FSx"             = true
    "RDS"             = true
    "Storage Gateway" = true
    "DocumentDB"      = true
    "Neptune"         = true
    "VirtualMachine"  = true
    "S3"              = true
    "CloudFormation"  = true
    "Redshift"        = true
    "Redshift Serverless"    = false
    "SAP HANA on Amazon EC2" = true
    "Timestream"             = true
    "DSQL"                   = false
  }
}
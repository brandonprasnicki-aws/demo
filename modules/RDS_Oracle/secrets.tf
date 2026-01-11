# This key should be created ahead of time with password set
resource "aws_secretsmanager_secret_version" "DBdetails" {
secret_id = var.secret_id
secret_string = <<EOF
{
"username": "${aws_db_instance.RDSDBInstance.username}",
"dbname": "${aws_db_instance.RDSDBInstance.db_name}",
"host": "${aws_db_instance.RDSDBInstance.endpoint}",
"password": "${jsondecode(data.aws_secretsmanager_secret_version.rdscredentials.secret_string)["password"]}",
"port": "${aws_db_instance.RDSDBInstance.port}",
"dbInstanceIdentifier": "${aws_db_instance.RDSDBInstance.identifier}",
"engine": "${aws_db_instance.RDSDBInstance.engine}"
}
EOF
// ignore any updates to the initial values above done after creation.
lifecycle {
    ignore_changes = [
    secret_string
    ]
}
}

data "aws_secretsmanager_secret_version" "rdscredentials" {secret_id = var.secret_id}
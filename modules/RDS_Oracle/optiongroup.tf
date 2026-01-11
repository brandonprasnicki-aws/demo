resource "aws_db_option_group" "RDSOptionGroup" {
    name = var.option_group_name
    engine_name = var.engine
    major_engine_version = var.major_engine_version
    option_group_description = "Option Group for Oracle Database"
#    option {
#        option_name = "APEX"
#        version = "19.1.v1"
#    }
#    option {
#        option_name = "TDE"
#    }
    option {
        option_name = "S3_INTEGRATION"
        version = "1.0"
    }
#    option {
#        option_name = "UTL_MAIL"
#    }
#    option {
#        option_name = "JVM"
#    }
#    option {
#        option_name = "Timezone"
#
#        option_settings {
#            name = "TIME_ZONE"
#            value = "UTC"
#        }
#    }
#    option {
#        option_name = "SSL"
#        port = var.sslport
#        vpc_security_group_memberships = [var.app_security_group_ingress]
#        option_settings {
#
#            name = "SQLNET.CIPHER_SUITE"
#            value = "SSL_RSA_WITH_AES_256_CBC_SHA"
#        }
#    }
#    option {
#        option_name = "SSL"
#
#        option_settings {
#            name = "SQLNET.SSL_VERSION"
#            value = "1.0"
#        }
#    }
#    option {
#        option_name = "SSL"
#
#        option_settings {
#            name = "FIPS.SSLFIPS_140"
#            value = "false"
#        }
#    }
#    option {
#        option_name = "STATSPACK"
#    }
#    option {
#        option_name = "SQLT"
#        version = "2018-07-25.v1"
#        option_settings {
#            name = "LICENSE_PACK"
#            value = "N"
#        }
#    }
#    option {
#        option_name = "OEM"
#        port = var.OEMport
#        vpc_security_group_memberships = [var.app_security_group_ingress]
#    }
#    option {
#        option_name = "LOCATOR"
#    }
#    option {
#        option_name = "JVM"
#    }
}
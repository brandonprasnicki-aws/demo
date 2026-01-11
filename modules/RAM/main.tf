locals {
  additional_common_tags = {
    Module = "RAM"
  }
  common_tags = merge(var.common_tags, local.additional_common_tags)
}

resource "aws_ram_resource_share" "share" {
  name                      = var.share_name
  allow_external_principals = var.allow_external_principals
  tags = merge(
    local.common_tags,
    {
      "Name" = var.share_name
    },
  )
}


resource "aws_ram_principal_association" "this" {
  principal          = var.target_account
  resource_share_arn = aws_ram_resource_share.share.arn
}

resource "aws_ram_resource_association" "this" {
  resource_arn       = var.tgw_arn
  resource_share_arn = aws_ram_resource_share.share.arn
}
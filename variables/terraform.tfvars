tenant_id = "fb973a23-5188-45ab-b4fb-277919443584"
infrastructure_client_id = "12a25e77-8484-41ff-98c1-e58557bdf161"
infra_client_ent_app__object_id = "9bcf1bd1-59a7-4b70-a5a2-52931d9238d8"

resource_groups_map = {
  "rg-tax-uksouth-alteryx" = {
    name     = "rg-tax-uksouth-alteryx"
    location = "UK South"
  }
  "rg-tax-ukwest-alteryx" = {
    name     = "rg-tax-ukwest-alteryx"
    location = "UK West"
  }
  "rg-tax-uksouth-pagero" = {
    name     = "rg-tax-uksouth-pagero"
    location = "UK South"
  }
  "rg-tax-ukwest-pagero" = {
    name     = "rg-tax-ukwest-pagero"
    location = "UK West"
  }
  "rg-tax-uksouth-network" = {
    name     = "rg-tax-uksouth-network"
    location = "UK South"
  }
  "rg-tax-ukwest-network" = {
    name     = "rg-tax-ukwest-network"
    location = "UK West"
  }
  "rg-tax-uksouth-amexpagero" = {
    name     = "rg-tax-uksouth-amexpagero"
    location = "UK South"
  }
}

keyvault_map = {
  "kv-tax-uks-alteryx" = {
    keyvault_name       = "kv-tax-uks-alteryx"
    resource_group_name = "rg-tax-uksouth-alteryx"
    location            = "UK South"
    private_endpoint = {
      name                  = "dev-priv-nic-tax-uksouth-0001"
      subnet_name           = "snet-tax-uksouth-keyvault"
      virtual_network_name  = "vnet-tax-uksouth-0001"
      private_dns_zone_name = "privatelink.vaultcore.azure.net"
      static_ip = null
    }
  }
  "kvtaxukspagero" = {
    keyvault_name       = "kvtaxukspagero"
    resource_group_name = "rg-tax-uksouth-pagero"
    location            = "UK South"
    private_endpoint = {
      name                  = "dev-priv-nic-tax-uksouth-0001"
      subnet_name           = "snet-tax-uksouth-keyvault"
      virtual_network_name  = "vnet-tax-uksouth-0001"
      private_dns_zone_name = "privatelink.vaultcore.azure.net"
      static_ip = null
    }
  }
  "kv-tax-uks-amexpagero" = {
    keyvault_name       = "kv-tax-uks-amexpagero"
    resource_group_name = "rg-tax-uksouth-amexpagero"
    location            = "UK South"
    private_endpoint = {
      name                  = "pe-kv-tax-uks-amexpagero"
      subnet_name           = "snet-tax-uksouth-amexpagero"
      virtual_network_name  = "vnet-tax-uksouth-0001"
      private_dns_zone_name = "privatelink.vaultcore.azure.net"
      static_ip = null
    }
  }
}

EntraID_Groups = {
  "Tax_Pagero_StorageReader" = {
    group_name       = "Tax_Pagero_StorageReader"
    security_enabled = true
  }
  "Tax_Pagero_Keyvault_Secrets_Officer" = {
    group_name       = "Tax_Pagero_Keyvault_Secrets_Officer"
    security_enabled = true
  }
  "Tax_AMEXPagero_KeyVault_Access" = {
    group_name       = "Tax_AMEXPagero_KeyVault_Access"
    security_enabled = true
  }
  "Tax_AMEXPagero_Storage_Access" = {
    group_name       = "Tax_AMEXPagero_Storage_Access"
    security_enabled = true
  }
}

storage_accounts = {
  "sttaxukspagero" = {
    name                          = "sttaxukspagero"
    resource_group_name           = "rg-tax-uksouth-pagero"
    location                      = "UK South"
    account_kind                  = "StorageV2"
    account_tier                  = "Standard"
    account_replication_type      = "GRS"
    public_network_access_enabled = false
    is_hns_enabled                = true
    sftp_enabled                  = true
    private_endpoint_enabled      = true
    sftp_local_users = {
      "accountone" = {
        name              = "accountone"
        keyvault          = "kvtaxukspagero"
        permission_create = true
        permission_delete = true
        permission_list   = true
        permission_read   = true
        permission_write  = true
      }
    }
  }
  "sttaxuksamexpagero" = {
    name                          = "sttaxuksamexpagero"
    resource_group_name           = "rg-tax-uksouth-amexpagero"
    location                      = "UK South"
    account_kind                  = "StorageV2"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    is_hns_enabled                = false
    sftp_enabled                  = false
    public_network_access_enabled = false
    private_endpoint_enabled      = true
    sftp_local_users              = {}
  }
}
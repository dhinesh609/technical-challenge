resource "azurerm_sql_server" "sql" {
    name = var.database
    resource_group_name = var.resource_group
    location = var.location
    version = var.database_version
    administrator_login = var.database_admin
    administrator_login_password = var.database_password
}

resource "azurerm_sql_database" "db" {
  name                = "db"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_sql_server.sql.name
}


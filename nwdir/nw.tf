variable "prefix" {}
variable "location" {}
variable "rsg" {}
variable "subnet" {} 

resource "azurerm_public_ip" "test1" {
  name                = "acceptanceTestPublicIp1"
  location            = "${var.location}"
  resource_group_name = "${var.rsg}"
  allocation_method   = "Dynamic"
}

resource "azurerm_public_ip" "test2" {
  name                = "acceptanceTestPublicIp2"
  location            = "${var.location}"
  resource_group_name = "${var.rsg}"
  allocation_method   = "Dynamic"
}


resource "azurerm_network_interface" "main1" {
  name                = "${var.prefix}-nic1"
  location            = "${var.location}"
  resource_group_name = "${var.rsg}"
 

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${var.subnet}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.test1.id}"
  }
}


resource "azurerm_network_interface" "main2" {
  name                = "${var.prefix}-nic2"
  location            = "${var.location}"
  resource_group_name = "${var.rsg}"


  ip_configuration {
    name                          = "testconfiguration2"
    subnet_id                     = "${var.subnet}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.test2.id}"
  }
}


output "interface1" {
	value = ["${azurerm_network_interface.main1.id}"]
}

output "interface2" {
        value = ["${azurerm_network_interface.main2.id}"]
}


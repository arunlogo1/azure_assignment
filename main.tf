provider "azurerm" {

  version = "=1.34.0"
}

variable "prefix" {
  default = "skylab"
}
// create a virtual network and subnets

module "vnazure" {
	prefix = "${var.prefix}"
	source = "./vndir"
}

// Create a  network interface with subnet id 

module "nwinterface" {
	prefix = "${var.prefix}"
	location = "${module.vnazure.location}"
	rsg = "${module.vnazure.rsg}"
	subnet = "${module.vnazure.subnet}"
	source = "./nwdir"
}

//create a machine1

module "machine1" {
	prefix = "${var.prefix}"
        location = "${module.vnazure.location}"
        rsg = "${module.vnazure.rsg}"
	interface = "${module.nwinterface.interface1}"
	source = "./machine1"

}


//create a machine2

module "machine2" {
        prefix = "${var.prefix}"
        location = "${module.vnazure.location}"
        rsg = "${module.vnazure.rsg}"
        interface = "${module.nwinterface.interface2}"
        source = "./machine2"

}

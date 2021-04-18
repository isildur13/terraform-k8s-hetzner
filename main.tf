terraform{

    required_providers{
        hcloud = {
            source="hetznercloud/hcloud"
            version="1.26.0"
        }
    }
}


variable "hcloud_token" {}

provider "hcloud" {
    token = var.hcloud_token
}

resource "hcloud_ssh_key" "default"{

    name="default ssh key"
    public_key="${file("~/.ssh/id_rsa.pub")}"
}


resource "hcloud_server" "node1" {

    name = "node1"
    image = "centos-7"
    server_type = "cpx11"
    ssh_keys = ["${hcloud_ssh_key.default.name}"]
    user_data = file("user_data.yml")

} 

resource "hcloud_server" "node2" {

    name = "node2"
    image = "centos-7"
    server_type = "cpx11"
    ssh_keys = ["${hcloud_ssh_key.default.name}"]
    user_data = file("user_data.yml")

} 

resource "hcloud_server" "node3" {

    name = "node3"
    image = "centos-7"
    server_type = "cpx11"
    ssh_keys = ["${hcloud_ssh_key.default.name}"]
    user_data = file("user_data.yml")

} 

output "ip_details" {
  value = "1 ${hcloud_server.node1.name}  ${hcloud_server.node1.ipv4_address} 2 ${hcloud_server.node2.name} ${hcloud_server.node2.ipv4_address} 3 ${hcloud_server.node3.name} ${hcloud_server.node3.ipv4_address}"
  }




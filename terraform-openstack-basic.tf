terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "1.44.0"
    }
  }
}

provider "openstack" {
  cloud = "pune"
}

resource "openstack_compute_instance_v2" "tenzor" {
    flavor_id         = "1"
    flavor_name       = "m1.tiny"
    image_id          = "cb45de93-d5f9-4947-90dc-8fc7c6dbb1e7"
    image_name        = "cirros-0.5.1-x86_64-disk"
    name              = "tenzor"
    power_state       = "active"
    region            = "RegionOne"

    network {
        access_network = false
        name           = "public"
        uuid           = "d92a14a6-efba-4a67-9d1a-67751d9f08c1"
    }
}

resource "openstack_compute_instance_v2" "falcon" {
    flavor_id         = "1"
    flavor_name       = "m1.tiny"
    image_id          = "cb45de93-d5f9-4947-90dc-8fc7c6dbb1e7"
    image_name        = "cirros-0.5.1-x86_64-disk"
    metadata          = {}
    name              = "falcon"
    power_state       = "active"
    region            = "RegionOne"
    security_groups   = [
        "default",
    ]
    tags              = []

    network {
        access_network = false
        fixed_ip_v4    = "172.24.4.122"
        fixed_ip_v6    = "[2001:db8::345]"
        name           = "public"
        uuid           = "d92a14a6-efba-4a67-9d1a-67751d9f08c1"
    }

}

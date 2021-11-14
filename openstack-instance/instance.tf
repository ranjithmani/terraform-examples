resource "openstack_compute_instance_v2" "falcon" {
    flavor_id         = "1"
    flavor_name       = "m1.tiny"
    image_id          = "fd44f317-e5f3-41d0-bcad-d3f5afc193c0"
    image_name        = "cirros-0.5.2-x86_64-disk"
    name              = "falcon"
    region            = "RegionOne"
    security_groups   = [
        "${openstack_compute_secgroup_v2.secgroup_1.id}",
    ]
    tags              = []

    network {
        access_network = false
        name           = "network_1"
        uuid           = "${openstack_networking_network_v2.network_1.id}"
    }

}

resource "openstack_blockstorage_volume_v2" "volume_1" {
  name = "volume_1"
  size = 1
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = "${openstack_compute_instance_v2.falcon.id}"
  volume_id   = "${openstack_blockstorage_volume_v2.volume_1.id}"
}

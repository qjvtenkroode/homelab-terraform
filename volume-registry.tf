resource "nomad_volume" "registry" {
  type                  = "csi"
  plugin_id             = "truenas"
  volume_id             = "registry"
  name                  = "registry"
  external_id           = "registry"
  deregister_on_destroy = true

  capability {
    access_mode           = "single-node-writer"
    attachment_mode       = "file-system"
  }

  mount_options {
    fs_type = "nfs"
  }

  context = {
    node_attach_driver = "nfs"
    provisioner_driver = "freenas-nfs"
    server             = "truenas.qkroode.nl"
    share              = "/mnt/homelab/csi/vols/registry"
  }
}
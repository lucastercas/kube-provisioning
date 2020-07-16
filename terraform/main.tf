provider "xenserver" {
  url = "http://10.0.2.155"
  username = "root"
  password = "123123"
}

resource "xenserver_vm" "test_vm" {
  base_template_name = "CentOS 7.4 Template"
  name_label = "test_vm"
  
  static_mem_min = 8589934592
  static_mem_max = 8589934592
  dynamic_mem_min = 8589934592
  dynamic_mem_max = 8589934592

  vcpus = 1

  boot_order = "c"
  hard_driver {
    is_from_template = true
    user_device = "0"
  }
  cdrom {
    is_from_template = true
    user_device = "3"
  }

  network_interface {
    network_uuid = "92467b56-21a7-dfdd-b412-978181a69f32"
      device = 0
      mtu = 1500
      mac = ""
      other_config {
        ethtool-gso = "off"
        ethtool-ufo = "off"
        ethtool-tso = "off"
        ethtool-sg = "off"
        ethtool-tx = "off"
        ethtool-rx = "off"
    }
  }


}
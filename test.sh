#!/bin/bash

set -eu
# Get Template UUID
template_name="Debian Stretch 9.0"
echo "-> xe template-list name-label=\"${template_name}\" --minimal"
template_uuid="381ebb02-96d5-11e7-92b9-b8ca3a97c5fc"

# Get Disk UUID
disk_name="Local storage"
echo "-> xe sr-list name-label=\"${disk_name}\" --minimal"
sr_uuid="aa13029c-5a55-4196-2539-42a10d57c9ea"

# Create the VM
vm_name="test_vm"
ip_address="192.168.1.10"
vm_type="VM-S"
echo "-> xe vm-install \
  template=\"${template_uuid}\" \
  new-name-label=\"${vm_name} - ${ip_address} - ${vm_type}\" \
  sr-uuid=\"${sr_uuid}\""
vm_uuid="a17305fb-ebd6-4267-d862-f364847f9e1f"

# Set vcpu prority
cpu_weight="64"
echo "-> xe vm-param-set VCPUs-params:weight=\"${cpu_weight}\" uuid=\"${vm_uuid}\""
# Set vcpu count max and at startup
cpu_count="2"
echo "-> xe vm-param-set VCPUs-max=\"${cpu_count}\" uuid=\"${vm_uuid}\""
echo "-> xe vm-param-set VCPUs-at-startup=\"${cpu_count}\" uuid=\"${vm_uuid}\""

# Get the UUID of the disk
echo "-> xe vm-disk-list vbd-params=device=xvda uuid=\"${vm_uuid}\" --minimal"
disk_uuid="5afda7f6-4792-41fc-82f5-7c0eb86126a5"
# Set Disk size
disk_size="26843545600"
echo "-> xe vdi-resize disk-size=\"${disk_size}\" uuid=\"${disk_uuid}\""

# Set Memory
memory="1073741824"
echo "-> xe vm-memory-limits-set uuid=\"${vm_uuid}\" dynamic-min=\"${memory}\" dynamic-max=\"${memory}\" static-max=\"${memory}\" static-min=\"${memory}\""

# Get Network UUID
network_name="Pool-wide network associated with eth0"
echo "-> xe network-list name-label=\"${network_name}\" --minimal"
network_uuid="789f5737-eccc-5f9a-e5d7-da8731912ba1"
# Attach VM to Network
echo "-> xe vif-create vm-uuid=\"${vm_uuid}\" network-uuid=\"${network_uuid}\" mac=random device=0"
vif_uuid="68ac5fc5-fb18-17f0-be0b-766e10f8813f"
# Set preseed boot options
# boot_args="--- quiet console=hvc0 auto=true url=d-i.example.com hostname={{ hostname }} domain={{ domainname }} interface={{ interface | default(\"eth0\") }} netcfg/get_ipaddress={{ ipaddress }} netcfg/get_netmask={{ netmask | default(\"255.255.255.0\") }} netcfg/get_gateway={{ gateway }} netcfg/get_nameservers=\"{{ dnsservers }}\" netcfg/disable_dhcp={{ disable_dhcp | default(\"true\") }} environment={{ runtime_environment | default(\"production\") }}"
# echo "xe vm-param-set uuid=\"${vm_uuid}\" PV-args=\"${boot_args}\""

# Set Install repo
install_repository="http://deb.debian.org/debian/"
echo "-> xe vm-param-set uuid=\"${vm_uuid}\" other-config:install-repository=\"${install_repository}\""

# Create CD-ROM drive for xentools
echo "-> xe vbd-create type=CD device=xvdd vm-uuid=\"${vm_uuid}\" mode=ro"

# Boot VM
echo "-> xe vm-start uuid=\"${vm_uuid}\""

# Get boot time
echo "-> xe vm-param-get param-name=start-time uuid=${vm_uuid}"
boot_time="20200716T20:04:50Z"
start_time=${boot_time}; 
while [[ ${starttime} == ${boot_time} ]]; 
  do sleep 15; 
  start_time=`xe vm-param-get param-name=start-time uuid={{ vmuuid.stdout }}`; 
done
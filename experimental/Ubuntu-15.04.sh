
##[ Ubuntu 15.04 (Vivid Vervet) ]##############################################
# 2014-2015, JK Benedict | @xenfomation | thexenfomation@gmail.com
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Ubuntu 15.04 (Vivid Vervet)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE: Ubuntu 15.04 (Vivid Vervet) from http://www.ubuntu.com/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-arch=amd64 \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:nx=true \
	platform:viridian=false \
	platform:device_id=0001 \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

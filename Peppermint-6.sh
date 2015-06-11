
##[ Peppermint 6 ]##############################################################
# 05-JUN-2015, JK Benedict | @xenfomation | xenfomation@outlook.com
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Peppermint 6")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Peppermint 6 from http://peppermintos.com/" \
	memory-static-max=1073741824 \
	memory-dynamic-max=1073741824 \
	memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="6442450944" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID
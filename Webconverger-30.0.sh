
##[ Webconverger 30.0 ]########################################################
# 2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Webconverger 30.0")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Webconverger 30.0 from http://webconverger.com/" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="1073741824" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID


##[ Frugalware 2.0 (Rigel) ]###################################################
# 2015, JK Benedict | @xenfomation | thexenfomation@gmail.com
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Frugalware 2.0 (Rigel)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE: Frugalware 2.0 (Rigel) from http://frugalware.org/" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-arch=x86_64 \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="1073741824" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:usb_tablet=true \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID
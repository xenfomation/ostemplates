
##[ XenServer Arch Linux ]######################################################
# 2014-2015, JK Benedict | jessekbenedict@gmail.com | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Manjaro Linux")
xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE: Manjaro Linux from http://manjaro.org/" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=x86_64 \
	other-config:disks='<provision><disk device="0" size="8589934592" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=true \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID
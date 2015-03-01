
##[ Generic Debian-Based Guest OS ]############################################
# 2014-2015, JK Benedict | @xenfomation | thexenfomation@gmail.com
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Generic Debian-Based Guest OS")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE: Generic Debian-Based Guest OS" \
	memory-static-max=268435456 \
	memory-dynamic-max=268435456 \
	memory-dynamic-min=268435456 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:install-arch=amd64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="536870912" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

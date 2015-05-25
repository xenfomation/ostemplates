
##[ openSUSE 13.2 ]############################################################
# 2014-2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="openSUSE 13.2")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for openSUSE 13.2 from https://www.opensuse.org/en/" \
	memory-static-max=2147483648 \
	memory-dynamic-max=2147483648 \
	memory-dynamic-min=2147483648 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	other-config:install-distro=sleslike \
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

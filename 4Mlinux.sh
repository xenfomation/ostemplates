##[ 4MLinux 17.0 ]#############################################################
# 2014-2016, JK Benedict | http://www.xenserver.org
# xenfomation.wordpress.com | @xenfomation
###############################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="4MLinux 17.0")
xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for 4MLinux from http://4mlinux.com/index.php?page=download - Minimum RAM 512MB, Minimum Disk 2GB" \
	memory-static-max=536870912 \
	memory-static-min=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-methods=cdrom \
	other-config:disks='<provision><disk device="0" size="2147483648" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:nx=true \
	platform:device_id=0002 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID
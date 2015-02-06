
##[ Bodhi Linux 3.0 ]###########################################################
#
# 15 SEP 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.2, 6.5
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Tools install without manual intervention
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Bodhi Linux 3.0")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Bodhi Linux 3.0 (32 or 64-bit).  The installer media can be downloaded from http://www.bodhilinux.com/" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:install-arch=x86_64 \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="5368709120" sr="" bootable="true" type="system"/></provision>' \
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

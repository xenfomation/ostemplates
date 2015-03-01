
##[ Xubuntu 14.10 ]#############################################################
#
# 01 DEC 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.2, 6.5
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Must be manually installed (dpkg -i xe*amd64.deb or dpkg -i xe*i386.deb)
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Xubuntu 14.10")
xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Xubuntu 14.10 (32 or 64-bit).  The installer media can be downloaded from http://xubuntu.org/" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
    other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="false" type="system"/></provision>' \
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
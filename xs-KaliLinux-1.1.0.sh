
##[ Kali Linux 1.1.0 ]##########################################################
#
# REV 2.0
# 10 FEB 2015, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.2, 6.5
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: Tools install without manual intervention
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Kali Linux 1.1.0")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Kali Linux 1.1.0: 32 or 64-bit.  The installer can be downloaded from http://www.kali.org/" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=x86_64 \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"

xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name

xe template-list uuid=$dstUUID


##[ OpenMandriva Lx 2014.1 ]####################################################
#
# REV 1.0
# 13 OCT 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: 6.5
# ARCHITECTURE	: 32/64 BITS
# XENTOOLS		: N/A
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)

dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="OpenMandriva Lx 2014.1")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for OpenMandriva Lx 2014.1.  MINIMUM Guest VM requirements are 2GB of RAM and 10GB of disk space.  The installer media can be downloaded from http://www.openmandriva.org/" \
	memory-static-max=2147483648 \
	memory-dynamic-max=2147483648 \
	memory-dynamic-min=2147483648 \
	other-config:linux_template=true \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
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
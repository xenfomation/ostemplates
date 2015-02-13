﻿
##[ Fedora 21 Cloud ]###########################################################
#
# REV 2.0
# 18 JUN 2014, JK Benedict
# xenfomation.servercide.com | @xenfomation
# 
# XENSERVER AND TEMPLATE INFORMATION:
#
# INTENDED FOR	: XenServer 6.5
# TESTED ON		: XenServer 6.5
# ARCHITECTURE	: 64 BIT
# XENTOOLS		: Tools install without manual intervention
#
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Fedora 21 Cloud")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Fedora 21 Cloud.  The installer can be downloaded from http://download.fedoraproject.org/" \
    memory-static-max=2147483648 \
    memory-dynamic-max=2147483648 \
    memory-dynamic-min=2147483648 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=x86_64 \
	other-config:install-distro=rhlike \
	other-config:disks='<provision><disk device="0" size="6442450944" sr="" bootable="true" type="system"/></provision>' \
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

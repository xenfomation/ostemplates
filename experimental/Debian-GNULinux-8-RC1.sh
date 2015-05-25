#!/bin/bash

##[ Debian Jessie 8.0 RC1 (EXPERIMENTAL) ]#####################################
# 2015, JK Benedict | http://www.xenserver.org | @xenfomation
###############################################################################

# MAKE SURE PRODUCT VERSION IS... NOT < XENSERVER 6.1.0
xsVersion=$(cat /etc/xensource-inventory | grep "PRODUCT_VERSION=" | sed "s/'//g" | sed "s/.*=//g")

if [ "$xsVersion" == "6.5.0" ] || [ "$xsVersion" == "6.2.0" ] || [ "$xsVersion" == "6.1.0" ]; then
	# All is good - check for "Other install media" Template
	srcUUID=$(xe template-list name-label="Other install me" --minimal | grep "[0-9]")
	if [ -z "$srcUUID" ]; then
		echo ""
		echo "FAIL: \"Other install media\" Default Template is not installed"
		echo "		and it is required to proceed.  Exiting."
		echo ""
		exit
	fi
else
	echo ""
	echo "FAIL: This template has only been test on XenServer 6.1, 6.2, and 6.5"
	echo ""
	exit
fi	

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Debian 8.0 (Jessie)")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Debian 8.0 (Jessie) from http://www.debian.org/" \
	memory-static-max=268435456 \
	memory-static-min=134217728 \
    memory-dynamic-max=268435456 \
    memory-dynamic-min=268435456 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-arch=amd64 \
	other-config:install-distro=debianlike \
	other-config:disks='<provision><disk device="0" size="2147483648" sr="" bootable="true" type="system"/></provision>' \
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

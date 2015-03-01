﻿
##[ Windows 10 Desktop ]########################################################
# 15 SEP 2014, JK Benedict | @xenfomation | thexenfomation@gmail.com
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Windows 10 (Technical Preview)")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Windows 10 Desktop (Technical Preview)" \
    memory-static-max=2147483648 \
    memory-dynamic-max=2147483648 \
    memory-dynamic-min=2147483648 \
    other-config:default_template=true \
    other-config:install-methods=cdrom \
	other-config:install-arch=x86_64 \
	other-config:disks='<provision><disk device="0" size="34359738368" sr="" bootable="false" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:videoram=16 \
	platform:device_id=0002 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=true \
	platform:viridian_time_ref_count=true \
	platform:viridian_reference_tsc=true \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

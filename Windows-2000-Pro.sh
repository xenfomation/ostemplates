#!/bin/bash


##[ Windows 2000 Professional ]#################################################
# 2015, JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Windows 2000 SP4 (32-Bit)")

xe template-param-set uuid=$dstUUID \
	name-description="UNSUPPORTED TEMPLATE for Windows 2000 Professional (32-Bit) - PV Drivers from XenServer 5.x can be installed" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:default_template=true \
	other-config:install-methods=cdrom \
	other-config:disks='<provision><disk device="0" size="2147483648" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=false \
	platform:vga=std \
	platform:videoram=8 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=true \
	platform:viridian_time_ref_count=true \
	platform:viridian_reference_tsc=true \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="dc" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
echo ""
xe template-list uuid=$dstUUID

echo ""
echo "Storing a template UNINSTALL SCRIPT to:"
echo "	/root/uninstallTemplate-windows-2000-pro.sh"
echo ""

touch /root/uninstallTemplate-windows-2000-pro.sh
chmod +755 /root/root/uninstallTemplate-windows-2000-pro.sh
echo "#!/bin/bash" > /root/uninstallTemplate-windows-2000-pro.sh
echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" >> /root/uninstallTemplate-windows-2000-pro.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /root/uninstallTemplate-windows-2000-pro.sh

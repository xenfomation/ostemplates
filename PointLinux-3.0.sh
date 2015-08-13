#!/bin/bash

echo ""

##[ Point Linux 3.0 ]###########################################################
# 17-JUL-2015 JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Point Linux 3.0 (MATE)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Point Linux 3.0 (MATE) from http://pointlinux.org/download.html" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="5368709120" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
	platform:hpet=true \
	platform:videoram=8 \
	platform:device_id=0001 \
	platform:acpi=1 \
	platform:apic=true \
	platform:pae=true \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn" 
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

echo ""
echo "CREATING TEMPLATE UNINSTALL SCRIPT AT:"
echo "     /root/uninstall-PointLinux-3.0.sh"
echo ""

touch /root/uninstall-PointLinux-3.0.sh
chmod 755 /root/uninstall-PointLinux-3.0.sh
echo "#!/bin/bash" > /root/uninstall-PointLinux-3.0.sh
echo "" >> /root/uninstall-PointLinux-3.0.sh
echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" >> /root/uninstall-PointLinux-3.0.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /root/uninstall-PointLinux-3.0.sh
echo "rm /root/uninstall-PointLinux-3.0.sh" >> /root/uninstall-PointLinux-3.0.sh


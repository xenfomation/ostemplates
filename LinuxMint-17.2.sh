#!/bin/bash

echo ""

##[ Linux Mint 17.2 (Rafaela) ]#################################################
# 17-JUL-2015, JK Benedict | @xenfomation | xenfomation@outlook.com
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Linux Mint 17.2 (Rafaela)")

xe template-param-set uuid=$dstUUID \
	name-description="COMMUNITY TEMPLATE for Linux Mint 17.2 (Rafaela) from http://blog.linuxmint.com/?p=2856" \
	memory-static-max=536870912 \
	memory-dynamic-max=536870912 \
	memory-dynamic-min=536870912 \
	other-config:linux_template=true \
	other-config:install-distro=debianlike \
	other-config:default_template=true \
	other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:nx=true \
	platform:vga=std \
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
echo "     /root/uninstall-LinuxMint-17.2.sh"
echo ""

touch /root/uninstall-LinuxMint-17.2.sh
chmod 755 /root/uninstall-LinuxMint-17.2.sh
echo "#!/bin/bash" > /root/uninstall-LinuxMint-17.2.sh
echo "" >> /root/uninstall-LinuxMint-17.2.sh
echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" >> /root/uninstall-LinuxMint-17.2.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /root/uninstall-LinuxMint-17.2.sh

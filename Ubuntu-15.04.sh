#!/bin/bash

echo ""

##[ Ubuntu 15.04 ]##############################################################
# 2014, 2015 JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list uuid=5c743f1b-b512-b427-b436-17b72b5117ae --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Ubuntu 15.04 (Vivid Vervet)")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Ubuntu 15.04 (Vivid Vervet) from http://releases.ubuntu.com/15.04/" \
	memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
    memory-static-min=536870912 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
	platform:hpet=true \
	platform:vga=std \
	platform:videoram=8 \
	platform:nx=true \
	platform:device_id=0001 \
	platform:viridian=false \
	HVM-boot-policy="BIOS order" \
	HVM-boot-params:order="cdn"
xe template-param-remove uuid=$dstUUID param-name=other-config param-key=base_template_name
xe template-list uuid=$dstUUID

echo ""
echo ""
echo "CREATING TEMPLATE UNINSTALL SCRIPT AT:"
echo "     /root/uninstallUBUNTU1504.sh"
echo ""

touch /root/uninstallUBUNTU1504.sh
chmod 755 /root/uninstallUBUNTU1504.sh
echo "#!/bin/bash" > /root/uninstallUBUNTU1504.sh
echo "" >> /root/uninstallUBUNTU1504.sh
echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" >> /root/uninstallUBUNTU1504.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /root/uninstallUBUNTU1504.sh
echo "rm /root/uninstallUBUNTU1504.sh" >> /root/uninstallUBUNTU1504.sh


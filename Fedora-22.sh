#!/bin/bash

echo ""

##[ Fedora 22 Server ]##########################################################
# 26-MAY-2014, JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="Fedora 22")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for Fedora 22 from https://getfedora.org/ OR https://spins.fedoraproject.org/" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:install-distro=rhlike \
	other-config:disks='<provision><disk device="0" size="10737418240" sr="" bootable="true" type="system"/></provision>' \
	platform:apic=true \
	platform:acpi=1 \
	platform:pae=true \
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
echo "     /root/uninstallFedora22.sh"
echo ""

touch /root/uninstallFedora22.sh
chmod 755 /root/uninstallFedora22.sh
echo "#!/bin/bash" > /root/uninstallFedora22.sh
echo "" >> /root/uninstallFedora22.sh
echo "xe template-param-set uuid=$dstUUID other-config:default_template=false" >> /root/uninstallFedora22.sh
echo "xe template-uninstall template-uuid=$dstUUID" >> /root/uninstallFedora22.sh
echo "rm /root/uninstallFedora22.sh" >> /root/uninstallFedora22.sh


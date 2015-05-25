
##[ elementary OS 0.3 (Freya) ]##################################################
# 11-APR-2015, JK Benedict | http://www.xenserver.org | @xenfomation
################################################################################

srcUUID=$(xe template-list name-label="Other install media" --minimal)
dstUUID=$(xe vm-clone uuid=$srcUUID new-name-label="elementary OS (Freya)")
xe template-param-set uuid=$dstUUID \
    name-description="COMMUNITY TEMPLATE for elementary OS (Freya) from https://elementary.io/ with installation details found at https://elementary.io/docs/installation" \
    memory-static-max=1073741824 \
    memory-dynamic-max=1073741824 \
    memory-dynamic-min=1073741824 \
	other-config:linux_template=true \
    other-config:default_template=true \
    other-config:install-methods=cdrom,http,ftp,nfs \
	other-config:disks='<provision><disk device="0" size="16106127360" sr="" bootable="true" type="system"/></provision>' \
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

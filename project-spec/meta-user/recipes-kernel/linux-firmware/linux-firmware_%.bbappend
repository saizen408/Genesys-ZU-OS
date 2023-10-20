#################################################################
# This is the latest version (16.x) of the wilc1000 firmware
# However it does not seem to work on the Genesys-ZU-5EV
# Leaving this bbappend here just for reference and instead
# building version 15.3.1 found in the recipe wilc-firmware_%.bb
#################################################################

do_install:append () {
    install -d ${D}${nonarch_base_libdir}/firmware/atmel/
    cp atmel/wilc1000*.bin ${D}${nonarch_base_libdir}/firmware/atmel/

    # For license package:
    install -m 0644 LICENSE.atmel ${D}${nonarch_base_libdir}/firmware/atmel/
}

# NOTE: Use "=+" instead of "+=". Otherwise, the file is placed into the linux-firmware package.
PACKAGES =+ " \
    ${PN}-wilc1000_fw \
    ${PN}-wilc1000_ap_fw \
    ${PN}-wilc1000_p2p_fw \
    ${PN}-wilc1000_wifi_firmware \
    ${PN}-wilc1000_wifi_firmware-1 \
    ${PN}-atmel-license \
"

FILES:${PN}-wilc1000_fw = "${nonarch_base_libdir}/firmware/atmel/wilc1000_fw.bin"
FILES:${PN}-wilc1000_ap_fw = "${nonarch_base_libdir}/firmware/atmel/wilc1000_ap_fw.bin"
FILES:${PN}-wilc1000_p2p_fw = "${nonarch_base_libdir}/firmware/atmel/wilc1000_p2p_fw.bin"
FILES:${PN}-wilc1000_wifi_firmware = "${nonarch_base_libdir}/firmware/atmel/wilc1000_wifi_firmware.bin"
FILES:${PN}-wilc1000_wifi_firmware-1 = "${nonarch_base_libdir}/firmware/atmel/wilc1000_wifi_firmware-1.bin"
FILES:${PN}-atmel-license = "${nonarch_base_libdir}/firmware/atmel/LICENSE.atmel"

LICENSE:${PN}-wilc1000_fw = "Firmware-atmel"
LICENSE:${PN}-wilc1000_ap_fw = "Firmware-atmel"
LICENSE:${PN}-wilc1000_p2p_fw = "Firmware-atmel"
LICENSE:${PN}-wilc1000_wifi_firmware = "Firmware-atmel"
LICENSE:${PN}-wilc1000_wifi_firmware-1 = "Firmware-atmel"

RDEPENDS:${PN}-wilc1000_fw += "${PN}-atmel-license"
RDEPENDS:${PN}-wilc1000_ap_fw += "${PN}-atmel-license"
RDEPENDS:${PN}-wilc1000_p2p_fw += "${PN}-atmel-license"
RDEPENDS:${PN}-wilc1000_wifi_firmware += "${PN}-atmel-license"
RDEPENDS:${PN}-wilc1000_wifi_firmware-1 += "${PN}-atmel-license"
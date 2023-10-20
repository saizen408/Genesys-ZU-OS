FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

# Cadence I2C driver does not support repeated start after a read transfer. However,
# the Genesys ZU I2C transfer format requires repeated start after a read transfer.
# The below patch reverts i2c cadence driver found in xlnx_rebase_v6.1_LTS_2023.1 to 2019.1
# https://digilent.com/reference/programmable-logic/genesys-zu/reference-manual#main_i2c_bus

SRC_URI += " \
	file://bsp.cfg \
    file://0001-Genesys-zu-5ev-i2c-bus-requires-repeated-starts.patch \
    file://0002-Puts-wilc100-driver-compatible-with-15.3.1-firmware.patch \
"

SRC_URI += " file://bsp.cfg" 
KERNEL_FEATURES:append = " bsp.cfg"

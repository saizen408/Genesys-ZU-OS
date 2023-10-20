FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "\
    file://0001-default-to-debug-level-prints.patch \
    file://0002-added-board-specific-reference-frequency.patch \
    file://0003-Commented-out-I2c-mux-code-for-Digilent-Genesys-ZU.patch \
    file://0004-Added-Genesys-ZU-to-list-of-boards-supporting-DDR4.patch \
    file://0005-fsbl-reset-usb-phys-and-hub-upon-board-init.patch \
"
  
# Enable UHS-I speeds for SD
YAML_COMPILER_FLAGS:append = " -DUHS_MODE_ENABLE"

# Enable the Genesys ZU-5EV specific features (i.e. dynamic ddr initialization)
YAML_COMPILER_FLAGS:append = " -DXPS_BOARD_GZU_5EV"

DESCRIPTION = "PetaLinux Genesys ZU-5EV supported Packages"

inherit packagegroup

NETWORK_PACKAGES = " \
    init-ifupdown \
    wpa-supplicant \
    iw \
    openssl \
    dhcpcd \
    kea \ 
    avahi-daemon \
    inetutils \
"

DEBUG_PACKAGES = " \
    libgpiod-dev \
    libgpiod-tools \
    i2c-tools \
    tree \
    nano \
"

# We use 15.3.1 version of wilc not 16.x
FIRMWARE_PACKAGES = " \
    wilc-firmware-1000-wifi \
    wilc-firmware-3000-wifi \
    wilc-firmware-3000-ble \
    wilc-firmware-license \
"

RDEPENDS:${PN}:append = " \
    ${NETWORK_PACKAGES} \
    ${DEBUG_PACKAGES} \
    ${FIRMWARE_PACKAGES} \
"

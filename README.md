# OpenOCD_upload_binaries
Scripts and 'HowTo' upload bitstreams from a Raspberry Pi to Artix FPGAs and Digilent USB protocol.
The building instructions are realated with the gateware used wich are the linux on litex repos and Migen.
You will need a fresh Raspbian installation on your Raspberry Pi and the following software:

> **Note:** Tested on Raspbian


## Dependencies
In order to perform any formal test firmware existance:

```sh
$ sudo apt install build-essential device-tree-compiler
```
[migen](https://github.com/m-labs/migen)
```sh
$ sudo pip3 install migen
```
[litex](https://github.com/litex-hub/litex-getting-started)
```sh
$ wget https://raw.githubusercontent.com/enjoy-digital/litex/master/litex_setup.py
$ chmod +x litex_setup.py
$ sudo ./litex_setup.py init install
```
[Open OCD](http://openocd.org/)
```sh
$ sudo apt install libtool automake pkg-config libusb-1.0-0-dev
$ git clone https://github.com/ntfreak/openocd.git
$ cd openocd
$ ./bootstrap
$ ./configure --enable-ftdi
$ make
$ sudo make install
```

## Setup the static IP for the server
In order to achieve an easy configuration of the connection we use 
[ZeroTier](https://www.zerotier.com/download/)
```sh
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
```
Then we connect to a private network in Zerotier, you can create one or, you can connect to an already existing one (Send an email).


### Build
To build the bitstream of you board, run in your local machine:
```sh
$ ./make.py --board=daphne --build
```

### Load the binaries over JTAG Digilent protocol
Digilent usually uses a privative FTDI controllerbased on ST uC. If you want Open OCD recognizes this FTDI interface, you should copy the .cfg in the Raspberry Pi:
```sh
$ git clone https://github.com/matheos/OpenOCD_upload_binaries.git
```
Then, with the Raspberry connected you can execute the script to load the bitstream or you can setup the connection and make dbugging from there.
The images should load and you should see Linux booting :)

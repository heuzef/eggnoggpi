# EggnoggPI

Eggnogg on the Raspberry PI !

## Description

For all of you who need to run eggnoggplus on a raspberry pi to get frenzied parties, eggnoggpi is the right project.

In this readme, you will see how to setup a PI02W to autostart with eggnoggpi, so you only need to connect 2 controller, and a screen, power on the pi, and play !

## Hardware needed

* [Raspberry PI02W](https://www.kubii.com/en/nano-computers/3455-raspberry-pi-zero-2-w-5056561800004.html)
* Micro-SD Card (4GB)
* Mini-HDMI cable
* 5V 2.5A power supply
* [AuviPal Hub Micro USB OTG 3 Ports + Power](https://www.amazon.fr/gp/product/B083WML1XB)
* [2 PCS Wired USB NES Conroller Game Joypad](https://fr.aliexpress.com/item/1005001611443967.html)
* For the case, you can use the 3D source files

Estimated total cost arround 50$

## Setup Raspbian Lite 64 bit

First thing first, you'll need to install raspbian lite on your pi, you can do this just by downloading rpi-image from the official raspberry pi website https://www.raspberrypi.com/software

You'll then only need a minimum of 4Gb µSD card, and install raspbian lite **64 bit** on it.

https://www.raspberrypi.com/documentation/computers/getting-started.html

Connect, setup Wi-Fi and run somes update.



## Disable Swap

```
sudo dphys-swapfile swapoff && \
sudo dphys-swapfile uninstall && \
sudo systemctl disable dphys-swapfile
```

## 

## Setup BOX64

Sadly, Eggnoggplus is a x86_64 program only on linux, and we do not have access to the sources, so well need a little help from an emulator to get it working.

Box64 is a simple x86_64 emulator for other architecture like arm64, it can detect wether you want to start a x86_64 linux elf, and start translating the binary for you, if you need external libraries that exists on arm64, it'll use them so it won't have to translate it, you'll get more performance, very usefull on low power arm cpu like the one on the pi.

```
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
apt update
apt install box64-arm64 -y
```

## 

## Setup the screen

Since we installed raspbian lite on the pi, we'll need to install xorg and set it to auto login on boot, to achieve that, we'll install nodm.

```
sudo apt install -y nodm libsdl2-2.0-0 mpv antimicrox
```

## 

## Clone the repo of project

```
cd
git clone https://git.heuzef.com/Flutter/eggnoggpi.git
```

## Configure Nodm

You can then configure nodm or just use the configuration file with this repo

```
sudo cp /home/pi/eggnoggpi/files/etc/default/* /etc/default/
```

## Install Eggnoggplus

```
sudo cp -r /home/pi/eggnoggpi/files/home/eggnoggplus-linux/ /home/pi/
sudo chmod +x /home/pi/eggnoggplus-linux/eggnoggplus/
sudo chown pi:pi -R /home/pi/eggnoggplus-linux/
cp -R /home/pi/eggnoggpi/files/home/.madgarden/ /home/pi/
```



## Install services

To allow eggnogg to start on boot, we install it as a systemd service, you can write your own or just use the one with this repos

```sh
sudo cp /home/pi/eggnoggpi/files/etc/systemd/system/eggnoggpi.service /etc/systemd/system/eggnoggpi.service
sudo cp /home/pi/eggnoggpi/files/etc/systemd/system/mpv.service /etc/systemd/system/mpv.service
sudo cp /home/pi/eggnoggpi/files/etc/systemd/system/antimicrox.service /etc/systemd/system/antimicrox.service
sudo systemctl daemon-reload
sudo systemctl enable antimicrox
sudo systemctl start antimicrox
sudo systemctl enable eggnoggpi
sudo systemctl enable mpv
sudo systemctl start mpv
sudo systemctl start eggnoggpi
sudo echo "@reboot    root    /sbin/service eggnoggpi start" >> /etc/crontab
cp -R /home/pi/eggnoggpi/files/home/.config/antimicrox .config/
```

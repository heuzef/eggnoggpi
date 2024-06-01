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

## Install

```she
sudo apt install -y git 
git clone https://git.heuzef.com/Flutter/eggnoggpi.git
cd eggnoggpi
sudo apt install -y ./box64.deb 
sudo apt install -y ./eggnoggpi.deb 
```

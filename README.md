# eggnoggpi

eggnogg on the pi zero 2w !

# Description

For all of you who need to run eggnoggplus on a raspberry pi to get frenzied parties, eggnoggpi is the right project.

In this readme, I'll teach you how to setup a pi to autostart with eggnoggpi, so you only need to connect 2 controller, and a screen, power on the pi, and play !

# Installation

## Installation of raspbian lite 64 bit

First thing first, you'll need to install raspbian lite on your pi, you can do this just by downloading rpi-image from the official raspberry pi website https://www.raspberrypi.com/software/

You'll then only need a minimum of 4Gb µsd card, and install raspbian lite 64 bit on it

## Setup box64

Sadly, eggnogg is a x86_64 program only on linux, and we do not have access to the sources, so well need a little help from an emulator to get it working.

Box64 is a simple x86_64 emulator for other architecture like arm64, it can detect wether you want to start a x86_64 linux elf, and start translating the binary for you, if you need external libraries that exists on arm64, it'll use them so it won't have to translate it, you'll get more performance, very usefull on low power arm cpu like the one on the pi.

    sudo wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
    wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg
    sudo apt update && sudo apt install box64-arm64 -y

## Setup the screen

Since we installed raspbian lite on the pi, we'll need to install xorg and set it to auto login on boot, to achieve that, we'll install nodm and xutils

    sudo apt install nodm xserver-xorg-utils

You can then configure nodm or just use the configuration file with this repo

    cp nodm /etc/default/nodm

## Download eggnoggplus

To be continued

## Install the service

To allow eggnogg to start on boot, we install it as a systemd service, you can write your own or just use the one with this repos

    cp eggnoggpi.service /etc/systemd/system/eggnoggpi.service
    systemctl daemon-reload
    systemctl enable eggnoggpi
    systemctl start eggnoggpi


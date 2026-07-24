#!/bin/bash

pkill swaync
pkill waybar

swyanc &
waybar &
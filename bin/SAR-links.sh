#!/bin/bash

orig="yyyy-NNN-XX"
dest=$1

sed -i "s/$orig/$dest/" README.md scripts/* report/*

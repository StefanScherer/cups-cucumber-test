#!/bin/bash

echo "192.168.33.2 spooler" | sudo tee -a /etc/hosts
echo "192.168.33.3 client" | sudo tee -a /etc/hosts

#!/bin/bash

# Update the system
sudo apt-get update -y

# Install required packages
sudo apt-get install -y gnupg curl

# Import the MongoDB public GPG key
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg --dearmor -o /usr/share/keyrings/mongodb-server-6.0.gpg

# Add the MongoDB repository for Ubuntu 22.04 (Jammy)
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb->

# Update the package database
sudo apt-get update -y

# Install MongoDB
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod

# Enable MongoDB to start on system boot
sudo systemctl enable mongod

# Print MongoDB status
sudo systemctl status mongod

# Start mongosh
mongosh


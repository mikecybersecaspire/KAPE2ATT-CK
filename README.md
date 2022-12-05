# KAPE2ATT&CK

## What is this project?

KAPE2ATT&CK is a repository of pre-built (Powershell) KAPE acquisition scripts, each mapped to the 12 Enterprise MITRE ATTACK Techniques. These scripts are only for Windows hosts, and only make use of the existing targets in KAPE.

The scripts support storing the collected artefacts locally, or in cloud. It's recommended you test these scripts in a controlled sandbox environment before adding to your production-ready forensics arsenal.

The artefacts acquired by these scripts are not exhaustive, I'd encourage anyone to fork the project or recommend changes/improvements 😎

## Requirements
* Powershell
* Some tools for modules

## Usage
This can be run locally via Powershell, or can be distributed at scale via an EDR agent of your choice. If you don't have access to a commercial EDR product, I'd recommend https://www.rapid7.com/products/velociraptor/ or https://limacharlie.io/

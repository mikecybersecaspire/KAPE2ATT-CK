# KAPE2ATT&CK

## What is this project?

KAPE2ATT&CK is a repository of pre-built (Powershell) KAPE acquisition scripts, each mapped to the 12 Enterprise MITRE ATTACK Techniques. The aim of this project is to simplify the identification of which artefacts to acquire, based on which attacker tactics you'd like to hunt for.

The scripts support storing the collected artefacts locally, or in cloud. It's recommended you test these scripts in a controlled sandbox environment before adding to your production-ready forensics arsenal.

The artefacts acquired by these scripts are not exhaustive, I'd encourage anyone to fork the project or recommend changes/improvements 😎

## Example Use Case
Typically, as DFIR analysts, we're tasked with investigating activity pertaining to a particular tactic i.e. You're a DFIR analyst, working as part of a wider team investigating a ransomware case, you may be tasked with investigating the exfiltration element. You might need a script just to collect the most important artefacts relating to identifying evidence of exfiltration.

## Requirements
* Powershell
* Some tools for modules (See list below)
* Azure Blob Storage account

## Usage
This can be run locally via Powershell, or can be distributed at scale via an EDR agent of your choice. If you don't have access to a commercial EDR product, I'd recommend https://www.rapid7.com/products/velociraptor/ or https://limacharlie.io/

## Extending this project
You could scale the execution of these scripts by utilising an EDR-style agent, or a tool that allows you to run Powershell at scale; then utilise Log2Timeline/Timesketch to hunt for tactics at scale. https://github.com/google/timesketch

### Scope
As mentioned, these scripts will only be for Windows hosts... Likewise, because these scripts are limited to endpoints, you should consider utilising this project to extend your forensics arsenal and not substitute analysis techniques of other hosts/devices/entities in scope of investigation i.e. Firewall or Cloud logs. Investigating only endpoints will only ever give you a limited view.

## Coming soon

### Grouping tactic sets by Threat Actor
Soon, there will be a feature to collect artefacts by inputting the corresponding MITRE TA code i.e. G0018 (https://attack.mitre.org/groups/G0018) - This will then trigger KAPE2ATTACK to automatically collect the artefacts for the chinese based TA group "admin@338".

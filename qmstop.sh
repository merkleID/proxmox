#!/bin/bash

# Script per spegnere tutte le VM su Proxmox

echo "Elenco delle VM attive:"
qm list

# Ottieni l'elenco degli ID VM (colonna 1, saltando l'intestazione)
VM_IDS=$(qm list | awk 'NR>1 {print $1}')

for VMID in $VM_IDS; do
    echo "Spegnimento della VM ID $VMID..."
    qm shutdown $VMID
    # Attendere lo spegnimento prima di passare alla successiva (facoltativo)
    while qm status $VMID | grep -q "status: running"; do
        echo "In attesa che la VM $VMID si spenga..."
        sleep 5
    done
    echo "VM $VMID spenta."
done

echo "Tutte le VM sono state spente."

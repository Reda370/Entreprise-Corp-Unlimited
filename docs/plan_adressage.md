# 📋 Plan d'adressage et Architecture Réseau

## 🌐 Segmentation Réseau
| Zone | Réseau | Description |
| :--- | :--- | :--- |
| **WAN** | 10.0.0.0/16 | Accès Internet (Réseau École) |
| **Inter-Routeur** | 192.168.10.0/24 | Zone isolée entre les deux pare-feu |
| **LAN Entreprise**| 192.168.20.0/24 | Zone sécurisée (Serveurs et Clients) |

## 🖥️ Inventaire des Machines (LAN)
| Machine | Adresse IP | Rôle / Service |
| :--- | :--- | :--- |
| **OPNsense** | 192.168.20.254 | Passerelle par défaut, Pare-feu |
| **SRV-WIN-01** | 192.168.20.250 | Contrôleur de Domaine (AD), DNS, Fichiers |
| **Client-W10** | 192.168.20.10 | Poste utilisateur (Anatole) |

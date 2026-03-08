# Infrastructure d'Entreprise Sécurisée & Groupware Nextcloud

![Linux](https://img.shields.io/badge/Linux-%23121011.svg?logo=linux&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-%230078D6.svg?logo=windows&logoColor=white)
![Proxmox](https://img.shields.io/badge/Proxmox-%23A9152A.svg?logo=proxmox&logoColor=white)
![Nextcloud](https://img.shields.io/badge/Nextcloud-%23F58220.svg?logo=nextcloud&logoColor=white)

## 📌 Contexte
Projet académique de déploiement d'une infrastructure hybride (Linux/Windows) sur **Proxmox**, comprenant une gestion forte des identités, des services réseau classiques (DNS, Web, Mail) et un point d'accès sécurisé pour l'administration et le télétravail.

## 🧭 Objectifs clés
- **Segmentation réseau** : DMZ, cascade de routeurs (OPNsense / IPFire)
- **Gestion des identités** : Active Directory + OpenLDAP
- **Services** : Mail (Postfix/Dovecot), Web (Apache), DNS (Bind9)
- **Accès sécurisés** : VPN, bastion d'administration (Guacamole / Warpgate)
- **Groupware** : Nextcloud comme hub de collaboration (fichiers, calendriers, mails)

---

## 🗂️ Organisation du dépôt
- `configs/` : configurations des services (DNS, Web, Mail, LDAP)
- `scripts/` : scripts d’automatisation (Linux, Windows)
- `docs/` : diagrammes d’architecture et captures d’écran

---

## 🚀 Phases du projet

### Phase 1 : Infrastructure de Base & Routage
- Mise en place de l’hyperviseur Proxmox
- Configuration du routage OPNsense/IPFire pour l’accès WAN
- Création des templates de VM (Debian 13, Windows Server, Windows 10/7)

### Phase 2 : Gestion des Identités et Fichiers (Hybride)
- **DNS** : Résolutions internes (`prenom.tp`) sur Windows et Linux
- **Annuaire** : AD-DS + OpenLDAP en parallèle pour la gestion des utilisateurs (RH, Compta, Direction, Info)
- **Stockage** : Partages SMB avec lecteurs réseaux (P: personnel, 1 Go quota; G: global, ACLs strictes par service)

### Phase 3 : Services de Communication
- **Serveur Web** : Déploiement Apache avec Virtual Hosts (ex. `cloud.prenom.tp`, `webmail.prenom.tp`)
- **Messagerie** : Stack Postfix/Dovecot + tests SMTP/IMAP avec domaines externes

### Phase 4 : Publication Sécurisée (DMZ & Télétravail)
- **DMZ** : Isolation des serveurs Web et Mail
- **Télétravail** : VPN pour les commerciaux
- **Bastion d’administration** : Warpgate / Apache Guacamole pour sécuriser SSH/RDP
- **DNS Public** : Zones Bind9 chez le FAI avec transfert de zone

### Phase 5 : Unification Groupware (Nextcloud)
- Intégration de Nextcloud comme point central
- Synchronisation mails, contacts, calendriers et fichiers
- Accessibilité interne/externe via redirection de ports et certificats

---

## 🛠️ Exécution du script d’initialisation
Pour créer l’arborescence et le `.gitignore` :

```bash
chmod +x setup_repo.sh
./setup_repo.sh
```

> ⚠️ Sous Windows, exécutez-le depuis Git Bash, WSL (Ubuntu) ou un terminal compatible Bash.

---

## 📌 Notes
- Ce dépôt reste un squelette : toutes les configurations spécifiques (templates de VM, scripts d’installation, playbooks) doivent être ajoutées dans les dossiers dédiés.
- Pensez à versionner vos configurations (ex. `configs/` en git) et à chiffrer les secrets (Vault, Ansible Vault, etc.).

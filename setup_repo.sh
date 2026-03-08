#!/usr/bin/env bash
# setup_repo.sh
# Crée l'arborescence de dossiers standard pour le projet "Entreprise-Corp-Unlimited".
# Usage : ./setup_repo.sh

set -euo pipefail

ROOT_DIR="$(pwd)"

echo "Création de l'arborescence de dossiers dans : ${ROOT_DIR}"

mkdir -p configs/bind-dns/
mkdir -p configs/apache-web/
mkdir -p configs/postfix-mail/
mkdir -p configs/openldap/

mkdir -p scripts/windows/
mkdir -p scripts/linux/

mkdir -p docs/diagrams/
mkdir -p docs/screenshots/

# Crée un .gitignore générique
cat > .gitignore <<'EOF'
# System files
.DS_Store
Thumbs.db

# Logs
*.log
logs/

# Temporary files
*~
*.swp
*.tmp

# Editor directories
.vscode/
.idea/

# OS generated files
ehthumbs.db
Icon?

# Python
__pycache__/
*.py[cod]

# Node
node_modules/

# Terraform
.terraform/

# Misc
*.bak
*.orig
EOF

echo "Arborescence créée et .gitignore ajouté."

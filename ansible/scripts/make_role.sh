#!/bin/bash

# A script to generate role project structure for KernsAI

ROOT_DIR="$HOME/p/KernsAI/vm/ansible"
ROLES_DIR="$ROOT_DIR/roles"

# Consume role from cli; Exit with warning if not provided
ARG_ROLE="$1"
ROLE_DIR="$ROLES_DIR/$ARG_ROLE"

# No arguments provided or First argument is empty string
if [[ ( $# -eq 0 ) || ( -z $ARG_ROLE ) ]]; then
    echo "Please provide role to generate"
    exit 1
fi

# Role already exists
if [ -d $ROLE_DIR ]; then
    echo "Role already exists. Exiting."
    exit 2
fi

# Generate Structure
echo "Generating structure for new role: ${ARG_ROLE}"
echo "Generating ${ROLE_DIR}..."

mkdir -p ${ROLE_DIR}/{tasks,handlers,files,vars,meta}
touch ${ROLE_DIR}/{tasks,handlers,files,vars,meta}/.keepfile

echo "Done!"

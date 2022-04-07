ansible-playbook -i inventory/local roles/main.yml --ask-become-pass --extra-vars "USER=$(whoami)"

set shell := ["bash", "-euo", "pipefail", "-c"]

default:
    @just --list

# Initialize a new machine.
init:
    ./scripts/init
    chezmoi init --apply

# Synchronize dotfiles and provision the machine.
update:
    chezmoi update
    ansible-playbook ansible/playbooks/site.yml

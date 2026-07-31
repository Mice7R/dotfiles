set shell := ["bash", "-euo", "pipefail", "-c"]
env := `chezmoi data --format json | jq -r '.profile? // "null"'`

default:
    @just --list

# Initialize a new machine.
init:
    ./scripts/init
    chezmoi init && \
    chezmoi apply

# Synchronize dotfiles and provision the machine.
update:
    chezmoi update
    uv sync --locked
    uv run ansible-playbook -i localhost, -c local ansible/playbooks/{{env}}.yml -K

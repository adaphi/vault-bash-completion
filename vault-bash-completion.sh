# ---------------------------------------------------------------------------
# vault-bash-completion
#
# This adds bash completions for [HashiCorp Vault](https://www.vaultproject.io/)
#
# Based on https://github.com/iljaweis/vault-bash-completion
# Only completes with commands from the vault binary.
# Does not make any requests to the vault server.
# ---------------------------------------------------------------------------

function _vault() {
  local VAULT_COMMANDS=$(vault 2>&1 | egrep '^ +' | awk '{print $1}')

  local cur

  if [ $COMP_CWORD -gt 0 ]; then
    cur=${COMP_WORDS[COMP_CWORD]}
  fi

  local line=${COMP_LINE}

  if [ "$COMP_CWORD" -lt 2 ]; then
    COMPREPLY=($(compgen -W "$VAULT_COMMANDS" -- $cur))
  fi
}

complete -o default -F _vault vault

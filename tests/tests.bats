#!/usr/bin/env bats

source vault-bash-completion.sh
load get_completions

fail() {
  echo "$@" > /dev/stderr
  return 1
}

@test "'vault ' => commands" {
  run get_completions 'vault '
  [[ "$status" == 0 ]]
  output=$(echo "$output" | paste -s -d ' ' -)
  [[ "$output" =~ 'audit-disable audit-enable audit-list auth' ]] || fail "output was: \"$output\""
}

@test "'vault a' => commands" {
  run get_completions 'vault a'
  [[ "$status" == 0 ]]
  output=$(echo "$output" | paste -s -d ' ' -)
  [[ "$output" =~ 'audit-disable audit-enable audit-list auth auth-disable auth-enable' ]] || fail "output was: \"$output\""
}

@test "'vault c' => commands" {
  run get_completions 'vault c'
  [[ "$status" == 0 ]]
  output=$(echo "$output" | paste -s -d ' ' -)
  [[ "$output" =~ 'capabilities' ]] || fail "output was: \"$output\""
}

@test "'vault p' => commands" {
  run get_completions 'vault p'
  [[ "$status" == 0 ]]
  output=$(echo "$output" | paste -s -d ' ' -)
  [[ "$output" =~ 'path-help policies policy-delete policy-write' ]] || fail "output was: \"$output\""
}

@test "'vault r' => commands" {
  run get_completions 'vault r'
  [[ "$status" == 0 ]]
  output=$(echo "$output" | paste -s -d ' ' -)
  [[ "$output" =~ 'read rekey remount renew revoke rotate' ]] || fail "output was: \"$output\""
}

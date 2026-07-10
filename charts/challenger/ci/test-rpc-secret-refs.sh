#!/usr/bin/env bash

set -euo pipefail

chart_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
tmp_dir="$(mktemp -d)"
trap 'rm -rf "${tmp_dir}"' EXIT

assert_contains() {
  local file="$1"
  local expected="$2"

  if ! grep -Fq -- "${expected}" "${file}"; then
    echo "expected rendered chart to contain: ${expected}" >&2
    exit 1
  fi
}

assert_not_contains() {
  local file="$1"
  local unexpected="$2"

  if grep -Fq -- "${unexpected}" "${file}"; then
    echo "rendered chart leaked plaintext test endpoint: ${unexpected}" >&2
    exit 1
  fi
}

eth_rpc_placeholder="\$(ETH_RPC_URL)"
secret_render="${tmp_dir}/secret-render.yaml"

helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string rpcSecrets.ethRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.ethRpcUrl.key=ethRpcUrl \
  >"${secret_render}"

assert_contains "${secret_render}" "${eth_rpc_placeholder}"
assert_contains "${secret_render}" 'name: ETH_RPC_URL'
assert_contains "${secret_render}" 'name: "challenger-rpc"'
assert_contains "${secret_render}" 'key: "ethRpcUrl"'
assert_not_contains "${secret_render}" 'https://'

flashbots_render="${tmp_dir}/flashbots-render.yaml"
flashbots_rpc_placeholder="\$(FLASHBOTS_RPC_URL)"

helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethRpcUrl=https://public.example.invalid \
  --set-string rpcSecrets.flashbotsRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.flashbotsRpcUrl.key=flashbotsRpcUrl \
  >"${flashbots_render}"

assert_contains "${flashbots_render}" '--flashbot-rpc-url'
assert_contains "${flashbots_render}" "${flashbots_rpc_placeholder}"
assert_contains "${flashbots_render}" 'name: FLASHBOTS_RPC_URL'
assert_contains "${flashbots_render}" 'key: "flashbotsRpcUrl"'

mixed_env_render="${tmp_dir}/mixed-env-render.yaml"
helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string rpcSecrets.ethRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.ethRpcUrl.key=ethRpcUrl \
  --set-string rpcSecrets.flashbotsRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.flashbotsRpcUrl.key=flashbotsRpcUrl \
  --set-string env.normal.FOO=bar \
  >"${mixed_env_render}"

assert_contains "${mixed_env_render}" 'name: ETH_RPC_URL'
assert_contains "${mixed_env_render}" 'name: FLASHBOTS_RPC_URL'
assert_contains "${mixed_env_render}" 'name: FOO'
assert_contains "${mixed_env_render}" 'value: "bar"'

private_key_render="${tmp_dir}/private-key-render.yaml"
eth_secret_key_placeholder="\$(ETH_SECRET_KEY)"
helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethConfig.ethPrivateKey.existingSecret=challenger-eth \
  --set-string ethConfig.ethPrivateKey.key=ethPrivateKey \
  --set-string env.normal.FOO=bar \
  >"${private_key_render}"

assert_contains "${private_key_render}" "${eth_secret_key_placeholder}"
assert_contains "${private_key_render}" 'name: ETH_SECRET_KEY'
assert_contains "${private_key_render}" 'name: FOO'

inline_rpc="https://public-backward-compatible.example.invalid"
inline_render="${tmp_dir}/inline-render.yaml"

helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string "ethRpcUrl=${inline_rpc}" \
  >"${inline_render}"

assert_contains "${inline_render}" "${inline_rpc}"

zero_replicas_render="${tmp_dir}/zero-replicas-render.yaml"
helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set replicaCount=0 \
  >"${zero_replicas_render}"

assert_contains "${zero_replicas_render}" 'replicas: 0'

invalid_render="${tmp_dir}/invalid-render.yaml"
plaintext_rpc="https://plaintext-should-not-render.example.invalid/rpc"
if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string "ethRpcUrl=${plaintext_rpc}" \
  --set-string rpcSecrets.ethRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.ethRpcUrl.key=ethRpcUrl \
  >"${invalid_render}" 2>&1; then
  echo "expected plaintext and Secret-backed ETH RPC sources to conflict" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'ethRpcUrl and rpcSecrets.ethRpcUrl cannot both be set'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string rpcSecrets.ethRpcUrl.key=ethRpcUrl \
  >"${invalid_render}" 2>&1; then
  echo "expected an incomplete RPC secret reference to fail rendering" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'rpcSecrets.ethRpcUrl.existingSecret is required'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string rpcSecrets.ethRpcUrl.existingSecret=challenger-rpc \
  >"${invalid_render}" 2>&1; then
  echo "expected an RPC secret reference without a key to fail rendering" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'rpcSecrets.ethRpcUrl.key is required'

flashbots_plaintext="https://plaintext-flashbots-should-not-render.example.invalid"
if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethRpcUrl=https://public.example.invalid \
  --set-string "flashbotsRpcUrl=${flashbots_plaintext}" \
  --set-string rpcSecrets.flashbotsRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.flashbotsRpcUrl.key=flashbotsRpcUrl \
  >"${invalid_render}" 2>&1; then
  echo "expected plaintext and Secret-backed Flashbots RPC sources to conflict" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'flashbotsRpcUrl and rpcSecrets.flashbotsRpcUrl cannot both be set'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethRpcUrl=https://public.example.invalid \
  --set-string rpcSecrets.flashbotsRpcUrl.existingSecret=challenger-rpc \
  >"${invalid_render}" 2>&1; then
  echo "expected a Flashbots RPC secret reference without a key to fail rendering" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'rpcSecrets.flashbotsRpcUrl.key is required'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethRpcUrl=https://public.example.invalid \
  --set-string rpcSecrets.flashbotsRpcUrl.key=flashbotsRpcUrl \
  >"${invalid_render}" 2>&1; then
  echo "expected a Flashbots RPC secret reference without a Secret name to fail rendering" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'rpcSecrets.flashbotsRpcUrl.existingSecret is required'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string rpcSecrets.ethRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.ethRpcUrl.key=ethRpcUrl \
  --set-string env.normal.ETH_RPC_URL=shadowed \
  >"${invalid_render}" 2>&1; then
  echo "expected env.normal to reject the reserved ETH_RPC_URL name" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'env.normal.ETH_RPC_URL is reserved when rpcSecrets.ethRpcUrl is set'

if helm template challenger "${chart_dir}" \
  --set implementation=rs \
  --set-string ethRpcUrl=https://public.example.invalid \
  --set-string rpcSecrets.flashbotsRpcUrl.existingSecret=challenger-rpc \
  --set-string rpcSecrets.flashbotsRpcUrl.key=flashbotsRpcUrl \
  --set-string env.normal.FLASHBOTS_RPC_URL=shadowed \
  >"${invalid_render}" 2>&1; then
  echo "expected env.normal to reject the reserved FLASHBOTS_RPC_URL name" >&2
  exit 1
fi

assert_contains "${invalid_render}" 'env.normal.FLASHBOTS_RPC_URL is reserved when rpcSecrets.flashbotsRpcUrl is set'

#!/usr/bin/env bash
# Copyright (C) 2021-2025 Chronicle Labs, Inc.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -euo pipefail

chart_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
rendered="$(helm template fire-drill "$chart_dir" \
  --values "$chart_dir/ci/fire-drill-render.yaml" \
  --show-only templates/deployment.yaml)"
default_rendered="$(helm template default "$chart_dir" \
  --show-only templates/deployment.yaml)"
proxy_rendered="$(helm template proxy "$chart_dir" \
  --values "$chart_dir/ci/proxy-values.yaml" \
  --show-only templates/deployment.yaml)"

if [[ "$default_rendered" == *'automountServiceAccountToken:'* ]]; then
  printf 'default render must preserve Kubernetes service-account automount behavior\n' >&2
  exit 1
fi

required=(
  'automountServiceAccountToken: false'
  'name: fire-drill'
  'mountPath: /var/run/chronicle/fire-drill'
  'name: fire-drill-namespace'
  'downwardAPI:'
  'fieldPath: metadata.namespace'
)

for expected in "${required[@]}"; do
  if [[ "$rendered" != *"$expected"* ]]; then
    printf 'missing rendered fire-drill field: %s\n' "$expected" >&2
    exit 1
  fi
done

for expected in 'path: /healthz' 'port: healthcheck'; do
  count="$(grep -Fc -- "$expected" <<< "$proxy_rendered" || true)"
  if [[ "$count" -ne 2 ]]; then
    printf 'proxy CI fixture must set both probes to %s, found %s\n' "$expected" "$count" >&2
    exit 1
  fi
done

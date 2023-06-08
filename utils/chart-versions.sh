#!/bin/bash

# Function to list chart names and versions
list_charts() {
    local registry="$1"
    local charts=$(find "$registry" -name Chart.yaml)
    if [[ -n "$charts" ]]; then
        for chart_file in $charts; do
            local chart=$(grep '^name:' "$chart_file" | awk '{print $2}')
            local version=$(grep '^version:' "$chart_file" | awk '{print $2}')
            echo "Chart: $chart - $version"
            list_dependency_charts "$chart_file"
            echo "-----"
        done
    else
        echo "No charts found in the registry."
    fi
}

# Function to list dependency chart names and versions
list_dependency_charts() {
    local chart_file="$1"
    local dependencies=$(awk '/^dependencies:/ {flag=1; next} /^[^[:space:]]/ {flag=0} flag' "$chart_file" | sed -n '/name:/s/^.*name:[[:space:]]*//p')
    if [[ -n "$dependencies" ]]; then
        echo "Dependencies:"
        local versions=$(awk '/^dependencies:/ {flag=1; next} /^[^[:space:]]/ {flag=0} flag' "$chart_file" | sed -n '/version:/s/^.*version:[[:space:]]*//p')
        local i=0
        while IFS= read -r chart; do
            local version=$(echo "$versions" | awk -v i=$i 'NR == i+1 {print}')
            echo "$version - $chart"
            ((i++))
        done <<< "$dependencies"
    else
        echo "No dependencies found."
    fi
}

# Main script

# Specify the path to the helm chart registry
registry_path="../charts"

# List all charts in the registry
list_charts "$registry_path"

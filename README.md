# Chronicle Labs Helm Charts
<p align="center">
  <img src="https://cdn.chroniclelabs.io/assets/chronicle-helm.png" />
</p>

## Usage

Add the Helm repository locally and update.

```bash
helm repo add chronicle https://chronicleprotocol.github.io/charts/
helm repo update chronicle
```

## Contributing

Please ensure you can install the helm chart with sane default values.

> **NB!** Please do not include specific values or sensitive information in charts

### Helm Chart Testing
Open a PR, and push changes to your chart.
Be sure to bump the `ChartVersion` in the respective chart's `Chart.yaml`

Please install pre-commit:
```
## Setup pre-commit hooks

### Install pre-commit

Using homebrew:
```bash
$ brew install pre-commit
```

Using pip:
```bash
$ pip install pre-commit
```

Check pre-commit version
```bash
$ pre-commit --version
pre-commit 3.3.3
```
And be sure to install the precommit configs
```
pre-commit install
```
### Helm Chart Release
Once your PR passes all status checks, merge to `main`, and the chart-release action will publish the new version of the chart.

# Homebrew tap for Fortem

Install [Fortem](https://fortem.dev), the local Kubernetes environment
inspector:

```sh
brew install cybrixcc/tap/fortem
fortem --demo
```

The formula supports macOS and Linux on amd64 and arm64. Fortem connects through
your existing kubeconfig and starts read-only; it does not install a Helm chart
or in-cluster component.

Release archives and checksums are published in
[`cybrixcc/fortem-releases`](https://github.com/cybrixcc/fortem-releases/releases).

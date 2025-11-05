# Tools Tap

## Overview
This tap provides specific versions of common development tools to ensure consistency across the development team.

## Directory structure
```
homebrew-devtools/
├── Formula/
│   ├── argocd.rb
│   ├── aws-cli.rb
│   ├── bazelisk.rb
│   ├── jq.rb
│   ├── kind.rb
│   ├── kubectl.rb
│   ├── kustomize.rb
│   ├── terraform.rb
│   └── yq.rb
└── README.md
```

## Available Tools
- argocd (v2.13.1)
- aws-cli (v2.22.4)
- bazelisk (v1.24.0)
- helm (v3.16.3)
- jq (v1.7.1)
- kind (v0.25.0)
- kubectl (v1.13.3)
- kustomize (v5.5.0)
- terraform (v1.5.7)
- yq (v4.44.5)

## Installation

```bash
# Clone reository
git clone "https://github.com/will397/homebrew-devtools.git"

# Add the tap
brew tap will397/devtools

# Install specific tools
brew install will397/devtools/argocd
brew install will397/devtools/aws-cli
brew install will397/devtools/bazelisk
brew install will397/devtools/helm
brew install will397/devtools/jq
brew install will397/devtools/kind
brew install will397/devtools/kubectl
brew install will397/devtools/kustomize
brew install will397/devtools/terraform
brew install will397/devtools/yq

# Install all tools
brew update
brew bundle
```

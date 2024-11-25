# Yalla DevTools Tap

## Overview
This tap provides specific versions of common development tools to ensure consistency across the development team.

## Directory structure
```
homebrew-devtools/
├── Formula/
│   ├── argocd.rb
│   ├── aws-cli.rb
│   ├── bazelisk.rb
│   ├── helm.rb
│   └── jq.rb
└── README.md
```

## Available Tools
- argocd (v2.13.1)
- aws-cli (v2.15.0)
- bazelisk (v1.19.0)
- helm (v3.13.3)
- jq (v1.7.1)

## Installation

```bash
# Add the tap
brew tap your-org/devtools

# Install specific tools
brew install your-org/devtools/argocd
brew install your-org/devtools/aws-cli
brew install your-org/devtools/bazelisk
brew install your-org/devtools/helm
brew install your-org/devtools/jq
```

## Brewfile Example
```ruby
tap "your-org/devtools"
brew "your-org/devtools/argocd"
brew "your-org/devtools/aws-cli"
brew "your-org/devtools/bazelisk"
brew "your-org/devtools/helm"
brew "your-org/devtools/jq"
```
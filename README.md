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

# Install all tools
brew update
brew bundle
```

## Brewfile Example
```ruby
tap "will397/devtools"
brew "will397/devtools/argocd"
brew "will397/devtools/aws-cli"
brew "will397/devtools/bazelisk"
brew "will397/devtools/helm"
brew "will397/devtools/jq"
```
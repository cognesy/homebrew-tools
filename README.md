# Cognesy Homebrew Tap

Homebrew formulas maintained by Cognesy.

## Install

```bash
brew tap cognesy/tools
brew install cognesy/tools/yaml-schema
```

The `yaml-schema` formula packages the Rust `yaml-schema` project v0.9.1. Its
CLI is installed as `yaml-schema-validator` instead of `ys` so it can be used
in environments where a binary named `ys` is restricted.

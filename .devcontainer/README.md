# How to use this

## Initial setup

Add to your tree:

```bash
git subtree add --prefix .devcontainer https://github.com/adrien-bon/devcontainer.rust.git master --squash
```

Optionally, you can add extras configuration in ./extras.sh

## Pull updates

```bash
git subtree pull --prefix .devcontainer https://github.com/adrien-bon/devcontainer.rust.git master --squash
```

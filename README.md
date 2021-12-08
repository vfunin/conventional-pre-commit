# Conventional Pre Commit - Git Pre-commit Hooks
Pre-commit scripts appropriate for any project. These hooks are made as custom plugins under the [pre-commit](http://pre-commit.com/#new-hooks) git hook framework.
## Requirements

* [pip](https://www.python.org/downloads/)
* [pre-commit](http://pre-commit.com/#new-hooks)

# Setup
Just add to your `.pre-commit-config.yaml` file with the following (replace rev)
```yaml
  - repo: https://github.com/vfunin/conventional-pre-commit
    rev: <git tag or sha>
    hooks:
      - id: message
      - id: branch
```
Or add new config file (replace rev)
```bash
echo "repos:
  - repo: git://github.com/pre-commit/pre-commit-hooks
    rev: <git tag or sha>
    hooks:
      - id: check-merge-conflict
      - id: check-yaml
      - id: end-of-file-fixer
      - id: trailing-whitespace
  - repo: https://github.com/vfunin/conventional-pre-commit
    rev: <git tag or sha>
    hooks:
      - id: message
      - id: branch" > .pre-commit-config.yaml
```
Install the `pre-commit` script:

```console
pre-commit install
```

**That's it!**

Now try 'normal' commit:
```console
git commit -m "add a new feature"
```
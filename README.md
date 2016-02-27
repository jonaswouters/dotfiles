# dotfiles

## Installing 

```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
git clone --bare <git-repo-url> $HOME/.dotfiles
config checkout
```

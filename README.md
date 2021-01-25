dotfiles
========

Custom Linux configuration files by, [Chris Kankiewicz](http://www.ChrisKankiewicz.com)

### Installation

**Init script**

```bash
curl -sSL https://phlak.link/dotfiles-init | bash
```

**Manual installation**

```bash
git clone --bare https://github.com/PHLAK/dotfiles.git ${HOME}/.dotfiles

alias dotfiles='git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}'

dotfiles checkout

dotfiles config status.showUntrackedFiles no

dotfiles remote set-url origin git@github.com:PHLAK/dotfiles.git

source ${HOME}/.profile
```

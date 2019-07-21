# dotfiles
My dotfiles repo. Where all my customisation dot-files go. E.g. .vimrc, .bashrc (or whatever).  
***Cross-platform only!*** (The whole point is to have our custom setup *basically* wherever we go.)

## Usage

```
cd [To where you clone repos, or whatever floats your boat here.]  
git clone [This repo.]  
[Copy the config you want, to where it is supposed to be. This can be done any way you prefer but symlink is ideal if possible.]
```

## Repo Structure
The current idea is pretty straightforward.
The `configs` directory stores every config file, with full path of where it
should typically be.
(We have the initial root `configs` directory so we don't have name clashes. E.G. the `.git` directory.)

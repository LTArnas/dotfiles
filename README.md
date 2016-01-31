# dotfiles
My dotfiles repo. Where all my customisation dot-files go. E.g. .vimrc, .bashrc (or whatever).  
***Cross-platform only!*** (The whole point is to have our custom setup *basically* wherever we go.)

## Usage

```
cd [To where you clone repos, or whatever floats your boat here.]  
git clone [This repo.]  
[Copy the config you want, to where it is supposed to be. This can be done any way you prefer.]
```

## Repo Structure
The current idea is pretty straightforward.  
- There is a dotfile FOR SOMETHING.  
    - Let's use '.vimrc' as an example (the Vim editor config dotfile).
- We make a new directory (if it doesn't already exist) in the the repo. The directory name defines the 'FOR SOMETHING' context.
    - New directory called, 'Vim'.
- We create the dotfiles in the new directory (or copy over an existing one).
    - We create a new file '.vimrc' -OR-  
    - We copy our current '.vimrc' file (from somewhere else) to this directory. -OR-  
    - We create/copy a '.vimrc' file to ".vim/vimrc/" (full path, with the file: "[repo root dir]/Vim/.vim/vimrc/.vimrc") -OR-
    - ...you get the idea.
- That's it.
    - Make the edits/customisations until the end of time, I guess.

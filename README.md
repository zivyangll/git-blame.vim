git-blame.vim
==========
```
 ███╗  ███╗ █████╗      ████╗ █╗     ███╗ █╗  █╗█████╗      █╗  █╗ ███╗ █╗  █╗
█╬══█╗ ╚█╔╝ ╚═█╔═╝      █╔══█╗█║    █╬══█╗██╗██║█╔═══╝      █║  █║ ╚█╔╝ ██╗██║
█║  ╚╝  █║    █║        █║  █║█║    █║  █║█╔█╬█║█║          █║  █║  █║  █╔█╬█║
█║      █║    █║  █████╗████╬╝█║    █║  █║█║╚╝█║████╗       █║  █║  █║  █║╚╝█║
█║ ██╗  █║    █║  ╚════╝█╔══█╗█║    █████║█║  █║█╔══╝  ██╗  █║  █║  █║  █║  █║
█║ ╚█║  █║    █║        █║  █║█║    █╔══█║█║  █║█║     ██║  ╚█╗█╬╝  █║  █║  █║
╚███╬╝ ███╗   █║        ████╬╝█████╗█║  █║█║  █║█████╗ ╚═╝   ╚█╬╝  ███╗ █║  █║
 ╚══╝  ╚══╝   ╚╝        ╚═══╝ ╚════╝╚╝  ╚╝╚╝  ╚╝╚════╝        ╚╝   ╚══╝ ╚╝  ╚╝
```

See Git Blame information in the status bar for the currently selected line.

Installation
--------------

Simply Install

If you don't have a preferred installation method, I recommend
installing [pathogen.vim](https://github.com/tpope/vim-pathogen), and
then simply copy and paste:

```bash
    cd ~/.vim/bundle
    git clone git@github.com:zivyangll/git-blame.vim.git
```

Using [vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'zivyangll/git-blame.vim'
```

Using [Vundle](https://github.com/VundleVim/Vundle.vim)

```viml
Plugin 'zivyangll/git-blame.vim'
```

Default bindings
-----------------

**The default leader has been changed to `<Leader>s` to avoid
conflicts with other plugins you may have installed.** This can easily be
changed by rebinding the leader in your vimrc:

```vim
map <Leader>s :<C-u>call gitblame#echo()<CR>
```

Quick start guide
-----------------

just use `<leader>s`

Self-Promotion
--------------

Like git-blame.vim? Follow the repository on
[GitHub](https://github.com/zivyangll/git-blame.vim).  And if
you're feeling especially charitable, follow [GitHub](https://github.com/zivyangll).

License
-------

See [MIT License](https://github.com/zivyangll/git-blame.vim/blob/master/LICENSE).


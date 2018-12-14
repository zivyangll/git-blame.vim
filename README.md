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

![](https://wx3.sinaimg.cn/large/bceaad1fly1frwfmv58g4j21kw0ingph.jpg)

![](https://wx3.sinaimg.cn/large/bceaad1fly1frwfmv539mj21kw0inq7e.jpg)

![](https://wx2.sinaimg.cn/large/bceaad1fly1frwfmv50ytj21kw0in42a.jpg)

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

Please setting bindings
-----------------

** You must push the map in your vimrc to avoid conflicts with other plugins you may have installed.: **

```vim
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
```

Quick start guide
-----------------

just use `<leader>s`

Self-Promotion
--------------

Like git-blame.vim? Follow the repository on
[GitHub](https://github.com/zivyangll/git-blame.vim) and vote for it on [vim.org](https://www.vim.org/scripts/script.php?script_id=5704). And if
you're feeling especially charitable, follow [GitHub](https://github.com/zivyangll).

Thanks
--------------

[git-messenger.vim](https://github.com/rhysd/git-messenger.vim)

License
-------

See [MIT License](https://github.com/zivyangll/git-blame.vim/blob/master/LICENSE).


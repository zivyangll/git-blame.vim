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

Additional Feature
------------------

This fork has the trim message length in the status line, mainly for users who use 1 line height to avoid git commit message > 1 line height and gets prompted to PRESS ENTER TO CONTINUE.

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
Plug 'wotzhs/git-blame.vim'
```

Using [Vundle](https://github.com/VundleVim/Vundle.vim)

```viml
Plugin 'wotzhs/git-blame.vim'
```

Manual binding
-----------------

** You must push the map in your vimrc to avoid conflicts with other plugins you may have installed.: **

```vim
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
```

Auto git blame on current line
-----------------

Taking the cue from [@Edo78](https://github.com/Edo78)'s [comment](https://github.com/zivyangll/git-blame.vim/issues/20#issuecomment-534526591), add the following to your `~/.vimrc`:

```vim
autocmd CursorHold * :call gitblame#echo()
```

This will display the git blame after the cursor is held momentarily.

Quick start guide
-----------------

just use `<leader>s`


Publish git-blame
-----------------
```
tar zcvf git-blame.tar.gz git-blame.vim
```

upload: https://www.vim.org/scripts/script.php?script_id=5704

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


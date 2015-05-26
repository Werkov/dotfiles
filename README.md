# dotfiles
Backup, shared storage &amp; versioning of user settings

Inspired by these [dotfiles](https://github.com/mathiasbynens/dotfiles). With
`rsync`, I can have independent files in subdirectories rather than having
bunch of symlinks.

## Usage

    $ git clone <URL> # run this for the first time
    $ # git pull      # run this for consequent updates
    $ cd dotfiles
    $ ./install.sh

## TODO

  * Are copies really better than symlinks?
    * I cannot edit files in their original location.

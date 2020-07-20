# Juraj’s dotfiles

Forked from [Mathias](https://github.com/mathiasbynens/dotfiles). 

## Installation

**Warning:** If you want to give these dotfiles a try, you should first fork this repository, review the code, and remove things you don’t want or need. Don’t blindly use my settings unless you know what that entails. Use at your own risk!

### Using Git and the bootstrap script

You can clone the repository wherever you want. (I like to keep it in `~/dotfiles`) The bootstrapper script will pull in the latest version and copy the files to your home folder.

```bash
git clone https://github.com/jooray/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/jooray/dotfiles/tarball/main | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,LICENSE-MIT.txt,EXAMPLES.md}
```

To update later on, just run that command again.

### Specify the `$PATH`

If `~/.path` exists, it will be sourced along with the other files, before any feature testing takes place.

Here’s an example `~/.path` file that adds `/usr/local/bin` to the `$PATH`:

```bash
export PATH="/usr/local/bin:$PATH"
```

### Fast setup

If you don't want to read about Sensible macOS defaults and homebrew setup, you can get fast results with 

```bash
./init/init.sh
```

### Sensible macOS defaults

When setting up a new Mac, you may want to set some sensible macOS defaults:

```bash
./init/macos
```

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course). I also use brew cask for binary applications, because it's easier to autoupdate everything using 

```bash
update
```

alias using homebrew then letting each and every app notify my about updates.

```bash
./init/brew.sh && ./init/brew-cask.sh
```

### Add custom commands and settings without creating a new fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extra` looks something like this:

```bash
# Git credentials
# Not in the repository, to prevent people from accidentally committing under my name
GIT_AUTHOR_NAME="Juraj Bednar"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="jooray@mailinator.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extra` to override settings, functions and aliases from my dotfiles repository. It’s probably better to [fork this repository](https://github.com/jooray/dotfiles/fork) instead, though.

You can also use `~/.gitconfig.local` and `~/.vimrc.local`

Another file that allows you to configure some aspects is ~/.dotconf.
You can see ~/.dotconf.example for an example configuration. It is
sourced before the main files, so if you need to set some environment
variable before other settings, you can do so. The main setting you
could need to change is the name of the interface that connects you to
the internet:

```bash
export LOCAL_NET_IFACE="en0"
```

## Examples

If you would like to see some examples of .aliases or .functions usage, have a look at [EXAMPLES.md](https://github.com/jooray/dotfiles/blob/main/EXAMPLES.md).

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](https://brew.sh/) formulae (after installing Homebrew, of course) and Homebrew casks (binary packages installed through Homebrew interface):

```bash
./init/brew.sh
./init/brew-cask.sh
```

Some of the functionality of these dotfiles depends on formulae installed by `brew.sh`. If you don’t plan to run `brew.sh`, you should look carefully through the script and manually install any particularly important ones. A good example is Bash/Git completion: the dotfiles use a special version from Homebrew.

## Feedback

Suggestions/improvements
[welcome](https://github.com/jooray/dotfiles/issues)!

## Improvements and changes from Matthias's dotfiles

* Customization for my needs (e.g. not using Sublime Text, going easy on some macOS defaults)
* Should work on Linux as well
* Vagrant commands
* Bash prompt - change the color of '$' in the prompt to red if last process exited with error
* Customization of screen and [tmux](https://github.com/gpakosz/.tmux)
* Don't force en_US locale, this is per user (I set mine in ~/.extra)
* macOS hot corners adjusted my needs
* Sane defaults on Linux, don't alias functions that don't work.
* Change ip alias to myip (ip is a system command on Linux). Alias ip to myip on macOS. Support colorification for ip
* Add support for directory jumper (z). Install it either using brew (.brew.sh) or to ~/.z.sh
* Better support for [grc](https://github.com/garabik/grc) - on macOS. This adds colour to your boring unix commands :). Just install it with brew (included in .brew.sh)
* Make "update" work on macOS, Linux (yum-based and apt-get-based distributions)

## Authors

| [![twitter/jurbed](https://www.gravatar.com/avatar/59cd93d4261a85b1b2a6c210b0b4a4ce?s=70)](http://twitter.com/jurbed "Follow @jurbed on Twitter") |
|---|
| [Juraj Bednar](https://juraj.bednar.sk/) |

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles) - this is our upstream project
* [dotphiles](https://github.com/dotphiles/dotphiles) for inspiration and some configuration scripts
* [janus](https://github.com/carlhuda/janus) - dotfiles repository for vim that we use
* @ptb and [his _macOS Setup_ repository](https://github.com/ptb/mac-setup)
* [Ben Alman](http://benalman.com/) and his [dotfiles repository](https://github.com/cowboy/dotfiles)
* [Cătălin Mariș](https://github.com/alrra) and his [dotfiles repository](https://github.com/alrra/dotfiles)
* [Gianni Chiappetta](https://butt.zone/) for sharing his [amazing collection of dotfiles](https://github.com/gf3/dotfiles)
* [Jan Moesen](http://jan.moesen.nu/) and his [ancient `.bash_profile`](https://gist.github.com/1156154) + [shiny _tilde_ repository](https://github.com/janmoesen/tilde)
* [Lauri ‘Lri’ Ranta](http://lri.me/) for sharing [loads of hidden preferences](http://osxnotes.net/defaults.html)
* [Matijs Brinkhuis](https://matijs.brinkhu.is/) and his [dotfiles repository](https://github.com/matijs/dotfiles)
* [Nicolas Gallagher](http://nicolasgallagher.com/) and his [dotfiles repository](https://github.com/necolas/dotfiles)
* [Sindre Sorhus](https://sindresorhus.com/)
* [Tom Ryder](https://sanctum.geek.nz/) and his [dotfiles repository](https://sanctum.geek.nz/cgit/dotfiles.git/about)
* [Kevin Suttle](http://kevinsuttle.com/) and his [dotfiles repository](https://github.com/kevinSuttle/dotfiles) and [macOS-Defaults project](https://github.com/kevinSuttle/macOS-Defaults), which aims to provide better documentation for [`~/.macos`](https://mths.be/macos)
* [Haralan Dobrev](https://hkdobrev.com/)
* [Dominee](https://github.com/dominee/Termux-dotfiles) for EXAMPLES.md
  and a few aliases plus better Linux support
* anyone who [contributed a patch](https://github.com/jooray/dotfiles/contributors) or [made a helpful suggestion](https://github.com/jooray/dotfiles/issues) - either here or to the original dotfiles

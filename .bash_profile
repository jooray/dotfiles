# Omarchy (https://omarchy.org) ships its own bash setup under /usr/share/omarchy.
# Load it *first*, so everything below layers on top of it instead of replacing
# it: OMARCHY_PATH, mise, starship, zoxide, fzf, its aliases/functions/completions
# all stay intact, and our own settings still win because they are sourced later.
# `is_omarchy` is available to the rest of the dotfiles (and to ~/.dotconf/~/.extra).
[ -r /usr/share/omarchy/default/bash/env-bootstrap ] && source /usr/share/omarchy/default/bash/env-bootstrap;

is_omarchy() { [ -n "$OMARCHY_PATH" ] && [ -d "$OMARCHY_PATH" ]; }

if is_omarchy && [ -r "$OMARCHY_PATH/default/bash/rc" ] && [ -n "$PS1" ]; then
	source "$OMARCHY_PATH/default/bash/rc";
fi;

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load ~/.bash_prompt, taking the prompt back from starship if it already claimed it.
dotfiles_load_prompt() {
	[ -r ~/.bash_prompt ] && [ -f ~/.bash_prompt ] || return 0;
	if [[ "$PROMPT_COMMAND" == *starship_precmd* ]]; then
		PROMPT_COMMAND="${STARSHIP_PROMPT_COMMAND:-}";
		unset STARSHIP_PROMPT_COMMAND;
		trap - DEBUG;
	fi;
	source ~/.bash_prompt;
}

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
dotfiles_skipped_prompt="";
for file in ~/.{path,dotconf,bash_prompt,exports,aliases,functions,extra}; do
	# On Omarchy the prompt comes from starship (see $OMARCHY_PATH/default/bash/init),
	# so don't clobber it. Set DOTFILES_PROMPT=1 in ~/.dotconf (or ~/.extra) to use
	# the Solarized prompt from ~/.bash_prompt instead.
	if [ "$file" = "$HOME/.bash_prompt" ]; then
		if is_omarchy && [ -z "$DOTFILES_PROMPT" ]; then
			dotfiles_skipped_prompt=1;
		else
			dotfiles_load_prompt;
		fi;
		continue;
	fi;
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# ~/.extra is sourced last, so honour a DOTFILES_PROMPT set there as well.
[ -n "$dotfiles_skipped_prompt" ] && [ -n "$DOTFILES_PROMPT" ] && dotfiles_load_prompt;
unset dotfiles_skipped_prompt;
unset -f dotfiles_load_prompt;


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# timestamps for later analysis. www.debian-administration.org/users/rossen/weblog/1
export HISTTIMEFORMAT='%F %T '

# keep history up to date, across sessions, in realtime
#  http://unix.stackexchange.com/a/48113
export HISTCONTROL=ignoredups:erasedups:ignorespace  # no duplicate entries, ignore commands starting with space
export HISTSIZE=100000                          # big big history (default is 500)
export HISTFILESIZE=$HISTSIZE                   # big big history
command -v shopt > /dev/null 2>&1 && shopt -s histappend  # append to history, don't overwrite it

# ^ the only downside with this is [up] on the readline will go over all history not just this bash session.

# Save and reload the history after each command finishes
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# mc theme
export MC_SKIN=$HOME/.mc/solarized.ini

# Add tab completion for many Bash commands
if command -v brew &> /dev/null && [ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]; then
	# Ensure existing Homebrew v1 completions continue to work
	export BASH_COMPLETION_COMPAT_DIR="$(brew --prefix)/etc/bash_completion.d";
	source "$(brew --prefix)/etc/profile.d/bash_completion.sh";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Enable tab completion for `g` by marking it as an alias for `git`
if type _git &> /dev/null; then
	complete -o default -o nospace -F _git g;
fi;

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;


if [ $(uname) == "Darwin" ]
	then
		# Add tab completion for `defaults read|write NSGlobalDomain`
		# You could just use `-g` instead, but I like being explicit
		complete -W "NSGlobalDomain" defaults;
    # Add `killall` tab completion for common apps
		complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;
		if command -v brew > /dev/null 2>&1 && [ -e $(brew --prefix)/etc/profile.d/z.sh ]; then . `brew --prefix`/etc/profile.d/z.sh ;fi;
	fi

[ -e "$HOME/.z.sh" ] && . $HOME/.z.sh

# Omarchy applies its own readline config with `bind -f`, which happens *after*
# readline has already read ~/.inputrc. Re-apply ours on top so our keybindings
# win where the two overlap (Omarchy-only bindings, e.g. TAB cycling, survive).
if is_omarchy && [ -n "$PS1" ] && [ -r ~/.inputrc ]; then
	bind -f ~/.inputrc 2> /dev/null;
fi;

true

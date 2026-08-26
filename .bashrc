# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells.
# Harmless (and skipped) on machines without Omarchy.
[ -r /usr/share/omarchy/default/bash/env-bootstrap ] && source /usr/share/omarchy/default/bash/env-bootstrap;

if [ -n "$PS1" ]
then
	source ~/.bash_profile;
else
	[ -r ~/.path ] && [ -f ~/.path ] && source ~/.path;
fi

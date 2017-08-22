
#--------------------------------------------------------------------#
# zsh-directory-hsitory aware Suggestion Strategy                    #
#--------------------------------------------------------------------#
# Suggests the most recent history item that matches the given
# prefix, favoring items executed in the current working directory
# first.
#

_zsh_autosuggest_strategy_directory_history() {
	# Reset options to defaults and enable LOCAL_OPTIONS
	emulate -L zsh

	# Enable globbing flags so that we can use (#m)
	setopt EXTENDED_GLOB

	# Escape backslashes and all of the glob operators so we can use
	# this string as a pattern to search the $history associative array.
	# - (#m) globbing flag enables setting references for match data
	local prefix="${1//(#m)[\\*?[\]<>()|^~#]/\\$MATCH}"

	# Get the history items that match
	# - (r) subscript flag makes the pattern match on values
    # history_dir populated by the zsh-directory-history plugin
	suggestion="${history_dir[(r)$prefix*]}"

}

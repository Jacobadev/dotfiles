function gac() {
	git add -A && git commit -m"$*"
}
function h() {
	history | rg "$1" | cat
}
function alr() {
	alias | rg "$1" | cat
}

function gc() {
	git commit "$*"
}

function th() {
	tail -n40 < <(history 1 | cat)
}

function nvims() {
	items=("kickstart" "LazyVim" "AstroNvim" "ReactNvim")
	config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
	if [[ -z $config ]]; then
		echo "Nothing selected"
		return 0
	elif [[ $config == "default" ]]; then
		config=""
	fi
	NVIM_APPNAME=$config nvim $@
}

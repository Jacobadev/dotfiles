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

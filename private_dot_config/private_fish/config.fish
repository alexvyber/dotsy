if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Variables 
set -Ux EDITOR "nvim"

# Aliases
alias :q=exit
alias caps='cat package.json | jq .scripts'
alias eza="eza --git"
alias l="eza --git"
alias ll="eza -l"
alias la="eza -a"
alias l1="eza -1"
alias ltr="eza --tree"
alias l.="eza --all -I '[A-z]*'"
alias l.l="eza -l --all -I '[A-z]*'"
alias dus="dust -d=1 -b"

# git
alias gs="git status" # Ghostscript == gs ! Just in case something isn't working
alias gp="git push"
alias ga.="git add ."
# alias gd="git diff ."
alias gop='open $(git remote get-url --all origin)'

zoxide init fish --cmd c | source

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end


function newrepo
    if test (count $argv) -gt 0
	    open https://github.com/new?name=$argv[1]
    else
            open https://github.com/new
    end
end

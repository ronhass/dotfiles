$env.config = {
    show_banner: false,
}

def tt [] {
    $"~/temp/(date now | format date '%Y.%m.%d')" | path expand
}

def ldf [] {
    ls ~/Downloads | sort-by modified --reverse | first | get name
}

def --env mkcd [d: path] {
    mkdir $d
    cd $d
}


alias ll = ls -la
alias vim = nvim
alias cdt = mkcd (tt)
alias cld = cp (ldf) .

use ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu
source ~/.zoxide.nu

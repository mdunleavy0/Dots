# fix
# Hide standard error.
fix() {
    "$@" 2>/dev/null
}


# ls
# Count entries from ls.
# Passes all flags to ls.
lc() {
    flags=""
    files=""
    fileC=0

    # separate flags and files
    for arg in "$@"; do
        case $arg in
            -*)
                flags="$flags $arg" ;;
            *)
                files="$files $arg"
                : $((fileC+=1))
                ;;
        esac
    done

    if [ $fileC -gt 1 ] ; then
        for file in $files; do
            c=$(ls -1 $flags $file | wc -l)
            echo "$file: $c"
        done
    else
        ls -1 $flags $files | wc -l
    fi
}
alias lca='lc -A'


# man
# Colourise ANSI text effects used by man.
man() {
    # This is more verbose than usual, but it makes shellcheck shut up. (Still
    # fails on Dash though.)
    LESS_TERMCAP_mb=$(printf '\e[1;31m')    # start blink       -> bold, red
    LESS_TERMCAP_md=$(printf '\e[1;32m')    # start bold        -> bold, green
    LESS_TERMCAP_me=$(printf '\e[0m')       # end all effects
    LESS_TERMCAP_so=$(printf '\e[1;33m')    # start standout    -> bold, yellow
    LESS_TERMCAP_se=$(printf '\e[0m')       # end standout
    LESS_TERMCAP_us=$(printf '\e[4;36m')    # start underline   -> underline, cyan
    LESS_TERMCAP_ue=$(printf '\e[0m')       # end underline
    export LESS_TERMCAP_mb LESS_TERMCAP_md LESS_TERMCAP_me
    export LESS_TERMCAP_so LESS_TERMCAP_se
    export LESS_TERMCAP_us LESS_TERMCAP_ue
    # Underline -> cyan is a tradition from the CGA days apparently and is
    # performed by default in the virtual console.
    command man "$@"
}


# mkdir / cd
# Make a directory and change into it.
# All arguments are passed to mkdir.
# Only the final argument is passed to cd.
mkcd() {
    mkdir "$@"
    tmp=$*
    cd "${tmp##* }" || exit 1
}


# sort
# Sort files in place.
# Allows multiple files.
# All flags are passed to sort.
sortip() {
    flags=""
    files=""

    # separate flags and files
    for arg in "$@"; do
        case $arg in
            -*) flags="$flags $arg" ;;
            *) files="$files $arg" ;;
        esac
    done

    for file in $files; do
        sort $flags -o $file $file
    done
}

# Load fish's own git completions, then hide origin/* branches from `git switch`
# unless -c/-C/-d is on the line (where a remote branch is a valid start point).
status get-file completions/git.fish | source

functions -c __fish_git_branches __fish_git_branches_all
function __fish_git_branches
    if __fish_git_using_command switch
        and not __fish_seen_argument -s c -s C -s d -l create -l force-create -l detach
        __fish_git_branches_all | string match -v '*	Remote Branch'
    else
        __fish_git_branches_all
    end
end

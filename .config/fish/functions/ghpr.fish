function ghpr -d "Fetch GitHub PR to local branch"
    argparse 'h/help' 'id=' 'r/remote=' 'b/branch=' -- $argv
    or return

    if set -q _flag_help
        or not set -q _flag_id
        echo "ghpr --id [-r|--remote<upstream>] [-b|--branch<ghpr>]"
        return 0
    end

    set remote upstream
    if set -q _flag_remote
        set remote $_flag_remote
    end
    echo "Use remote: $remote"

    set branch ghpr
    if set -q _flag_branch
        set branch $_flag_branch
    end
    echo "Create branch: $branch"

    git fetch $remote pull/"$_flag_id"/head:"$branch"
    git checkout $branch
end

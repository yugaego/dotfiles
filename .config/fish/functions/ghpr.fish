function ghpr -d "Pull GitHub PR to local branch"
    set remote upstream
    if set -q argv[2]
        set remote "$argv[2]"
    end
    echo "Using remote: $remote"
    if set -q argv[1]
        git fetch $remote pull/"$argv[1]"/head:ghpr
        git checkout ghpr
    else
        "Enter GitHub Pull Request ID [and a remote name]"
    end
end

function ghpr -d "Pull GitHub PR to local branch"
    if set -q argv[1]
        git fetch upstream pull/"$argv[1]"/head:ghpr
        git checkout ghpr
    else
        "Enter GitHub Pull Request ID"
    end
end

function gbdp -d "Delete git banch locally and at origin"
    if set -q argv[1]
        git branch -D "$argv[1]"
        git push --delete origin "$argv[1]"
    else
        "Enter branch name"
    end
end

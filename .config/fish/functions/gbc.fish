function gbc -d "Show behind/ahead commit counts for each branch"
    set -l base main
    git rev-parse -q --verify "$base^{commit}" >/dev/null
    if test $status -ne 0
        set base master
    end

    printf "%-15s | %6s | %6s\n" "Branch" "Behind" "Ahead"
    printf "%-15s-+-%6s-+-%6s\n" (string repeat -n 15 "-") \
        (string repeat -n 6 "-") (string repeat -n 6 "-")

    for branch in (git for-each-ref --format='%(refname:short)' refs/heads/)
        if test "$branch" != "$base"
            set -l behind (git rev-list --left-only --count "$base...$branch")
            set -l ahead (git rev-list --right-only  --count "$base...$branch")
            printf "%-15s | %6s | %6s\n" "$branch" "$behind" "$ahead"
        end
    end
end

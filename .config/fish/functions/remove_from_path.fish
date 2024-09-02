function remove_from_path -d "Remove directory from PATH"
    if set -q argv[1]
        if set -l index (contains -i "$argv[1]" $fish_user_paths)
            set -e fish_user_paths[$index]
            echo "Removed $argv[1] from the path"
        end
    else
        echo "Enter directory to remove from PATH"
    end
end

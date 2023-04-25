function mo -d "Open manual page for command's option"
    if set -q argv[2]
        man $argv[1] | less -p " $argv[2]"
    else
        echo "Enter command name and its option to lookup man for"
    end
end

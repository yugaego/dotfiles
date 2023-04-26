### CONFIG FAQ FOR FISH 3
## Based on official documentation:
## https://fishshell.com/docs/current/language.html

## Universal variables are set once in CLI and stored in fish_variables file.
## Non-universal variables can be set and used in configuration files.

## For example, to disable fish greeting once and for all,
## run in CLI once:
## $ set -U fish_greeting

## To configure fish greeting in this file "dynamically",
## edit and uncomment the following line:
# set -g fish_greeting Blah Blah

## Similarly, either enable a theme here or choose it once in CLI.
# if status is-interactive
#     fish_config theme choose lava
# end

## Add directories to $PATH (via $fish_user_paths).
## Either run once in CLI or uncomment in this file.
## https://fishshell.com/docs/current/cmds/fish_add_path.html
# fish_add_path /opt/local/bin /opt/local/sbin

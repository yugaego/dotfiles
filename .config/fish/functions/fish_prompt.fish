function fish_prompt --description 'Write out the prompt'
    # Don't shorten the working directory.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

    # Configure Git info output.
    set -q __fish_git_prompt_show_informative_status
    or set -lx __fish_git_prompt_show_informative_status 1

    set -q __fish_git_prompt_color
    or set -lx __fish_git_prompt_color yellow

    set -q __fish_git_prompt_color_branch
    or set -lx __fish_git_prompt_color_branch yellow

    set -q __fish_git_prompt_showcolorhints
    or set -lx __fish_git_prompt_showcolorhints 1

    set -q __fish_git_prompt_color_cleanstate
    or set -lx __fish_git_prompt_color_cleanstate green

    # Output.
    echo -n -e "\n"(set_color $fish_color_cwd)(prompt_pwd)
    echo (fish_vcs_prompt)
    echo -n (set_color red)'❯'(set_color yellow)'❯'(set_color green)'❯ '
end

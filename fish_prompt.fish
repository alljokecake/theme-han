# ===========================
# han depends on the vi mode!
# ===========================

function han_vi
    set -l cwd (prompt_pwd)

    if [ $fish_key_bindings = fish_vi_key_bindings ]
        switch $fish_bind_mode
            case default
              set_color white
              echo -n "$cwd "
              set_color red
              echo "< "
            case insert
              set_color white
              echo -n "$cwd "
              set_color green
              echo "> "
            case visual
              set_color white
              echo -n "$cwd "
              set_color yellow
              echo "v "
            case replace_one
              set_color white
              echo -n "$cwd "
              set_color magenta
              echo "_ "
        end
    end
end

function han_git
    set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
    set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
    if test -n "$git_branch"
        if test -n "$git_dirty"
            set_color yellow
            echo -n "[$git_branch] "
        else
            set_color green
            echo -n "[$git_branch] "
        end
    end
end

function fish_prompt
    han_git
    han_vi
end

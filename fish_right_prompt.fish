function han_status
    set -l last_status $status
    if not test $last_status -eq 0
        set_color --bold red
        # echo "[!]"
        echo ""
        set_color normal
    end
end


function fish_right_prompt
    han_status
    set_color normal
end

  

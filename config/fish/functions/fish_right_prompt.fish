function fish_right_prompt --description "Displays the current vi mode to the right."
  # Vi mode only
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color red
        echo '*'
        set_color normal
      case visual
        set_color green
        echo 'v'
        set_color normal
       case '*'
        set_color normal
        echo ''
    end
  end
end

function fish_mode_prompt --description "Displays the current mode"
  # Vi mode only
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    switch $fish_bind_mode
      case default
        set_color red
        echo '*'
        set_color normal
        echo -n ' '
      case visual
        set_color green
        echo 'v'
        set_color normal
        echo -n ' '
       case insert
        echo ''
    end
  end
end

function tab_color --description "Sets the current tab color. Usage: tab_color <r> <g> <b>"
  echo -ne "\033]6;1;bg;red;brightness;$argv[1]\a"
  echo -ne "\033]6;1;bg;green;brightness;$argv[2]\a"
  echo -ne "\033]6;1;bg;blue;brightness;$argv[3]\a"
 end
 
function tab_nocolor --description "Resets the current tab color."
  echo -ne "\033]6;1;bg;*;default\a"
end

function tab_black
  tab_color 0 0 0
end

function tab_white
  tab_color 255 255 255
end

function tab_red
  tab_color 255 0 0
end

function tab_orange
  tab_color 255 165 0
end

function tab_yellow
  tab_color 255 255 0
end

function tab_green
  tab_color 0 128 0
end

function tab_blue
  tab_color 0 0 255
end

function tab_indigo
  tab_color 75 0 130
end

function tab_violet
  tab_color 238 130 238
end

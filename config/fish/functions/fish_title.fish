function fish_title
  if set -q fish_title_string
    echo $fish_title_string
  else
    hostname -s
  end
end

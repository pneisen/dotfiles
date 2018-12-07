function contact
  /usr/bin/awk -v pattern="$argv[1]" 'BEGIN { RS = "###"; IGNORECASE = 1 } $0 ~ pattern' $HOME/.contacts
end

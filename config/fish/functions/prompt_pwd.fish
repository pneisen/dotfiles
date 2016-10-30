function prompt_pwd --description "Print the current working directory, shortened to fit the prompt"

  # Replace $HOME with ~
  set realhome ~
  set -l tmp (string replace -r '^'"$realhome"'$' '~' $PWD)

  if [ $tmp = "~" ]
    echo $tmp
  else
    echo (basename $PWD)
  end
end

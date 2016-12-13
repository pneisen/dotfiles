function .plan
  if not test -e ~/.plan
    git clone git@github.com:pneisen/.plan.git ~/.plan
  end

  pushd ~/.plan

  git pull

  vim README.md

  if test -n (git diff --shortstat 2> /dev/null | tail -n1)
    set -l date (date)
    git commit -am "$date update"
    git push
  end

  popd
end

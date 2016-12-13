function .plan
  echo "Looking for .plan."
  if not test -e ~/.plan
    echo "Plan not found. Cloning..."
    git clone git@github.com:pneisen/.plan.git ~/.plan
  end

  pushd ~/.plan

  echo "Updating .plan from Github."
  git pull

  vim README.md

  if test (git diff --shortstat 2> /dev/null | tail -n1)
    echo "Changes made to .plan. Committing..."
    set -l date (date)
    git commit -am "$date update"
    git push
  else
    echo "No changes made to .plan."
  end

  popd
end

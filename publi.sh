currentbranch=$(git rev-parse --abbrev-ref HEAD)
branch=$(uuidgen)
git checkout --orphan "$branch"
npm install
make
git reset .
git add -f index.html ecmarkup.{js,css}
git commit -m 'gh-pages'
git push -f origin HEAD:gh-pages
git checkout -f "$currentbranch"
git branch -D "$branch"

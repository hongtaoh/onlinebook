rm -rf public
hugo
git add .
MESSAGE="rebuild site at $(date)"
git commit -m "$MESSAGE"
git push origin master
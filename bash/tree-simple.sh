# https://gist.github.com/wesbos/1432b08749e3cd2aea22fcea2628e2ed

# Put this in your .zshrc or .bashrc file
# Install `tree` first — brew install tree
function t() {
  # Defaults to 3 levels deep, do more with `t 5` or `t 1`
  # pass additional args after
  tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

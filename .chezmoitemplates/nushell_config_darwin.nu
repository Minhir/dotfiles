let brew = '/opt/homebrew/bin/brew'

$env.PATH = ($env.PATH | split row (char esep) | prepend '/opt/homebrew/bin')
$env.HOMEBREW_PREFIX = (^$brew --prefix | str trim)

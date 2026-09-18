$env.HOMEBREW_PREFIX = '/opt/homebrew'
$env.PATH = ($env.PATH | prepend ($env.HOMEBREW_PREFIX | path join 'bin') | uniq)

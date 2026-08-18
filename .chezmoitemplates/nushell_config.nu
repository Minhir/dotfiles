$env.config.buffer_editor = "code"
$env.config.show_banner = false
$env.EDITOR = "code --wait --new-window"

const autoload_dir = $nu.data-dir | path join "vendor" "autoload"
let nu_modified = (ls $nu.current-exe | get modified.0)
mkdir $autoload_dir

def init-if-stale [cmd: string, init: closure] {
  # Regenerate missing or stale autoload files; otherwise keep startup fast.
  let out = ($autoload_dir | path join $"($cmd).nu")
  let cmd_path = (which $cmd | where type == external | get -o path.0)

  if $cmd_path == null {
    rm -f $out
    print -e $"($cmd) is not installed"
    return
  }

  if ($out | path exists) {
    let cmd_modified = (ls $cmd_path | get modified.0)
    let out_modified = (ls $out | get modified.0)
    let is_stale = (
      ($out_modified < $cmd_modified) or
      ($out_modified < $nu_modified) or
      (((date now) - $out_modified) > 3day)
    )

    if not $is_stale {
      return
    }
  }

  let generated = (do $init)
  $generated | save -f $out
}

init-if-stale mise { mise activate nu }

$env.CARAPACE_BRIDGES = 'zsh'

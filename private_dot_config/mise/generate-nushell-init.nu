def main [] {
  let tool = $env.MISE_TOOL_NAME?
  if $tool == null {
    error make { msg: "MISE_TOOL_NAME is not set; this script must run from a mise tool postinstall hook" }
  }

  let args = match $tool {
    "atuin" => ["init" "nu" "--disable-up-arrow"]
    "carapace" => ["_carapace" "nushell"]
    "starship" => ["init" "nu"]
    _ => { error make { msg: $"unsupported Nushell integration: ($tool)" } }
  }

  let result = (run-external $tool ...$args | complete)
  if $result.exit_code != 0 {
    error make {
      msg: $"failed to generate Nushell integration for ($tool): exit code ($result.exit_code); ($result.stderr | str trim)"
    }
  }

  let autoload_dir = ($nu.data-dir | path join "vendor" "autoload")
  mkdir $autoload_dir
  $result.stdout | save -f ($autoload_dir | path join $"($tool).nu")
}

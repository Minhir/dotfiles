$env.config.buffer_editor = "code"
$env.config.show_banner = false
$env.EDITOR = "code --wait --new-window"

const autoload_dir = $nu.data-dir | path join "vendor" "autoload"
mkdir $autoload_dir

# Refresh mise's environment each startup and load it before other integrations.
^mise activate nu | save -f ($autoload_dir | path join "00-mise.nu")

$env.CARAPACE_BRIDGES = 'zsh'

# config.nu
$env.config.buffer_editor = "code"
$env.config.show_banner = false

const autoload_dir = $nu.default-config-dir | path join "autoload"

mkdir $autoload_dir

^mise activate nu | save -f ($autoload_dir | path join "mise.nu")
starship init nu | save -f ($autoload_dir | path join "starship.nu")

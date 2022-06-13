switch -Wildcard ($(file --brief --mime-type $args[0])){
  "text/*" {bat --style plain --color=always --theme=base16 $args[0]};
  "image/*" {
    # lf -remote "send $id set nopreview"
    # lf -remote "send $id set ratios 1:2"
    # wezterm cli split-pane --horizontal -- pwsh -c "echo '' && wezterm imgcat '$args' && pause && lf -remote 'send $id set ratios 1:2:3' && lf -remote 'send $id set preview' "
    # wezterm cli split-pane --horizontal -- pwsh -c "echo '' && wezterm imgcat '$args' && [Console]::ReadKey() && lf -remote 'send $id set ratios 1:2:3' && lf -remote 'send $id set preview' "
    viu --blocks --width 65 $args[0]
    exit 0
  };
  # "*" {ls $args[0]};
  Default {bat --style plain --color=always --theme=base16 $args[0]};
}


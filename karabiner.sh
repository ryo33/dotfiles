#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.wait 40
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set remap.pc_style_copy_paste 1
/bin/echo -n .
$cli set remap.jis_jansi 1
/bin/echo -n .
$cli set remap.japanese_command2eisuukana_prefer_command_v2 1
/bin/echo -n .
$cli set option.mousekeys_mode_uio2click 1
/bin/echo -n .
$cli set option.vimode_control_hjkl 1
/bin/echo -n .
$cli set remap.shiftEscape2capslock 1
/bin/echo -n .
$cli set remap.simultaneouskeypresses_mouse_keys_mode_df 1
/bin/echo -n .
/bin/echo

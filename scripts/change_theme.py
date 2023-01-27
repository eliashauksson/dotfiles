#!/usr/bin/python
import io
import os

DARK_THEME="macchiato"
LIGHT_THEME="latte"

COLOR_FILE=f"{os.environ['HOME']}/.config/.color"

def get_next_theme(path=COLOR_FILE):
    if not os.path.exists(path):
        with open(path, "w") as file:
            file.write(DARK_THEME)
        
    with open(path, "r") as file:
        theme = file.readlines()[0]

    next_theme = DARK_THEME if theme == LIGHT_THEME else LIGHT_THEME

    with open(path, "w") as file:
        file.writelines([next_theme])

    return next_theme

def toggle_emacs_theme(path=f"{os.environ['HOME']}/.config/emacs/init.el",
                       change_to=DARK_THEME):
    
    with open(path, "r", encoding="utf-8") as file:
        data = file.readlines()

    for i in range(len(data)):
        if "setq catppuccin-flavor" in data[i]:
            data[i] = f"(setq catppuccin-flavor '{change_to})\n"
        
    with open(path, "w", encoding="utf-8") as file:
        file.writelines(data)

    os.system(f"emacsclient --eval \"(load-file \\\"{path}\\\")\" >/dev/null")

def toggle_kitty_theme(path=f"{os.environ['HOME']}/.config/kitty/kitty.conf",
                       change_to=DARK_THEME):

    with open(path, "r", encoding="utf-8") as file:
        data = file.readlines()

    for i in range(len(data)):
        if "include themes/catppuccin" in data[i]:
            data[i] = f"include themes/catppuccin_{change_to}.conf\n"

    with open(path, "w", encoding="utf-8") as file:
        file.writelines(data)

    os.system(f"kitty @ set-colors --all {os.environ['HOME']}/.config/kitty/themes/catppuccin_{change_to}.conf")

def toggle_polybar_theme(path=f"{os.environ['HOME']}/.config/polybar/config.ini",
                         change_to=DARK_THEME):

    with open(path, "r", encoding="utf-8") as file:
        data = file.readlines()

    for i in range(len(data)):
        if "include-file = ~/.config/polybar/themes/" in data[i]:
            data[i] = f"include-file = ~/.config/polybar/themes/{change_to}.ini\n"

    with open(path, "w", encoding="utf-8") as file:
        file.writelines(data)

    os.system("bspc wm -r")

def toggle_bspwm_theme(path=f"{os.environ['HOME']}/.config/bspwm/bspwmrc",
                       change_to=DARK_THEME):

    with open(path, "r", encoding="utf-8") as file:
        data = file.readlines()

    for i in range(len(data)):
        if "theme=" in data[i]:
            data[i] = f"theme=\"{change_to}\"\n"

    with open(path, "w", encoding="utf-8") as file:
        file.writelines(data)

    os.system("bspc wm -r")

if __name__ == "__main__":
    next_theme = get_next_theme()
    toggle_emacs_theme(change_to=next_theme)
    toggle_kitty_theme(change_to=next_theme)
    toggle_polybar_theme(change_to=next_theme)
    toggle_bspwm_theme(change_to=next_theme)

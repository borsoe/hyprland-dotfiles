# hyprland-dotfiles
my dotfiles for [hyprland](https://github.com/hyprwm/Hyprland).

# screenshots

![Alt text](/Screenshots/01.png?raw=true "Optional Title")
![Alt text](/Screenshots/02.png?raw=true "Optional Title")
![Alt text](/Screenshots/03.png?raw=true "Optional Title")

# info

- OS: [`Arch Linux`](https://archlinux.org/)
- WM: [`Hyprland`](https://github.com/hyprwm/Hyprland)
- Bar: [`Waybar-hyprland`](https://aur.archlinux.org/packages/waybar-hyprland-git)
- Launcher: [`Wofi`](https://man.archlinux.org/man/wofi.1.en)
- Shell: [`Fish`](https://fishshell.com/)
- Terminal: [`Kitty`](https://sw.kovidgoyal.net/kitty/)
- Wallpaper: [`Almamu /linux-wallpaperengine`](https://github.com/Almamu/linux-wallpaperengine)

# note

This configurations requires an installation of [wallpaper engine](https://www.wallpaperengine.io/en) via steam in order for the animated background to work.
you can disable this feature by removing 

```
exec-once = ~/.config/waybar/scripts/changeWallpaper.sh
```

line form '.config/hypr/hyprland.conf'

Also in that case, you might also want to remove the 'custom/wallpaper' module form '.config/waybar/config'

#installation

simply run 

```
./setupDotfiles.sh
```

the script will first check if you have installed [stow](https://www.gnu.org/software/stow/) or not, then will link the files in this repositoty to your `$HOME/.config` files.
You can edit this script by removing the unwanted packages from the `PACKS` array.

__Note that the script currently doesn't backup your previous configs so use caution!__

#credit

I have partially used the codes from the following repositories in order to make this dotfiles:

- [ChrisTitusTech/hyprland-titus](https://github.com/ChrisTitusTech/hyprland-titus)
- [JaKooLit/Hyprland-v2.1](https://github.com/JaKooLit/Hyprland-v2.1)
- [https://github.com/SolDoesTech/HyprV4](https://github.com/SolDoesTech/HyprV4)
- [i4pg/dotfiles](https://github.com/i4pg/dotfiles)
- https://github.com/SolDoesTech/HyprV4

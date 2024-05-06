{ config, pkgs, ... }:
let
  mod = "Mod4";
  refreshI3Status = "killall -SIGUSR1 i3status";
in
{
  options.xsession.windowManger.i3 = {
    enable = true;
    config = {
      modifier = mod;
      fonts = {
        names = [ "BerkeleyMono NerdFont" "Noto Emoji" ];
        size = 12.0;
      };
      startup = [
        {
          command = "dex --autostart --environment i3";
        }
        { command = "xss-lock --transfer-sleep-lock -- i3lock --nofork"; }
        { command = "nm-applet"; }
        { command = "feh --bh-center $HOME/Wallpaper/$(ls $HOME/Wallpaper | shuf -n 1)"; }
      ];
      floating = {
        modifier = mod;
      };
      workspaceOutputAssign = {
        "1" = {
          output = "DP-4";
          workspace = "Firefox";
        };
        "2" = {
          output = "DP-4";
          workspace = "Slack";
        };
        "3" = {
          output = "DP-4";
          workspace = "Random";
        };
        "4" = {
          output = "DP-2";
          workspace = "Nvim";
        };
        "5" = {
          output = "DP-2";
          workspace = "Obsidian";
        };
        "6" = {
          output = "DP-2";
          workspace = "Mail";
        };
      };
      keybindings = {
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && ${refreshI3Status}";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && ${refreshI3Status}";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && ${refreshI3Status}";
        "XF86AudioMicMute" = "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && ${refreshI3Status}";
        "${mod}+Return" = "exec kitty";
        "${mod}+q" = "kill";
        # focus window
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";
        # move window
        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";
        # splits
        "${mod}+b" = "split h";
        "${mod}+v" = "split v";
        "${mod}+f" = "fullscreen toggle";
        # layouts
        "${mod}+s" = "layout stacking";
        "${mod}+w" = "layout tabbed";
        "${mod}+e" = "layout togglwe split";
        # float of tiling toggle
        "${mod}+Shift+space" = "floating toggle";
        "${mod}+space" = "focus mode_toggle";
        # workspace go
        "${mod}+y" = "workspace 1";
        "${mod}+u" = "workspace 2";
        "${mod}+i" = "workspace 3";
        "${mod}+o" = "workspace 4";
        "${mod}+p" = "workspace 5";
        # workspace move
        "${mod}+Shift+y" = "move container to workspace number 1";
        "${mod}+Shift+u" = "move container to workspace number 2";
        "${mod}+Shift+i" = "move container to workspace number 3";
        "${mod}+Shift+o" = "move container to workspace number 4";
        "${mod}+Shift+p" = "move container to workspace number 5";
        # Reload
        "${mod}+Shift+c" = "reload";
        "${mod}+Shift+r" = "restart";
        # Modes
        "${mod}+Shift+e" = "mode \"(S)uspend, (L)ogout, (R)eboot, (P)oweroff\"";
        "${mod}+Shift+x" = "exec i3lock -c 000000";
        "${mod}+r" = "mode \"resize\"";
        # Screen shot
        "${mod}+Shift+1" = "exec scrot -M 1 ~/Documents/Caputures/$(date '+%FT%H-%M-%S').png -e 'xclip --selection clipboard -target image/png -i $f'";
        "${mod}+Shift+2" = "exec scrot -M 0 ~/Documents/Caputures/$(date '+%FT%H-%M-%S').png -e 'xclip --selection clipboard -target image/png -i $f'";
        "${mod}+Shift+3" = "exec scrot -u ~/Documents/Caputures/$(date '+%FT%H-%M-%S').png -e 'xclip --selection clipboard -target image/png -i $f'";
        "${mod}+Shift+4" = "exec sleep 0.2 && scrot -s -f ~/Captures/Screenshots/$(date '+%FT%H-%M-%S').png -e 'xclip -selection clipboard -target image/png -i $f'";

      };
      keycoebingings = {
        "${mod}+34" = "workspace 6";
        "${mod}+Shift+34" = "move container to workspace number 6";
      };
      gaps = {
        inner = 10;
        outer = 5;
      };
      modes = {
        "(S)uspend, (L)ogout, (R)eboot, (P)oweroff" = {
          r = "exec --no-startup-id systemctl reboot";
          s = "exec --no-startup-id systemctl suspend; mode \"default\"";
          l = "exit";
          p = "exec --no-startup-id systemctl poweroff";
          Return = "mode \"default\"";
          Escape = "mode \"default\"";
        };
        resize = {
          h = "resize shrink width 10 px or 10 ppt";
          j = "resize shrink width 10 px or 10 ppt";
          l = "resize grow width 10 px or 10 ppt";
          k = "resize grow width 10 px or 10 ppt";

          Return = "mode \"default\"";
          Escape = "mode \"default\"";

        };
      };
      assigns = {
        "1" = [{ class = "firefox"; }];
        "2" = [{ class = "Slack"; }];
        "5" = [{ class = "obsidian"; }];
        "6" = [{ class = "thunderbird"; }];
      };
    };
  };
}

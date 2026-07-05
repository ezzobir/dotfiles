if status is-interactive
    # Commands to run in interactive sessions can go here

    # # BEGIN ZELLIJ
    # # -----------------------------------------------------
    # eval (zellij setup --generate-auto-start fish | string collect)
    # # -----------------------------------------------------
    # # END ZELLIJ
end

# BEGIN DISABLE GREETING MESSAGE
# -----------------------------------------------------
set -U fish_greeting ""
# -----------------------------------------------------
# END DISABLE GREETING MESSAGE

# BEGIN ENVIRONMENT VARIABLES
# -----------------------------------------------------
set -Ux COLORTERM truecolor
set -x QT_QPA_PLATFORMTHEME qt6ct
# -----------------------------------------------------
# END ENVIRONMENT VARIABLES

# BEGIN EMACS MODE
# -----------------------------------------------------
fish_default_key_bindings
# -----------------------------------------------------
# END EMACS MODE

# # BEGIN VI MODE
# # -----------------------------------------------------
# fish_vi_key_bindings
# # -----------------------------------------------------
# # END VI MODE

# # BEGIN HELIX MODE
# # -----------------------------------------------------
# fish_helix_key_bindings
# # -----------------------------------------------------
# # END HELIX MODE

# # BEGIN VI_EMACS MODE
# # -----------------------------------------------------
# function fish_user_key_bindings
#     # Execute this once per mode that emacs bindings should be used in
#     fish_default_key_bindings -M insert

#     # Then execute the vi-bindings so they take precedence when there's a conflict.
#     # Without --no-erase fish_vi_key_bindings will default to
#     # resetting all bindings.
#     # The argument specifies the initial mode (insert, "default" or visual).
#     fish_vi_key_bindings --no-erase insert
# end
# # -----------------------------------------------------
# # END VI_EMACS MODE

# # BEGIN HELIX_EMACS MODE
# # -----------------------------------------------------
# function fish_user_key_bindings
#     # Execute this once per mode that emacs bindings should be used in
#     fish_default_key_bindings -M insert

#     # Then execute the vi-bindings so they take precedence when there's a conflict.
#     # Without --no-erase fish_vi_key_bindings will default to
#     # resetting all bindings.
#     # The argument specifies the initial mode (insert, "default" or visual).
#     fish_helix_key_bindings --no-erase insert
# end
# # -----------------------------------------------------
# # END HELIX_EMACS MODE

# BEGIN DEFAULT EDITOR
# -----------------------------------------------------
# set -Ux EDITOR emacs -nw
# set -Ux VISUAL emacs -nw
# set -Ux EDITOR emacs
# set -Ux VISUAL emacs
set -Ux EDITOR helix
set -Ux VISUAL helix
# -----------------------------------------------------
# END DEFAULT EDITOR

# BEGIN PACMAN
# -----------------------------------------------------
alias u='doas pacman -Syu'
alias i='doas pacman -S'
alias q='doas pacman -Ss'
alias r='doas pacman -Rns'
# -----------------------------------------------------
# END PACMAN

# BEGIN PARU
# -----------------------------------------------------
alias pu='paru -Sua'
alias pi='paru -S'
alias pq='paru -Ss'
alias pr='paru -Rns'
# -----------------------------------------------------
# END PARU

#BEGIN TERMINAL
# -----------------------------------------------------
alias c='clear'
alias e='exit'
alias ll='ls -Fl'
alias la='ls -FAl'
# -----------------------------------------------------
# END TERMINAL

# BEGIN EMACS
# -----------------------------------------------------
alias em='emacs -nw'
# -----------------------------------------------------
# END EMACS

# BEGIN HELIX
# -----------------------------------------------------
alias hx='helix'
# -----------------------------------------------------
# END HELIX

# BEGIN PYTHON
# -----------------------------------------------------
alias p='python'
# -----------------------------------------------------
# END PYTHON

# BEGIN EDIT CONFIG FILES
# -----------------------------------------------------
alias confb='helix ~/.bashrc'
alias conff='helix ~/.config/fish/config.fish'
alias confa='helix ~/.config/alacritty/alacritty.toml'
alias confn='helix ~/.config/niri/config.kdl'
# -----------------------------------------------------
# END EDIT CONFIG FILES

# BEGIN PDF
# -----------------------------------------------------
alias pdf='sioyek --new-window'
# -----------------------------------------------------
# END PDF

# BEGIN YOUTUBE-DLP
# -----------------------------------------------------
alias da='yt-dlp -x --audio-format mp3'
alias dap='yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias dac='yt-dlp --extract-audio --audio-format mp3 --ignore-errors'
alias dv='yt-dlp -t mp4'
alias dvp='yt-dlp -o "%(playlist_index)s_%(title)s.%(ext)s" -t mp4 --yes-playlist'
alias wv="mpv --ytdl-format='bestvideo[height<=1080]+bestaudio/best[height<=1080]'"
# -----------------------------------------------------
# END YOUTUBE-DLP

# BEGIN YTFZF
# -----------------------------------------------------
alias yt='ytfzf -t'
# -----------------------------------------------------
# END YTFZF

# BEGIN YAZI
# -----------------------------------------------------
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    command rm -f -- "$tmp"
end
# -----------------------------------------------------
# END YAZI

# BEGIN STARSHIP
# -----------------------------------------------------
starship init fish | source
# -----------------------------------------------------
# END STARSHIP

# BEGIN ZOXIDE
# -----------------------------------------------------
zoxide init fish | source
# -----------------------------------------------------
# END ZOXIDE

# BEGIN FZF
# -----------------------------------------------------
# Set up fzf key bindings
fzf --fish | source
# -----------------------------------------------------
# END FZF

# BEGIN ZELLIJ
# -----------------------------------------------------
alias zj='zellij'
# -----------------------------------------------------
# END ZELLIJ

# BEGIN THEME
# -----------------------------------------------------
# fish-modus-vivendi color theme

set -l foreground ffffff # fg-main
set -l comment a8a8a8 # fg-alt
set -l selection 34cfff # blue-active
# *-intense color
set -l red fe6060
set -l orange fba849
set -l green 4fe42f
set -l yellow f0dd60
set -l blue 4fafff
set -l magenta ff62d4
set -l purple 9f80ff
set -l cyan 3fdfd0

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $purple
set -g fish_color_keyword $magenta
set -g fish_color_quote $blue
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $cyan
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $magenta
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
# -----------------------------------------------------
# BEGIN THEME

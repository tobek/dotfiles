#!/bin/bash

alias alia='alias | grep -P "\s[\w\.]+="'
alias funcs='grep " () " ~/.bash_functions | sort'
alias functions='grep " () " ~/.bash_functions | sort'

alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#alias curl='echo "use http (https://httpie.org/)"'

alias ls='ls --color=always -h --group-directories-first'
alias exa='exa --group-directories-first --color=always'
alias la='exa -a'
alias ll='exa --header --long --git'
alias l='ll'
alias lla='ll -a'
alias llx='ll --extended'
alias lt='ll --tree --level=2'
alias lt2='ll --tree --level=2'
alias lt3='ll --tree --level=3'
alias lt4='ll --tree --level=4'
alias lt5='ll --tree --level=5'
alias lt6='ll --tree --level=6'
alias ltn='ll --tree'
alias ltx='ll --tree'
#alias lll='ls -l | lolcat' # made a function
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ffmpeg='ffmpeg -hide_banner'
alias ffprobe='ffprobe -hide_banner'
alias ssc='sudo systemctl'
alias xo='xclip -o'

alias less='less -iR' # support ANSI color codes, ignore case in search
alias zless='zless -iR' # support ANSI color codes, ignore case in search

alias glow='glow -w 0' # full width of terminal

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ct='cd ~/shit/tmp'

alias o='kfmclient exec'
alias xclip='xclip -selection clipboard'

alias xrandr1='xrandr --output eDP-1 --auto --pos 0x0'
alias xrandr1440='xrandr --output eDP-1 --auto --pos 0x2160 --output DP-1 --auto --scale 1.5x1.5 --pos 0x0 --fb 3840x4320' # 1440p external monitor, scaled
alias xrandr1440u='xrandr --output eDP-1 --auto --pos 0x1440 --output DP-1 --auto --scale 1x1 --pos 640x0 --fb 3840x3600' # 1440p external monitor, unscaled
alias xrandr1440m='xrandr --output eDP-1 --auto --pos 0x0 --output DP-1 --auto --scale-from 3840x2160 --pos 0x0 --same-as eDP-1' # 1440p external monitor mirroring primary
alias xrandr1080='xrandr --output eDP-1 --auto --pos 0x2160 --output HDMI-1 --auto --scale 2x2 --pos 0x0 --fb 3840x4320' # 1080p external monitor on HDMI
alias xrandr1080u='xrandr --output eDP-1 --auto --pos 0x2160 --output DP-1 --auto --scale 1x1 --pos 0x0 --fb 3840x4320' # 2160p external monitor on DP-1
alias xrandr1200='xrandr --output eDP-1 --auto --pos 0x2400 --output DP-1 --auto --scale 2x2 --pos 0x0 --fb 3840x4560' # 1920x1200 external monitor on DP-1
alias xrandr3840='xrandr --output eDP-1 --auto --pos 0x2160 --output HDMI-1 --auto --scale 1.5x1.5 --pos 0x0 --fb 3840x4320' # this isn't quite right but... it worked

alias xrandr1680x1050='xrandr --output eDP-1 --auto --pos 0x2100 --output DP-1 --auto --scale 2x2 --pos 240x0 --fb 3840x4260'

alias xtouch='xinput --map-to-output "ELAN Touchscreen" eDP-1'

alias k810='sudo k810-conf -d /dev/hidraw2 -f on'

alias f='command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n | lolcat'
alias fa='command fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n | lolcat -a --speed=100'

# alias m='cmatrix -u 9 -C $(shuf -e red cyan blue magenta yellow -n 1)'
alias m='unimatrix -f -l mmmScCgG -s 92 -a -c $(shuf -e red cyan blue magenta yellow -n 1)'
# alias mr='cmatrix -u 9 | lolcat'
alias mr='unimatrix -f -l mmmScCgG -s 92 -a | lolcat'
alias mt='unimatrix -f -l aaAASSnngG -s 95 -a -c $(shuf -e red cyan blue magenta yellow -n 1)'
alias mrt='unimatrix -f -l aAAASSnngG -s 92 -a | lolcat'
alias me='unimatrix -f -l e -s 92 -a -c $(shuf -e red cyan blue magenta yellow -n 1)'
alias mre='unimatrix -f -l e -s 92 -a | lolcat'
alias mra='cmatrix -u 6 -r -b'

alias neo='neofetch'
alias neor='neofetch | lolcat'
alias neora='neofetch | lolcat -a --speed=150'

alias rainbow='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'

alias astro='astroterm --color --constellations --speed 500 --fps 64 --unicode --city "San Francisco"'

alias g='git'

alias y='yarn'
alias ypl='yarn prettier && yarn lint'
alias ylb='find ~/.config/yarn/link -type l | xargs -r file | sort'
alias ylk='find node_modules -type l | grep -v .bin | xargs -r file | sort'

alias forget='unset HISTFILE'

alias reorient='sudo modprobe brcmfmac && sudo modprobe -r brcmfmac && sudo modprobe brcmfmac'

alias ansi='cp437 curl http://artscene.textfiles.com/ansi/artwork/$(shuf -e borgman fox_goat fruit flower face_2 fort theq timebend truckan -n 1).ans'

alias tidyhtml='wl-paste | tidy -indent -quiet --show-errors 0 | wl-copy'

alias dfh='df -h /dev/nvme0n1p5'

alias nr='npm run'

alias yayy='yay -Syu --answerdiff None --sudoloop --mflags --nocheck'
alias yayyy='yay -Syu --answerclean All --answerdiff None --sudoloop --mflags --nocheck --noconfirm'

alias cld='claude --dangerously-skip-permissions'
alias cldr='claude --dangerously-skip-permissions --resume'

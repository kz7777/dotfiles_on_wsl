#for neovim
export XDG_CONFIG_HOME="$HOME/.config"

#w3m for defult browser
export BROWSER=w3m

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -v

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

#alias
alias g="googler -n 3"


# Compatible with ranger 1.4.2 through 1.7.*
#
# Automatically change the directory in bash after closing ranger
#
# This is a bash function for .bashrc to automatically change the directory to
# the last visited one after ranger quits.
# To undo the effect of this function, you can type "cd -" to return to the
# original directory.

function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

# This binds Ctrl-O to ranger-cd:
#bind '"\C-o":"ranger-cd\C-m"'

#OFFICEパス追加
export PATH=$PATH:/mnt/c/Program\ Files\ \(x86\)/Microsoft\ Office/Office15


# 追加PATH関連
alias ppt='POWERPNT.EXE'
alias excel='EXCEL.EXE'
alias word='WINWORD.EXE'
alias open='wsl-open'




# ------------------------------------
# 2019-07-17 追記 ranger-cd https://syossan.hateblo.jp/entry/2017/02/04/192111
# ------------------------------------
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/local/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
        if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
                cd -- "$(cat "$tempfile")"
                fi
                rm -f -- "$tempfile"
            }

            bindkey -s '^o' 'ranger-cd^M'

# ranger-cdエイリアス
alias ranger='ranger-cd'
# openコマンドでexplorerを開けるように
function open {
    pwd | sed -e "s;/mnt/c;C:;" -e "s;\/;\\\\\\\\;g" | xargs explorer.exe
}



## 初回シェル時のみ tmux実行 --> 動かない
#if [ $SHLVL = 1 ]; then
#    tmux a
#fi


# trash-putコマンド関連 ゴミ箱 rangerでは動かない??
if type trash-put &> /dev/null
then
        alias rm=trash-put
fi


#mac ssh
#シェルファイルを読み込み
alias mac="sh ~/codex/mac.sh"
#自宅macシェルファイルを読み込み
alias mac_home="sh ~/codex/mac_home.sh"
#Kドライブマウント
alias kdrive="sudo mount -t drvfs K: /mnt/kdrive"
#メモ作成
alias memo="cd ~/memox && vim"
#ranger用
alias sep="ranger && gn && ~"

#ログイン時tmux起動
#[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

#ホームディレクトリに移動
cd

#ログイン時tmux attached
#tmux attach

#jjでesc
#https://codeday.me/jp/qa/20190810/1424130.html
bindkey -s jj '\e'
bindkey jj vi-cmd-mode
# vim日本語ヘルプhttps://qiita.com/KeitaNakamura/items/b87322d38fef4da3bac5
export LC_ALL=ja_JP.UTF-8

#condaで仮想環境
conda activate vscode

#ロケール変更
export LANG=ja_JP.UTF8

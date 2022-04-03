# 色
autoload -Uz colors
colors

# 補完機能
autoload -Uz compinit
compinit

# ヒストリ
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
# 同じコマンドの連続実行はヒストリに残さない
setopt hist_ignore_dups

# 表示形式
local prompt_location="%B%F{027}%n@%F{045}%m%b%f:%~%b%f"
local promot_mark="%(!,#,❯)%b"

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst

# vcsの表示
zstyle ':vcs_info:*' formats '%s][* %F{green}%b%f'
zstyle ':vcs_info:*' actionformats '%s][* %F{green}%b%f(%F{red}%a%f)'

# プロンプト表示直前にvcs_info呼び出し
precmd() {
    vcs_info
}

# vcs_info_msg_0_の書式設定
# zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-changes false
zstyle ':vcs_info:git:*' stagedstr         "%F{yellow}!%f"
zstyle ':vcs_info:git:*' unstagedstr       "%F{red}+%f"
zstyle ':vcs_info:*'     formats           " (%F{green}%b%f%c%u)"
zstyle ':vcs_info:*'     actionformats     ' (%b|%a)'

# プロンプト
PROMPT="
${prompt_location}"'$vcs_info_msg_0_'"
${promot_mark} "

# エイリアス
alias ll='ls -al'
alias g='git'
alias gf='git fetch'
alias lg='lazygit'

# キーバインド
# cmd + delete
bindkey "^X\\x7f" backward-kill-line 

# パス
export PATH=$PATH:/usr/local/bin
export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
export PATH=/opt/homebrew/bin:$PATH

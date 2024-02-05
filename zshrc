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

# PROMPT変数内で変数参照する
setopt prompt_subst

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ビープ音を消す
setopt no_beep


# vcs_infoロード
autoload -Uz vcs_info
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

# キーバインド
# cmd + delete
bindkey "^X\\x7f" backward-kill-line 
bindkey "^A" beginning-of-line
bindkey "^B" backward-char
bindkey "^E" end-of-line
bindkey "^F" forward-char

# パス
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/opt/local/bin:/opt/local/sbin/
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/opt/homebrew/sbin


ZSH_DIR="${HOME}/.zsh"

# .zshがディレクトリで、読み取り、実行、が可能なとき
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    # zshディレクトリより下にある、.zshファイルの分、繰り返す
    for file in ${ZSH_DIR}/**/*.zsh; do
        # 読み取り可能ならば実行する
        [ -r $file ] && source $file
    done
fi


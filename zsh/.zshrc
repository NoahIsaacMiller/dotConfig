# ──────────────────────────────────────────────────────────
# 基础路径与环境变量
# ──────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/nvim-macos-arm64/bin:/opt/arm-none-eabi/bin:$PATH"


# ──────────────────────────────────────────────────────────
# 提示符与核心导航工具
# ──────────────────────────────────────────────────────────
export STARSHIP_CONFIG=~/.config/starship/catppuccin-powerline.toml
eval "$(starship init zsh)"

eval "$(zoxide init zsh)"
eval "$(thefuck --alias)"


# ──────────────────────────────────────────────────────────
# Conda 环境
# ──────────────────────────────────────────────────────────
__conda_setup="$('/opt/homebrew/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup


# ──────────────────────────────────────────────────────────
# Node 版本管理
# ──────────────────────────────────────────────────────────
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# ──────────────────────────────────────────────────────────
# Oh My Zsh 核心配置
# ──────────────────────────────────────────────────────────
zstyle ':omz:update' mode disabled
DISABLE_LS_COLORS="false"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-completions
  autojump
)

source "$ZSH/oh-my-zsh.sh"


# ──────────────────────────────────────────────────────────
# 补全系统美化
# ──────────────────────────────────────────────────────────
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=250"


# ──────────────────────────────────────────────────────────
# 历史记录优化
# ──────────────────────────────────────────────────────────
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

setopt HIST_IGNORE_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE


# ──────────────────────────────────────────────────────────
# 现代化命令别名
# ──────────────────────────────────────────────────────────
alias ls='lsd'
alias ll='lsd -l'
alias la='lsd -a'

alias cat='bat --style=plain'
alias ff='fd'
alias rg='rg --smart-case'


# ──────────────────────────────────────────────────────────
# lsd 配置
# ──────────────────────────────────────────────────────────



# ──────────────────────────────────────────────────────────
# 开机欢迎画面（只在独立终端模拟器显示，IDE/SSH 全屏蔽）
# ──────────────────────────────────────────────────────────

# SSH 直接不显示
[[ -n "${SSH_CLIENT:-}" || -n "${SSH_TTY:-}" ]] && return 0

# 明确是 IDE 终端的全部枪毙
[[ "${TERM_PROGRAM:-}"     == "vscode"                     ]] && return 0
[[ "${TERM_PROGRAM:-}"     == "cursor"                     ]] && return 0
[[ "${TERM_PROGRAM:-}"     =~ ^JetBrains                   ]] && return 0
[[ "${TERMINAL_EMULATOR:-}" == "JetBrains-JediTerm"        ]] && return 0
[[ -n "${IDE_TERMINAL:-}"                                 ]] && return 0
[[ "${TERM_PROGRAM:-}"     == "tmux"                       ]] && return 0

# 一些极端情况下 IDE 会把 TERM 设成 dumb
[[ "${TERM:-}" == "dumb"                                   ]] && return 0

# 手动禁用开关（留个后门）
[[ -n "${DISABLE_FASTFETCH:-}"                            ]] && return 0

# ── 上面全部没命中 → 说明是真正的独立终端模拟器（iTerm2、Alacritty、Warp、WezTerm、Kitty、Tabby、Ghostty…）──
fastfetch --config ~/.config/fastfetch/customized.jsonc 2>/dev/null
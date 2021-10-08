# prezto
# zinit snippet PZT::modules/helper/init.zsh

#p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# コマンド補完
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1 

# 履歴補完
zinit light zsh-users/zsh-autosuggestions

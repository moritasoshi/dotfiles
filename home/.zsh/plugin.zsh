# prezto
# zinit snippet PZT::modules/helper/init.zsh

# p10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# zsh-completions
zinit ice wait"0" lucid; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit
## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

# zsh-autosuggestions
zinit ice wait"0" lucid; zinit light zsh-users/zsh-autosuggestions

zinit light mroth/evalcache

# Jump directories
# zinit load agkozak/zsh-z

# https://qiita.com/b4b4r07/items/2cf90da00a4c2c7b7e60
# zinit load b4b4r07/enhancd

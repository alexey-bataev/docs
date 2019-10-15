export ZSH=~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-robbyrussell-SLASH-oh-my-zsh.git
export TERM='xterm-256color'
export ICS_LDAP_SERVER=10.104.192.68
export PATH=~/tools/bin:$PATH
#. ~/.bashrc.abataev
. ~/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle common-aliases
antigen bundle autojump
antigen bundle compleat
antigen bundle git-extras
antigen bundle git-flow
antigen bundle bundler
antigen bundle osx
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle svn
antigen bundle svn-fast-info
antigen bundle command-not-found
antigen bundle robbyrussell/oh-my-zsh
antigen bundle zsh-users/zsh-completions
antigen bundle khrt/svn-n-zsh-plugin
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh
antigen bundle tarruda/zsh-autosuggestions
#antigen theme https://github.com/alexey-bataev/my-agnoster my-agnoster
antigen theme https://github.com/agnoster/agnoster-zsh-theme agnoster
user_agnoster() {
  local user=`whoami`
  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CONNECTION" ]]; then
    prompt_segment red default " %(!.%{%F{yellow}%}.)$user@%m "
  fi
}
dir_agnoster() {
 prompt_segment blue default ' %~ '
}
git_agnoster() {
  local ref dirty mode repo_path
  if [[ -n "$vcs_info_msg_0_" ]]; then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment yellow black
    else
      prompt_segment green black
    fi
    repo_path=$(git rev-parse --git-dir 2>/dev/null)
    if [[ -e "${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "${repo_path}/rebase" || -e "${repo_path}/rebase-apply" || -e "${repo_path}/rebase-merge" || -e "${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt prompt_subst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    #zstyle ':vcs_info:git*' get-revision true
    zstyle ':vcs_info:git*' check-for-changes true
    zstyle ':vcs_info:git*' stagedstr '✚'
    zstyle ':vcs_info:git*' unstagedstr '●'
    zstyle ':vcs_info:git*' formats ' %u%c'
    zstyle ':vcs_info:git*' actionformats ' %u%c'
    vcs_info
    echo -n "${ref/refs\/heads\//$BRANCH }${vcs_info_msg_0_%% }${mode}"
  fi
}

DISABLE_AUTO_UPDATE=true
#export PATH=/usr/lib/ccache:$PATH
#export CCACHE_PREFIX=clang
date="$(date +%Y%m%d).zshts"
if [ ! -f ~/"$date" ]; then
  rm -f ~/*.zshts &> /dev/null
  echo > ~/"$date"
  antigen selfupdate
  antigen update
fi
clang="$(date +%Y%m%d).$(hostname -s)"
if [ ! -f ~/"$clang" ]; then
  rm -f ~/*."$(hostname -s)" &> /dev/null
  echo > ~/"$clang"
  for dir in ~/clang_tools/llvm ~/clang_tools/llvm/tools/clang ~/clang_tools/llvm/tools/clang/tools/extra ~/clang_tools/llvm/projects/compiler-rt ~/clang_tools/llvm/projects/openmp; do
    pushd $dir
    git pull --rebase
    popd
  done
  pushd ~/clang_tools/
  nice ninja -j4
  popd
  vim +PlugUpdate +qall
  pushd ~/vim_plugins/YouCompleteMe
  CC=clang CXX=clang++ /usr/bin/python ./install.py --clang-completer
  popd
fi
antigen apply
plugins=(git osx command-not-found git-extras git-flow svn-fast-info)
plugins+=(svn-n svn zsh-completions zsh-history-substring-search zsh-autosuggestions zsh-syntax-highlighting)
# Enable additions
autoload -U compinit promptinit
compinit
promptinit
# Корректировка ввода
setopt CORRECT_ALL
# Если в слове есть ошибка, предложить исправить её
SPROMPT="Ошибка! ввести %r вместо %R? ([Y]es/[N]o/[E]dit/[A]bort) "
# Не нужно всегда вводить cd
# просто наберите нужный каталог и окажитесь в нём
setopt autocd
# При совпадении первых букв слова вывести меню выбора
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#  History
# хранить историю в указанном файле
export HISTFILE=~/.zsh_history
# максимальное число команд, хранимых в сеансе
export HISTSIZE=1000
export SAVEHIST=$HISTSIZE
# включить историю команд
setopt APPEND_HISTORY
# убрать повторяющиеся команды, пустые строки и пр.
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
# Enable autosuggestions automatically
#source ~/.antigen/repos/https-COLON--SLASH--SLASH-github.com-SLASH-tarruda-SLASH-zsh-autosuggestions.git/autosuggestions.zsh
#unset COMPLETION_WAITING_DOTS # https://github.com/tarruda/zsh-autosuggestions#known-issues
#AUTOSUGGESTION_HIGHLIGHT_COLOR='fg=3'
## Remove *-line-or-history widgets from list of widgets that clear the autosuggestion to avoid conflict with history-substring-search-* widgets
#ZSH_AUTOSUGGEST_CLEAR_WIDGETS=("${(@)ZSH_AUTOSUGGEST_CLEAR_WIDGETS:#(up|down)-line-or-history}")
# Add history-substring-search-* widgets to list of widgets that clear the autosuggestion
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(history-substring-search-up history-substring-search-down)
AGNOSTER_PROMPT_SEGMENTS=("prompt_status" "user_agnoster" "prompt_virtualenv" "dir_agnoster" "git_agnoster" "prompt_end")

clang_git() {
#  pushd ~/development/build/llvm/tools/clang
  pushd ~/development/build/llvm-project/clang
}
llvm_git() {
#  pushd ~/development/build/llvm
  pushd ~/development/build/llvm-project/llvm
}
llninja() {
  pushd ~/development/build
  if [ "$1" = "rebuild" ]; then
    shift
    rm -f ~/development/build/CMakeCache.txt
    ~/development/build/config.sh
  fi
  nice ninja "$@" -j4
  popd
}
git_up() {
  pushd ~/development/build/llvm-project
  BR=$(git symbolic-ref --short -q HEAD)
  git checkout master
  git pull --rebase
  git checkout "$BR"
  git rebase master
  popd

#  pushd ~/development/build/llvm/projects/compiler-rt
#  git pull --rebase
#  popd
#  pushd ~/development/build/llvm/projects/openmp
#  git pull --rebase
#  popd
#  pushd ~/development/build/llvm
#  LLVM_BR=$(git symbolic-ref --short -q HEAD)
#  git fetch && (cd tools/clang && git fetch)  # Get matching revisions of both trees.
#  git checkout master
#  git svn rebase -l
#  git checkout "$LLVM_BR"
#  git svn rebase -l
#  (cd tools/clang &&
#   CLANG_BR=$(git symbolic-ref --short -q HEAD) &&
#   git checkout master &&
#   git svn rebase -l &&
#   git checkout "$CLANG_BR" &&
#   git svn rebase -l)
#  popd
}
lldbtool() { emacs -nw --eval "(lldb \"lldb -X --source ~/lldb-gud/lldb-gud.settings $*\")";}
llvmdifftidy() {
  pushd ~/development/build/llvm
  git diff -U0 master | ~/clang_tools/llvm/tools/clang/tools/extra/clang-tidy/tool/clang-tidy-diff.py -p 1 -clang-tidy-binary ~/clang_tools/bin/clang-tidy -fix
  popd
}
clangdifftidy() {
  pushd ~/development/build/llvm/tools/clang
  git diff -U0 master | ~/clang_tools/llvm/tools/clang/tools/extra/clang-tidy/tool/clang-tidy-diff.py -p 1 -clang-tidy-binary ~/clang_tools/bin/clang-tidy -fix
  popd
}
difftidy() {
  pushd /localhd/abataev/development/build_llvm/llvm-project
  git diff -U0 master | ~/clang_tools/llvm-project/clang-tools-extra/clang-tidy/tool/clang-tidy-diff.py -p 1 -clang-tidy-binary ~/clang_tools/bin/clang-tidy -fix
  popd
}

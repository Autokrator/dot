set -gx CLICOLOR 1
set -gx LSCOLORS "Gxfxcxdxbxchdhbhbhgexe"
set -gx LS_COLORS "di=1;36:ln=35:so=32:pi=33:ex=31:bd=32;47:cd=33;47:su=31;47:sg=31;47:tw=36;44:ow=0;44"

if status --is-login
  set -x PATH $PATH $HOME/.emacs.d/bin
end

# set -gx fish_prompt_pwd_dir_length -1


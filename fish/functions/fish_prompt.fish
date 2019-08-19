function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    if not set -q __fish_prompt_error_glyphes
      set -g __fish_prompt_error_glyphes "〇" "一" "二" "三" "四" "五" "六" "七" "八" "九" "十" 
      # set -g __fish_prompt_error_glyphes "0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "10"
    end

    if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (set_color yellow)(hostname|cut -d . -f 1)
    set fish_color_cwd brcyan
    end

    if not set -q __fish_prompt_mode_color
    set -g __fish_prompt_mode_color brblack
    end

    if [ $last_status -ne 0 ]
       set -g __fish_prompt_normal (set_color $__fish_prompt_mode_color)"┃"(set_color magenta) $__fish_prompt_error_glyphes[(math $last_status % 11 + 1)](set_color $__fish_prompt_mode_color) "." (set_color normal)
    else
       set -g __fish_prompt_normal (set_color $__fish_prompt_mode_color)"┃"(set_color magenta) "λ "(set_color $__fish_prompt_mode_color) "." (set_color normal)
    end

    if not set -q __git_cb
    set __git_cb (set_color yellow)"« "(set_color red)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color yellow)" » "(set_color normal)
    end

    switch $USER

    case root

    if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
            set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
    end

    printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    case '*'

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    # echo -ens "\n"
    if not set -q SSH_CLIENT
    printf '%s%s %s%s' "$__fish_prompt_cwd" (prompt_pwd) "$__git_cb" "$__fish_prompt_normal"
    else
    printf '%s %s%s %s%s' "$__fish_prompt_hostname" "$__fish_prompt_cwd" (prompt_pwd)  "$__git_cb" "$__fish_prompt_normal"
    end

    end
end

function __fish_prompt_newline_post --on-event fish_postexec
    printf "\n"
end

function __fish_prompt_newline_sig --on-signal int
    set -l cmd (commandline)
    if test -n "$cmd"
        printf "\n"
    end
end

function fish_right_prompt -d "Write out the right prompt"
  test -n "$VIRTUAL_ENV"; or return

	set -l venv (basename $VIRTUAL_ENV)
	set -l venv_generic_names virtualenv venv .venv
	if contains $venv $venc_generic_names
		set venv (basename (dirname $VIRTUAL_ENV))
	end

	printf '%s' (set_color brblack)$venv
end


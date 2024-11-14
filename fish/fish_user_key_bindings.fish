function fish_user_key_bindings
    for mode in insert default visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase

    # jj for normal mode
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"

    # ctrl-d for accepting autosuggestion
    bind -M insert \cd accept-autosuggestion

    # fzf key bindings - removed fzf_key_bindings call
    bind \ct '__fzf_find_file'
    bind \cr '__fzf_reverse_isearch'
    bind \ec '__fzf_cd'

    if bind -M insert >/dev/null 2>/dev/null
        bind -M insert \ct '__fzf_find_file'
        bind -M insert \cr '__fzf_reverse_isearch'
        bind -M insert \ec '__fzf_cd'
    end
end

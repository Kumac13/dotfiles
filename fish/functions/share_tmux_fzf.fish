function share_tmux_fzf
    # OSごとに `tac` または `tail -r` を選択
    if command -v tac > /dev/null
        set reverse_cmd "tac"
    else if command -v tail > /dev/null
        set reverse_cmd "tail -r"
    else
        set reverse_cmd "cat"
    end

    # `tmux capture-pane` の出力を逆順にして `fzf` に渡す（空白行を除外）
    tmux capture-pane -p -S -500 | grep -v '^\s*$' | $reverse_cmd | fzf --multi | $reverse_cmd | read -z selected

    if test -n "$selected"
        # `fzf` の出力順をそのまま保持しつつ、改行を維持
        if command -v pbcopy > /dev/null
            printf "%s\n" "$selected" | pbcopy
        else if command -v xclip > /dev/null
            printf "%s\n" "$selected" | xclip -selection clipboard
        else if command -v wl-copy > /dev/null
            printf "%s\n" "$selected" | wl-copy
        else
            echo "Warning: No clipboard utility found. Install pbcopy, xclip, or wl-copy."
        end
    end
end


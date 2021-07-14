function fish_user_key_bindings
		for mode in insert default visual
    	fish_default_key_bindings -M $mode
  	end
  	fish_vi_key_bindings --no-erase
    bind -M insert jj "if commandline -P; commandline -f cancel; else; set fish_bind_mode default; commandline -f backward-char force-repaint; end"
end

fzf_key_bindings

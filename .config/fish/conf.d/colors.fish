if not set -q colors_guard
	set -U colors_guard
	set -U __fish_git_prompt_color_branch yellow
	set -U fish_color_autosuggestion 555\x1ebrblack
	set -U fish_color_cancel \x2dr
	set -U fish_color_command 005fd7
	set -U fish_color_comment 990000
	set -U fish_color_cwd green
	set -U fish_color_cwd_root red
	set -U fish_color_end 009900
	set -U fish_color_error ff0000
	set -U fish_color_escape 00a6b2
	set -U fish_color_history_current \x2d\x2dbold
	set -U fish_color_host normal
	set -U fish_color_host_remote yellow
	set -U fish_color_match \x2d\x2dbackground\x3dbrblue
	set -U fish_color_normal normal
	set -U fish_color_operator 00a6b2
	set -U fish_color_param 00afff
	set -U fish_color_quote 999900
	set -U fish_color_redirection 00afff
	set -U fish_color_search_match bryellow\x1e\x2d\x2dbackground\x3dbrblack
	set -U fish_color_selection white\x1e\x2d\x2dbold\x1e\x2d\x2dbackground\x3dbrblack
	set -U fish_color_status red
	set -U fish_color_user brgreen
	set -U fish_color_valid_path \x2d\x2dunderline
	set -U fish_pager_color_completion \x1d
	set -U fish_pager_color_description B3A06D\x1eyellow
	set -U fish_pager_color_prefix white\x1e\x2d\x2dbold\x1e\x2d\x2dunderline
	set -U fish_pager_color_progress brwhite\x1e\x2d\x2dbackground\x3dcyan
	set -U fish_pager_color_selected_background \x2dr
end

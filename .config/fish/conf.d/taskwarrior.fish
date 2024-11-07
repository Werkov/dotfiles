alias t task

function trotate
	set id $argv[1]
	set mod $argv[2..-1]

	set blocked (task info $id | \
        awk '/This task is blocking/ {b=1;f=1;}
             /Entered/ {b=0}
             /\s*[0-9]/ {if(b) {if(f){print $5; f=0;} else print $1;}}' | \
        sed ':a;{N;s/\n/,/;ba}'	)

	set new_id (task dup $id | awk '/Created/ {print $3}' | tr -d .)
	echo "Rotated task $new_id"

	if test -n "$blocked"
		task $blocked mod dep:$new_id
	end

	task "$id" done
	if test -n "$mod"
		task "$new_id" mod $mod
	end
end

function treview
	# Inspired by https://taskwarrior.org/docs/review.html
	set toreview $argv[1]
	for uuid in (task _reviewed | head -n $toreview)
		task info $uuid
		read -P "Mod task: " mod && task $uuid mod review:now

		if test "x$mod" = "xdel"
			task $uuid del
		else if test "x$mod" = "xD" -o "x$mod" = "xdone"
			task $uuid "done"
		else
			task $uuid mod $mod
		end
		echo $uuid reviewed
	end
end

function twait
	set id $argv[1]
	set exp $argv[2]

	if string match -r "[0-9]+[a-z]+" "$exp"
		set exp "now+$exp"
	end

	task "$id" mod wait:$exp
end

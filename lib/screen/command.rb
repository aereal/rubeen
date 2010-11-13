module Screen::Command
	FUNCTIONAL_COMMANDS = %w(
	acladd addacl aclchg chacl acldel aclgrp aclumask umask activity 
	at attrcolor backtick bell_msg bind bindkey
	break blankerprg breaktype bufferfile caption charset chdir 
	defbreaktype defcharset defescape defflow defgr defhstatus defencoding
	deflog deflogin defmode defmonitor defnonblock defobuflimit defscrollback
	defshell defsilence defslowpaste defutf8 defwrap defwritelock defzombie
	detach digraph echo encoding escape eval exec
	flow focus gr hardcopy hardcopy_append hardcopydir hardstatus height
	help hstatus idle ignorecase ins_reg colon command copy_reg 
	log logfile login logtstamp maptimeout register screen scrollback select
	markkeys maxwin monitor msginwait msgwait multiuser nethack nonblock
	number obuflimit partial password paste pastefont 
	pow_detach_msg printcmd process readbuf readreg
	sessionname setenv setsid shell shelltitle silence silencewait sleep 
	source sorendition split startup_message stuff su term termcap termcapinfo
	time title unsetenv utf8 vbell vbell_msg vbellwait verbose wall width
	windowlist wrap writebuf writelock zmodem zombie
	allpartial altscreen autodetach autonuke bce c1 compacthist console copy
	crlf debug defc1 defautonuke defbce slowpaste
	)

	DECLARATIVE_COMMANDS = %w(
	blanker clear dinfo displays dumptermcap fit history info kill lastmsg 
	meta mapnotnext next only other pow_break pow_detach prev quit redisplay
	version suspend windows xoff xon lockscreen mapdefault license remove
	removebuf reset resize
	)

	FUNCTIONAL_COMMANDS.each do |cmd|
		define_method(cmd) {|*args|
			Screen.screen(
				:session => @session_name,
				:eval => [cmd, *args].join(' ')
			)
		}
	end

	DECLARATIVE_COMMANDS.each do |cmd|
		define_method(cmd) {
			Screen.screen(
				:session => @session_name,
				:eval => cmd
			)
		}
	end
end


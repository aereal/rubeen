module Screen
	OPTION = {
		:config => '-c %s',
		:detached => '-d -m',
		:escape => '-e %s',
		:scrollback => '-h %s',
		:ls => '-ls',
		:logging => '-L',
		:window => '-p %s',
		:resume => '-r',
		:shell => '-s %s',
		:session => '-S %s',
		:title => '-t %s',
		:utf8 => '-U',
		:version => '-v',
		:multi_attach => '-x %s',
		:eval => '-X "%s"',
	}

	require "screen/command"
	require "screen/window"
	require "screen/session"

	def screen(opts={})
		arg = ['screen']
		cmd = opts.delete(:command)
		arg << opts.map {|k, v|
			self::OPTION[k] % [v].join(' ')
		}
		arg << cmd
		system arg.join(' ')
	end
	module_function :screen
end

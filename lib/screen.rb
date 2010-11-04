module Screen
	OPTION = {
		:config => '-c %s',
		:escape => '-e %s%s',
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
		:eval => '-X %s',
	}

	autoload :Command, 'screen/command'
	autoload :Session, 'screen/session'
	autoload :Window,  'screen/window'

	def screen(opts={})
		Kernel.system('screen', *opts.map {|k, v| self::OPTION[k] % *[v] })
	end
	module_function :screen
end

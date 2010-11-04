class Screen::Session
	# save layouts.
	attr_reader :name

	def self.create(session_name, &block)
		_session = new(session_name)
		_session.instance_eval(&block)
	end

	def self.attach(session_name, &block)
		_session = new(session_name, false)
		# get windows info
	end

	def initialize(session_name, force_create=true)
		@name = session_name
		@windows = []
		Screen.screen(:session_name => @name) if force_create
	end

	def window(window_name=nil, &block)
		win = Screen::Window.new(self, :window_name => window_name)
		@windows << win
		win.instance_eval(&block)
	end
end


class Window
	def initialize(session, opt={})
		@session = session
		@option = {:force_create => true}.update(opt)
		Screen.screen(:session_name => @session.name) if @option[:force_create]
	end
end


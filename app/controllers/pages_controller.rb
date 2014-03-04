class PagesController < ApplicationController
	
	skip_before_action :login?

	def index
		
	end

  def help

  end
end

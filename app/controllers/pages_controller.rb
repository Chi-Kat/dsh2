class PagesController < ApplicationController

	def about
	end

	def admin
	end

	def teacher
	    @asset = Asset.new
	end

end
class PagesController < ApplicationController
	def index
		if user_signed_in?
			redirect_to '/home'
		end
	end
	
	def check
		@users = User.all
	end
	
	#user pages
	def home
		if !user_signed_in?
			redirect_to '/index'
		end
	end
	
	def profile
		@user = User.find(params[:id])
		@id = :id
	end
	
end

class UsersController < ApplicationController
	
before_filter :authenticate_user!

	def show
		@user = User.find(params[:id])
		
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit( :email, :password, :password_confirmation))
		redirect_to root_url
	end




end

class ProfilesController < ApplicationController
	respond_to :html, :json

	def index
		@profiles = Profile.all
	end

	def show
		@profile = Profile.find(params[:id])
		@post = Profile.find(params[:id]).microposts.new
	end

	def new
		@profile = Profile.new
	end

	def create
    	@profile = Profile.new(profile_params)
	    if @profile.save
	      redirect_to @profile
	    else
	      render new
    	end
	end

	def edit
		@profile = Profile.find(params[:id])
		unless current_user.profile.id == @profile.id
			redirect_to profile_path
		end
	end

	def update
		@profile = Profile.find(params[:id])
		@profile.update(profile_params)
    	redirect_to @profile
	end

	def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy
      redirect_to profiles_path
  	end

  	def post
  		@profile = Profile.find(params[:id])
  		@profile.microposts.create(post_params)
  		redirect_to @profile
  	end

  	# params(:microposts).permit(:content)
  	# params.permit(content: {:micropost => :content}

  	def show_micro
  		@posts = Profile.find(params[:id]).microposts
  		respond_with(@posts)
  	end

private
	
	def profile_params
		params.require(:profile).permit( :format, :first_name, :last_name, :contact_email, :content, :photo, :github_url, :linkedin_url, :bio)
	end

	def post_params
		params.require(:micropost).permit(:content)
	end
end
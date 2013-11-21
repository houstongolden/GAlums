class ProjectsController < ApplicationController
	respond_to :html, :json

	def index
		@projects = Project.all
		respond_with(@projects)
	end

	def show
		@project = Project.find(params[:id])
		@profile_list = Project.find(params[:id]).profiles
	end

	def new
		@project = Project.new
	end

	def create
    	@project = current_user.profile.projects.create(project_params)
	    if @project.save
	      redirect_to @project
	    else
	      render new
    	end
	end

	def edit
		@project = Project.find(params[:id])
	end

	def update
		@project = Project.find(params[:id])
		@project.update(project_params)
    	redirect_to @project
	end

	def destroy
      @project = Project.find(params[:id])
      @project.destroy
      redirect_to projects_path
  	end

  	def add_member
  		@project = Project.find(params[:id])
  		@project.profiles.push(current_user.profile)
  	end

private
	
	def project_params
		params.require(:project).permit(:proj_name, :proj_url, :proj_github)
	end
end

class IdeasController < ApplicationController
	before_action :signed_in?
	before_action :authenticate_user!, only: [:new, :create]
	before_action :is_owner?, only: [:edit, :update, :destroy]

	def index
		@ideas = Idea.order("created_at DESC").includes(:user).paginate(:page => params[:page], :per_page => 4)
		@idea = Idea.new
	end

	def create
		# @idea = Idea.create(idea_params)
		# if @idea.valid?
		# 	flash[:success] = "Your idea has been posted!"
		# else
		# flash[:alert] = "Woops! Looks like there has been an error!"
		# end
		# redirect_to root_path
		@idea = current_user.ideas.create(idea_params)
		if @idea.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@idea = Idea.find(params[:id])
	end

	def update
		@idea = Idea.find(params[:id])
		if @idea.update(idea_params)
			flash[:success] = "Your idea has been updated!"
			redirect_to root_path
		else
			flash[:alert] = "Woops! Looks like there has been an error!"
			redirect_to edit_idea_path(params[:id])
		end
	end

	def destroy
		@idea = Idea.find(params[:id])
		@idea.destroy
		flash[:success] = "The idea was successfully deleted!"
		redirect_to root_path
	end

	private
	def idea_params
		params.require(:idea).permit(:user_id, :description, :author)
	end
	
	def is_owner?
		redirect_to root_path if Post.find(params[:id]).user != current_user
	end
end

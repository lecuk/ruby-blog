class PostsController < ApplicationController
	
	# new posts display on top
	def index
		@posts = Post.all.reverse()
	end

	# create empty post to fill in form
	def new
		@post = Post.new
	end
	
	# return existing post to edit
	def edit
		@post = Post.find(params[:id])
	end

	# adding post from filled form to database
	def create 
		@post = Post.new(post_params)
		
		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
	   
		if @post.update(post_params)
		  	redirect_to @post
		else
		  	render 'edit'
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
	   
		@post.destroy
		redirect_to posts_path
	end

private
	def post_params
		return params.require(:post).permit(:title, :text)
	end
end

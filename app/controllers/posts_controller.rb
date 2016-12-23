class PostsController < ApplicationController
	before_action :find_post, only: [:edit, :update, :show, :delete]

	# Index action to render all posts
	def index
		@posts = Post.all.order(created_at: :desc)
	end

	# New action for creating post
	def new
		@post = current_user.posts.build
	end

	# Create action saves the post into databases
	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:notice] = "Successfully created post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error creating new post!"
			render :new
		end
	end

	# Edit action retrives the post and renders the edit page
	def edit
	end

	# Update action updates the post with the new info
	def update
		if @post.update_attributes(post_params)
			flash[:notice] = "Successfully updated post!"
			redirect_to post_path(@post)
		else
			flash[:alert] = "Error updating post!"
			reder :edit
		end
	end

	# Show action renders the individual post after retrieving the id
	def show
	end

	# The Destroy action removes the post permanently from the db
	def destroy
		Post.destroy(params[:id])
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end

	def find_post
		@post = Post.find(params[:id])
	end





end

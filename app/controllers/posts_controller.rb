class PostsController < ApplicationController
 before_action :authenticate_user!
	def index
		@posts = Post.where(user_id:current_user.id)

	end

	def new
		@post = Post.new

	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save!
			redirect_to @post
		else
			render 'new'
		end

	end


private
	def post_params

		params.require(:post).permit(:title,:body,:tag,:user_id)
	end

end

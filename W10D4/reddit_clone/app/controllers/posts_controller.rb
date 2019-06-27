class PostsController < ApplicationController
    
    before_action :require_logged_in!, only: [:new, :create, :edit, :update, :destroy]

    def new
        @post = Post.new
    end

    def create
        @post = current_user.posts.new(post_params)
        @subs ||= Sub.all #ask this shit

        if @post.save
            flash[:sucess] = "you did it bud"
            redirect_to post_url(@post)
        else
            flash[:error] = "try again"
            render :new
        end

        params[:post][:sub_id].each do |sub_id|
            PostSub.create!(post_id: @post.id, sub_id: sub_id)
        end
    end

    params { post: { sub_id: = [1] } }

    def show
        @post = Post.find(params[:id])
    end

    def edit
        if current_user.id == @post.author_id
            @post = Post.find(params[:id])
        end
    end

    def update
        @post = Post.find(params[:id])
        if current_user.id == @post.author_id
            if @post.update(post_params)
                flash[:success] = 'Good edits'
                redirect_to post_url(@post)
            else
                flash.now[:errors] = "Nice try"
                render :edit
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        if current_user.id == @post.author_id
            @post.destroy
            redirect_to post_url(@post)
        end
    end

    private

    def post_params
        params.require(:post).permit(:title,:url,:content)
    end

end

# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post
  
  def create
    @comments = @post.comments.create(comments_params)
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def comments_params
    params.require(:comments).permit(:content)
  end
end

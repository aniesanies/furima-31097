class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @user = @comment.user
      ActionCable.server.broadcast 'comment_channel', comment: [@comment, @user]
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

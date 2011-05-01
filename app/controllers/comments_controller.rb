class CommentsController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @comment = @request.comments.new(:text   => params[:comment][:text])

    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = 'Ваше предложение принято'
      redirect_to request_path(@request)
    else
      render 'requests/show'
    end
  end
end

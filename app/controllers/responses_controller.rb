class ResponsesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @response = @request.responses.new(:description => params[:response][:description],
                                      :price => params[:response][:price],
                                      :torg  => params[:response][:torg]) 

    @response.user_id = current_user.id
    if @response.save
      flash[:notice] = 'Ваше предложение принято'
      redirect_to request_path(@request)
    else
      render 'requests/show'
      
    end

  end

  def destroy
    @response = Response.find(params[:id])
    @request_id = @response.request_id
    if current_user?(@response.user ) || current_user.admin?
      @response.destroy
      flash[:success] = 'Предложение удалено'
      redirect_to request_path(@request_id)
    end
  end
end

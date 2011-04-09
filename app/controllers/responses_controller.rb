class ResponsesController < ApplicationController
  def create
    @request = Request.find(params[:request_id])
    @response = @request.responses.new(:description => params[:response][:description]) 
    # @response = current_user.responses.new(:description => params[:response][:description])
    @response.user_id = current_user
    if @response.save
      flash.now[:notice] = 'Ваше предложение принято'
      redirect_to request_path(@request)
    else
      
    end

  end

  def destroy

  end
end

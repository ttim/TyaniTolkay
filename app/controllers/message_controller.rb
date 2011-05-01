class MessageController < ApplicationController
  def create
    Message.create(params[:message]) if user_signed_in?
    redirect_to :back
  end
end

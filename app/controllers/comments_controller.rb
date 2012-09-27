class CommentsController < ApplicationController

  def create
    @villa = Villa.find(params[:villa_id])
    @comment = @villa.comments.create(params[:comment])
    redirect_to villa_path(@villa)
  end

  def destroy
    @villa = Villa.find(params[:villa_id])
    @comment = @villa.comments.find(params[:id])
    @comment.destroy
    redirect_to villa_path(@villa)
  end
end

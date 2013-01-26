class MessagesController < ApplicationController
  def new
    @message = Message.new
    @almunecar = Destination.find(2)
    @motril = Destination.find(3)
    @salobrena = Destination.find(4)
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      ContactMailer.contact_confirmation(@message).deliver
      ContactMailer.inquiry(@message).deliver
      redirect_to :back, notice: "Message sent! Thank you for contacting us."
    else
      format.html { render action: "new" }
      format.json { render json: @message.errors, status: :unprocessable_entity }
    end
  end
end
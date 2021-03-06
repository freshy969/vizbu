class FeedbacksController < ApplicationController

  def new
    @feedback = Feedback.new
  end
  
  def create
    # send email
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?
      FeedbackMailer.feedback_message(@feedback).deliver  
      flash[:notice] = "Message sent! Thank you for contacting us."
      #redirect_to root_url
    else
      render :action => 'new'
    end
  end

end

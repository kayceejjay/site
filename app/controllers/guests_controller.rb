class GuestsController < ApplicationController
  
  def new
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.valid?
      @guest.send_mail # Instance method in Guest model
      redirect_to infosent_path
    else
      render 'new'
    end
  end

  private
  
  def guest_params
      params.require(:guest).permit(:fname, :lname, :phone, :email, :interest)
  end
  
  def flash_notice
    flash[:notice] = "Your request has been sent! Thank you for contacting us."
  end
end
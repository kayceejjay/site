class NavpagesController < ApplicationController

  def favicon
    send_file 'public/favicon.ico', type: 'image/x-icon', disposition: 'inline'
  end
  
  def index
  end

  def history
  end
  
  def contact
  end
  
  def design
  end
  
  def develop
  end

  def news
  end
  
  def services
  end
  

  private

  # def guest_params
  #   params.require(:guest).permit(:fname, :lname, :phone, :email, :interest)
  # end
  
end

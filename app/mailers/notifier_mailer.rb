class NotifierMailer < ApplicationMailer
    default from: 'noreply@techhandie.com'
    
    def guest_info(guest)
      @guest = guest
      mail(to: 'admin@techhandie.com', subject: "Website Visitors Request for Information")
    end
    
end
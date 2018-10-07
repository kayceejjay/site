class ApplicationMailer < ActionMailer::Base
  default = {from: 'noreply@techhandie.com', to: 'admin@techhandie.com', subject: "Website Visitors Request for Information"}
  layout 'mailer'
end

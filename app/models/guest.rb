class Guest
  include ActiveModel::Model
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::Validations
  
  attr_accessor :fname, :lname, :phone, :email, :interest

  # Validations & Requirements
  
  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  validates :phone, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :interest, presence: true
  
  def initialize(fname, lname, phone, email, interest)
       @fname = fname
       @lname = lname
       @phone = phone
       @email = email
       @interest = interest

       post_initialize
  end
  
      # #make in lieu of #create
  def self.make(fname, lname, phone, email, interest)
       attributes = {fname: fname, lname: lname, phone: phone, email: email, interest: interest}
       object = new(attributes)
       object.save
       @visitor = object
       @visitor
  end

  def persisted?
      false
  end
  
  def send_mail
    # Following method defined in NotifierMailer
    NotifierMailer.guest_info(self).deliver_now
  end

  private

  def post_initialize
    if email
      email.downcase
    end
  end

  def downcase_email
    self.email = email.downcase
  end
end
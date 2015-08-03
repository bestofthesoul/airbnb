class Bookeduser < ActiveRecord::Base
  
  has_many :books
  has_many :bookedproperties, through: :books
  

  validates :email, presence: true, uniqueness: true
  # validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates :email, format: {with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)}
  validates :email, :format => { :with => /[a-z]*@[a-z]*.[a-z]{2,}/, :message => "error"}
  
  validates :password, presence: true


  def check_password(password)
    if self.password == password
      true
    else
      false
    end
  end

end


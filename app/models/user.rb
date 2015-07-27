class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_messageable
  
  def name
  	return company_name
  end
  
  def mailboxer_email(object)
  	return nil
  end
  
  def self.search(query)
    where("company_name like ?", "%#{query}%") 
  end
end

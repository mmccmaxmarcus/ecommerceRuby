class Admin < ApplicationRecord
  #constantes para enumeração
   ROLES = {:full_access => 0, :restrict_access => 1}
 
  #Enums
   enum role: ROLES
   
  #scopes
  scope :with_full_access, ->{ where(role: ROLES[:full_access]) }
  scope :with_restrict_access, ->{ where(role: ROLES[:restrict_access]) }
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   
end

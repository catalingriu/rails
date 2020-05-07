class Loan < ApplicationRecord  
  belongs_to :game
  belongs_to :user

  TILL_RETRIEVE = 10.minutes
  TILL_NOTIFICATION = 5.minutes

end

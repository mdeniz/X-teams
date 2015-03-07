class Membership < ActiveRecord::Base

  belongs_to :mutant
  belongs_to :team

end

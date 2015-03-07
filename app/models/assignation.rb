class Assignation < ActiveRecord::Base

  belongs_to :mutant
  belongs_to :task

end

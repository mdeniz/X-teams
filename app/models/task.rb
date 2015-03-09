class Task < ActiveRecord::Base

  has_many :assignations, dependent: :delete_all
  has_many :mutants, through: :assignations

  belongs_to :team

  def color
    case self.priority
      when 0..20 then '-success'
      when 21..40 then ''
      when 41..60 then '-info'
      when 61..80 then '-warning'
      else
        '-danger'
    end
  end

  def priority_text
    case self.priority
      when 0..20 then 'lowest'
      when 21..40 then 'low'
      when 41..60 then 'medium'
      when 61..80 then 'high'
      else
        'highest'
    end
  end
  
end

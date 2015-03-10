class Team < ActiveRecord::Base

  has_many :tasks, dependent: :delete_all

  has_many :membership, dependent: :delete_all
  has_many :mutants, through: :membership


  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def image_in_asset
    self.image.nil? ? nil : 'profiles/teams/' + self.image.to_s
  end

  def unlink_from_mutant(mutant_id)
    ActiveRecord::Base.transaction do
      self.tasks.each do |task|
        assignation = task.assignations.find_by_mutant_id(mutant_id)
        assignation.destroy if assignation
      end
      membership = self.membership.find_by_mutant_id(mutant_id)
      membership.destroy if membership
    end
  end

  def powers
    the_powers = self.mutants.map do |mutant|
      mutant.powers
    end
    the_powers.flatten.uniq
  end

end

class Team < ActiveRecord::Base

  has_many :tasks

  has_many :membership
  has_many :mutants, through: :membership


  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def image_in_asset
    self.image.nil? ? nil : 'profiles/teams/' + self.image.to_s
  end

  def powers
    the_powers = self.mutants.map do |mutant|
      mutant.powers
    end
    the_powers.flatten.uniq
  end

end

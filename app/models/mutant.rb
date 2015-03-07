class Mutant < ActiveRecord::Base

  has_many :assignations
  has_many :tasks, -> { order priority: :desc }, through: :assignations

  has_many :membership
  has_many :teams, through: :membership

  acts_as_taggable
  alias_method :powers, :tag_list
  alias_method 'powers=', 'tag_list='

  def image_in_asset
    self.image.nil? ? nil : 'profiles/mutants/' + self.image.to_s
  end

  def is_professor_xavier
    self.id == 1
  end

  class << self
    alias_method :with_power, :tagged_with
  end

end

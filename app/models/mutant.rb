class Mutant < ActiveRecord::Base

  acts_as_taggable

  alias_method :powers, :tag_list

  def as_profile
    data = self.attributes
    data['class'] = 'mutant'
    data['image'] = data['image'].nil? ? nil : 'profiles/' + data['image'].to_s
    data['powers'] = self.powers
    data
  end

  class << self
    alias_method :with_power, :tagged_with
  end

end

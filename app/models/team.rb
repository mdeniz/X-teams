class Team < ActiveRecord::Base

  validates :name, presence: true, uniqueness: {case_sensitive: false}

  acts_as_taggable

  alias_method :powers, :tag_list
  alias_method 'powers=', 'tag_list='

  def as_profile
    data = self.attributes
    data['class'] = 'user'
    data['image'] = 'profiles/xavier.jpg'
    data['real_name'] = data['name']
    data['name'] = 'Professor X'
    data['aliases'] = 'Doctor X, Professor Xavier, formerly Prisoner M-13'
    data['place_of_birth'] = 'New York City, New York'
    data['identity'] = 'Publicly known'
    data['mobile'] = '+XX XXX.XXX.XXX'
    data['height'] = 182
    data['weight'] = 86
    data['eyes'] = 'Blue'
    data['hair'] = 'Bald (blond during childhood)'
    data['skintone'] = 'White'
    data['powers'] = [
        'Telepathy',
        'Read Minds',
    ]
    data['biography'] = ''
    data
  end

    class << self
      alias_method :with_power, :tagged_with
    end
end

class User < ActiveRecord::Base
  has_secure_password

  before_save { self.email = email.downcase }

  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
      format: { with: VALID_EMAIL_REGEX },
      uniqueness: { case_sensitive: false }

  validates :password, length: { minimum: 6 }

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
        'Project his own thoughts',
        'Manipulate Minds',
        'Induce mental/physical paralysis',
        'Induce lost of memory',
        'Induce total amnesia'
    ]
    data['biography'] = %s{Charles Francis Xavier was born the son of nuclear researcher Brian Xavier and his wife, Sharon. Following her husband's accidental death, Sharon married Brian's colleague, Kurt Marko. Cain, Kurt's son by a previous marriage, came to live at the Xavier’s Westchester mansion shortly thereafter. A cruel and spiteful boy, he bullied his new stepbrother. As punishment, his father secretly beat him - and young Charles felt his sibling's pain firsthand thanks to the emergence of his mutant telepathic powers. Following their mother’s death, a fire in the family home took Kurt’s life, leaving the stepbrothers alone.
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                <br/><br/>
      By the time he graduated high school, Charles was completely bald as a side effect of his mutant nature. He entered Bard College in New York at age 16 and earned his bachelor's degree in biology within two years. He was then accepted into the graduate-studies program at England's prestigious Oxford University, where he earned degrees in genetics and biophysics. There, Charles met and fell in love with a young Scotswoman named Moira Kinross. Their passionate discussions on the subject of genetic mutation gave way to romance, and they planned to marry. Their only obstacle was Moira's former boyfriend, Joe MacTaggert, a lance corporal in the Royal Marines and a bully, just like Cain. In Joe's eyes, Charles was a good-for-nothing intellectual, so Charles enlisted in the military after completing his studies at Oxford to validate himself in terms his rival would understand.
      }
    data['more_info_link'] = "http://marvel.com/universe/Professor_X"
    data
  end
end

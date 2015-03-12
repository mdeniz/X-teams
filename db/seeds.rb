# Creating the Professor X user
User.create(
    name: 'Charles Francis Xavier',
    email: 'xavier@xmen.com',
    password: 'professor',
    password_confirmation: 'professor'
)

# Creating some Teams
teamXMen = Team.create(
    name: 'X-Men',
    image: 'xmen.jpg',
    email: 'info@xmen.com',
    description: "Under a cloud of increasing anti-mutant sentiment, Professor Xavier created a safe haven at his Westchester mansion where he could train young mutants to use their powers for the betterment of mankind. Aided by F.B.I. agent Fred Duncan, Xavier spent months recruiting his early students (code-named Cyclops, Iceman, Angel, Beast and Marvel Girl), dubbing them \"X-Men\" because each possessed an \"extra\" ability normal humans lacked. The X-Men made their public debut by thwarting Magneto's seizure of the Cape Citadel missile base. The U.S. military was grateful, and the youngsters were initially regarded as heroes. Magneto would battle the X-Men repeatedly over the years, sometimes leading his Brotherhood of Evil Mutants. The X-Men also battled such threats as the immovable Blob, the untouchable Unus, the alien Lucifer, the savage Swamp Men, the enigmatic Stranger, the unstoppable Juggernaut, and the giant mutant-hunting Sentinel robots.<br><br>
The arrogant mutated human Mimic briefly joined the team before Xavier secretly went into hiding. Requiring seclusion to prepare for a forthcoming invasion of Earth by the alien Z'Nox, Xavier had the shape-shifting mutant Changeling impersonate him in order to supervise the X-Men in his absence; however, the Changeling \"Xavier\" died heroically in battle against the subterranean Grotesk. Of the X-Men, only Marvel Girl knew that Xavier was still alive, though she was sworn to secrecy. Duncan had the X-Men disband briefly, but the team had regrouped by the time Xavier finally came out of hiding, leading them in repelling the Z'Nox with the aid of the Fantastic Four. Joined by Polaris and Havok, the heroes befriended Avia of the Savage Land's Nhu'Gari race, and fought the likes of African mutant Deluge (alongside young future member Storm), the mutant slave-runner Krueger, the criminal Dazzler (Angel's uncle, Burt Worthington), the telepathic alliance known as the Promise, the Inhuman Yeti, and the Secret Empire."
)

teamAvengers = Team.create(
    name: 'Avengers',
    image: 'avengers.jpg',
    email: 'info@avengers.com',
    description: "They are Earth's mightiest heroes, formed to fight the foes no single hero could withstand. The Avengers are the most prestigious and powerful super-hero team in the world, an ever-shifting assemblage of super-beings, adventurers and crime fighters devoted to protecting the planet from menaces beyond the scope of conventional authorities.<br><br>
The group began with the random teaming of Thor, Iron Man, Ant-Man, Wasp and Hulk, who joined forces to thwart the Asgardian menace Loki in response to a call for help from Hulk's teen sidekick, Rick Jones. Pym suggested the heroes remain together as a team, and his partner Wasp suggested they call themselves \"something colorful and dramatic, like...the Avengers.\" The name stuck, and a legend was born."
)

# Creating some Mutants
professorX = Mutant.create(
    name: "Professor X",
    aliases: 'Doctor X, Professor Xavier, formerly Prisoner M-13',
    real_name: "Charles Francis Xavier",
    image: 'xavier.jpg',
    email: 'xavier@xmen.com',
    mobile: '+34 XXX.XXX.XXX',
    place_of_birth: "New York City, New York",
    identity: 'Publicly knowns',
    biography: "Charles Francis Xavier was born the son of nuclear researcher Brian Xavier and his wife, Sharon. Following her husband's accidental death, Sharon married Brian's colleague, Kurt Marko. Cain, Kurt's son by a previous marriage, came to live at the Xavier’s Westchester mansion shortly thereafter. A cruel and spiteful boy, he bullied his new stepbrother. As punishment, his father secretly beat him - and young Charles felt his sibling's pain firsthand thanks to the emergence of his mutant telepathic powers. Following their mother’s death, a fire in the family home took Kurt’s life, leaving the stepbrothers alone.<br/><br/>
      By the time he graduated high school, Charles was completely bald as a side effect of his mutant nature. He entered Bard College in New York at age 16 and earned his bachelor's degree in biology within two years. He was then accepted into the graduate-studies program at England's prestigious Oxford University, where he earned degrees in genetics and biophysics. There, Charles met and fell in love with a young Scotswoman named Moira Kinross. Their passionate discussions on the subject of genetic mutation gave way to romance, and they planned to marry. Their only obstacle was Moira's former boyfriend, Joe MacTaggert, a lance corporal in the Royal Marines and a bully, just like Cain. In Joe's eyes, Charles was a good-for-nothing intellectual, so Charles enlisted in the military after completing his studies at Oxford to validate himself in terms his rival would understand.",
    height: 182,
    weight: 86,
    eyes: "Blue",
    hair: "Bald (blond during childhood)",
    skintone: "White",
    more_info_link: 'http://marvel.com/universe/Professor_X',
    powers: [
        'Telepathy',
        'Read Minds',
        'Project his own thoughts',
        'Manipulate Minds',
        'Induce mental/physical paralysis',
        'Induce lost of memory',
        'Induce total amnesia'
    ]
)

wolwerine = Mutant.create(
    name: "Wolwerine",
    aliases: "Logan, formerly Weapon Ten, Death, Mutate #9601, Jim Logan, Patch, Canucklehead, Emilio Garra, Weapon Chi, Weapon X, Experiment X, Agent Ten, Canada, Wildboy, Peter Richards, many others",
    real_name: "James Howlett",
    image: 'wolwerine.jpg',
    email: 'wolwerine@xmen.com',
    mobile: '+34 658.587.294',
    place_of_birth: "Cold Lake, Alberta, Canada",
    identity: 'Secret, known to certain government agencies',
    biography: "Born the second son of wealthy landowners John and Elizabeth Howlett in Alberta, Canada during the late 19th Century, James Howlett was a frail boy of poor health. James was largely neglected by his mother, who was institutionalized for a time following the death of her first son, John Jr., in 1897. He spent most of his early years on the estate grounds and had two playmates that lived on the Howlett estate with him: Rose, a red-headed girl who was brought in from town to be a companion to young James, and a boy nicknamed \"Dog\" who was the son of the groundskeeper, Thomas Logan. Thomas Logan was an alcoholic and was extremely abusive to his son. The children were close friends but as they reached young adulthood, the abuse inflicted upon Dog warped his mind. His actions would lead to a tragic chain of events. that started as the three neared their adolescent years when Dog made unwanted advances toward Rose and James reported it to his father. In retaliation Dog killed James's pet dog. This in turn resulted in the expulsion of Thomas Logan and Dog Logan from the estate.
<br/><br/>Thomas Logan, in a drunken stupor, invaded the Howlett estate with his son and attempted to take Elizabeth Howlett (implied to be his former lover) with him. John attempted to stop him and Thomas Logan shot him down in cold blood. James Howlett had just entered the room when this occurred and for the first time his mutation manifested; his claws extended from the backs of his hands and he attacked the intruders with uncharacteristic ferocity, killing Thomas Logan, and scarring Dog's face with three claw marks. Elizabeth Howlett, who was already an emotionally disturbed woman, took her life immediately afterward with a blast from Thomas's gun. Fearing for their safety, Rose fled the estate with James, who appeared to have been deeply traumatized and had somehow repressed or forgotten most of the memories of life back at the estate. Dog falsely reported to the police and James's grandfather that Rose had murdered John Howlett II and Thomas Logan. The eldest Howlett, shunned James and with no family left, took Dog in as his ward. However, Dog was already a burgeoning psychopath and it was too late for his character to evolve down any other path.",
    height: 160,
    weight: 136,
    eyes: "Blue",
    hair: "Black",
    skintone: "White",
    more_info_link: 'http://marvel.com/universe/Wolverine_(James_Howlett)',
    powers: [
    'Adamantium skeleton',
    'Retractable one-foot long bone claws',
    'Superhumanly acute senses',
    'Immunity to poisons',
    'Enhanced resistance to diseases'
    ]
)

cyclops = Mutant.create(
    name: "Cyclops",
    aliases: "\"Slim\"; formerly Slym Dayspring, Mutate #007, Erik the Red",
    real_name: "Scott Summers",
    image: 'cyclops.jpg',
    email: 'cyclops@xmen.com',
    mobile: '+34 618.347.211',
    place_of_birth: "Anchorage, Alaska",
    identity: 'Publicly known',
    biography: "Scott Summers was the first of two sons born to Major Christopher Summers, a test pilot for the U.S. Air Force, and his wife Katherine. Christopher was flying his family home from vacation when their plane was attacked by a spacecraft from the interstellar Shi'ar Empire. To save their lives, Katherine pushed Scott and his brother Alex out of the plane with the only available parachute. Scott suffered a head injury upon landing, thus forever preventing him from controlling his mutant power by himself.<br/><br/>With their parents presumed dead, the authorities separated the two boys. Alex was adopted, but Scott remained comatose in a hospital for a year. On recovering, he was placed in an orphanage in Omaha, Nebraska that was secretly controlled by his future enemy, the evil geneticist Mister Sinister.
<br/><br/>As a teenager, Scott came into the foster care of Jack Winters, a mutant criminal known as the Jack O'Diamonds. After Scott began to suffer from severe headaches he was sent to a specialist who discovered that lenses made of ruby quartz corrected the problem. Soon after, Scott's mutant power first erupted from his eyes as an uncontrollable blast of optic force. The blast demolished a crane, causing it to drop its payload toward a terrified crowd. Scott saved lives by obliterating the object with another blast, but the bystanders believed that he had tried to kill them and rallied into an angry mob. Scott fled, escaping on a freight train.",
    height: 190,
    weight: 88.5,
    eyes: "Brown, glowing red when using powers",
    hair: "Brown",
    skintone: "White",
    more_info_link: 'http://marvel.com/universe/Cyclops_(Scott_Summers)',
    powers: [
    'Project a beam of heatless ruby-colored concussive force',
    'Body constantly absorbs ambient energy'
    ]
)


storm = Mutant.create(
    name: "Storm",
    aliases: "\"Beauty\", Wind-Rider, \"Stormy\", Mutate #20, White King, \"Goddess of the Plains\", 'Ro",
    real_name: "Ororo Munroe",
    image: 'storm.jpg',
    email: 'storm@xmen.com',
    mobile: '+34 818.317.711',
    place_of_birth: "New York City, New York",
    identity: 'Publicly known',
    biography: "Ororo Monroe is the descendant of an ancient line of African priestesses, all of whom have white hair, blue eyes, and the potential to wield magic. Her mother, N'dare, was an African princess who married American photojournalist David Monroe and moved with him to Manhattan, where Ororo was born. When Ororo was six months old, she and her parents moved to Cairo, Egypt. Five years later, during the Arab-Israeli conflict, a plane crashed into their home. Ororo's parents were killed, but she survived, buried under rubble near her mother's body. The resultant trauma left Ororo with severe claustrophobia that still affects her today.<br/><br/>
Ororo managed to escape the rubble of her shattered home with nothing but the tattered clothes on her back and her mother's ancestral ruby. Homeless and orphaned, Ororo was found by a gang of street urchins who took her to their master, Achmed el-Gibar. Achmed trained Ororo in the arts of thievery and she soon became his prize pupil, excelling in picking both pockets and locks. During her time in Cairo, Ororo picked the pocket of an American tourist. The man proved no easy mark, however, as he was Charles Xavier, a powerful mutant telepath who used his abilities to stop the theft. At that moment, Xavier was psionically attacked by another mutant and Ororo used the opportunity to escape.",
    height: 180,
    weight: 57.6,
    eyes: "Blue, glowing white when using powers",
    hair: "White",
    skintone: "Brown",
    more_info_link: 'http://marvel.com/universe/Storm',
    powers: [
      'Manipulate weather',
      'Direct bolts of lightning',
      'Fly',
      'Perceive electrical energy patterns'
    ]
)



captainAmerica = Mutant.create(
    name: "Captain America",
    aliases: "Nomad, The Captain, Steven Grant Rogers, Roger Stevens, Yeoman America, Cap, The Sentinel of Liberty, Star-Spangled Avenger; also has impersonated Crossbones",
    real_name: "Steven \"Steve\" Rogers",
    image: 'captain_america.jpg',
    email: 'cap@avengers.com',
    mobile: '+34 555.617.791',
    place_of_birth: "New York City, New York",
    identity: 'Publicly known',
    biography: "Steve Rogers was a scrawny fine arts student growing up during the Great Depression. His alcoholic father died when Steve was a child, and his mother passed away from pneumonia after he graduated high school. In early 1940, appalled at Nazi Germany’s horrific atrocities, Steve attempted to enlist in the army. Failing to pass physical requirements, he was invited to volunteer for Operation: Rebirth, a project intended to enhance US soldiers to the height of physical perfection via the inventions and discoveries of Professor Abraham Erskine. Rogers eagerly accepted and became the first test subject. After injections and ingestion of the \"Super Soldier Serum,\" Rogers was exposed to a controlled burst of \"Vita-Rays\" that activated and stabilized the chemicals in his system. The process successfully altered his physiology from its frail state to the maximum of human efficiency, including greatly enhanced musculature and reflexes. Soon after, Professor Erskine was assassinated by a Nazi operative, leaving Steve the sole beneficiary of Erskine’s genius. Renamed “Project: Rebirth,” variations of the Super-Soldier serum were subsequently tested, under inhuman conditions, on African-American soldiers. The most successful of these was Isaiah Bradley, and Project: Rebirth’s resources were eventually absorbed into a multinational superhuman research project dubbed Weapon Plus.",
    height: 188,
    weight: 99.7,
    eyes: "Blue",
    hair: "Blond",
    skintone: "Pale",
    more_info_link: 'http://marvel.com/universe/Captain_America_(Steve_Rogers)',
    powers: [
    'Very high intelligence',
    'Very high agility',
    'Very high strength',
    'Very high endurance',
    'Very high speed',
    'Reaction time superior to any Olympic athlete'
  ]
)



hulk = Mutant.create(
    name: "Hulk",
    aliases: "Annihilator, Captain Universe, Joe Fixit, Mr. Fixit, Mechano, Professor, War, Bruce Bancroft, David Banner, David Bixby, Bob Danner, Bruce Jones, Bruce Roberts, David Blaine, the Green Scar, Green Goliath, Jade Giant, Bob, World-breaker, Sakaarson",
    real_name: "Robert Bruce Banner",
    image: 'hulk.jpg',
    email: 'hulk@avengers.com',
    mobile: '+34 777.161.399',
    place_of_birth: "Dayton, Ohio",
    identity: 'Publicly known',
    biography: "Robert Bruce Banner was the son of an alcoholic who deeply hated him. Banner's mother showed much affection for her child, who returned her love, but this only served to fuel his father's rage. Dr. Brian Banner was an atomic physicist who worked on producing clean nuclear power as an energy source, but he was afraid his exposure to it mutated his son's genes. Bruce showed signs of high intelligence at an early age which strengthened his father's belief. Brian became abusive to Bruce and when his mother intervened, Brian murdered her. He frightened Bruce to keep quiet, but his own bragging landed him in a psychiatric institute.<br/<br/>
As a child Bruce was withdrawn, possibly developing a split personality to help deal with his pain and rage. His only happiness came from spending time with his cousin Jennifer Walters. Bruce found it hard to develop friendships and often found himself on the receiving end of physical abuse at the hands of school bullies. One such incident sparked him to build and plant a bomb in the basement of his school. The bomb was a dud, and Bruce was expelled, but the military took notice of his genius. Eventually, Bruce earned a doctorate in nuclear physics and started a career with them.",
    height: 243,
    weight: 635,
    eyes: "Green",
    hair: "Green",
    skintone: "Green",
    more_info_link: 'http://marvel.com/universe/Hulk_(Bruce_Banner)',
    powers: [
     'Superhuman strengh',
    'Great leaps',
    'Run superspeed',
    'Shockwave',
    'High resistance to physical damage',
    'Superhuman endurance',
    'Breathe underwater'
]
)

thor = Mutant.create(
    name: "Thor",
    aliases: "Donald M. Blake, God of Thunder, Son of Odin, the Thunderer, Lord of Asgard, Jake Olson, Sigurd Jarlson, Donar, Donner, Hloriddi, Unhappy Hrungnir’s Playmate, Veur, Hrodr’s Foe-Man, Longbeard’s Son, Vingthor the Hurler, Siegfried, Siegmund, \"Woe-King\"; impersonated Hercules, Harokin, Freya; formerly bound to Eric Masterson",
    real_name: "Thor Odinson",
    image: 'thor.jpg',
    email: 'thor@avengers.com',
    mobile: '+34 000.111.999',
    place_of_birth: "A cave in Norway",
    identity: '(As Donald Blake) secret',
    biography: "Thor is one of several powerful ancient beings who dwell in a magical realm called Asgard. Through history, these beings have been revered and worshiped as gods. Ages ago, Odin, lord of the Asgardian gods, desired a child who would one day exceed him in power. Odin wooed Gaea, the earth goddess, and from their union Thor was born in a small cave in Norway on Earth. Odin took him to be raised in Asgard by his wife, Frigga.<br/><br/>
The young Thor grew up alongside his adopted brother Loki, the trickster, who was always jealous of his more favored sibling. Thor grew in power and popularity and on his eighth birthday, Odin had the hammer Mjolnir created for him, enchanting it with powerful magic. Odin decreed that Mjolnir would be presented to Thor when his son had been proven a worthy warrior. After spending the next eight years training and performing heroic deeds, Thor was given the hammer and declared the greatest warrior in Asgard.",
    height: 198,
    weight: 290.3,
    eyes: "Blue",
    hair: "Blond",
    skintone: "Pale",
    more_info_link: 'http://marvel.com/universe/Thor_(Thor_Odinson)',
    powers: [
    'Physical powers superior to those of normal Asgardian gods',
    'Berserker rage',
    'Mjolnir: a virtually unbreakable hammer',
    'Extended lifespan',
    'Fly',
    'Direct bolt lightnings'
]
)
teamXMen.mutants << [professorX, wolwerine, cyclops, storm]
teamAvengers.mutants << [captainAmerica, thor, hulk]

# Create some Tasks
tasksXmen = []
tasksXmen << Task.create(
    name: "World Peace",
    description: "calm the masses",
    start: nil,
    end: nil,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

tasksXmen << Task.create(
    name: "Clean spaceship",
    description: "Wash floor, walls and everything",
    start: rand(0..120).days.ago,
    end: nil,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

tasksXmen << Task.create(
    name: "Cook dinner",
    description: "Hamburguers for all",
    start: nil,
    end: rand(0..20).days.since,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

tasksXmen << Task.create(
    name: "Call mom",
    description: "Tell how it's going",
    start: rand(0..20).days.ago,
    end: rand(0..120).days.since,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

tasksXmen << Task.create(
    name: "Supermarket",
    description: "Eggs, meat, potatoes and beans",
    start: nil,
    end: nil,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

teamXMen.tasks << tasksXmen

# Mutants Tasks
professorX.tasks << tasksXmen
wolwerine.tasks << [tasksXmen[4], tasksXmen[0]]
cyclops.tasks << [tasksXmen[0], tasksXmen[2], tasksXmen[3]]
storm.tasks <<  [tasksXmen[1], tasksXmen[3], tasksXmen[4]]



taskAvengers = []
taskAvengers << Task.create(
    name: "Run a Race",
    description: "High speed needed",
    start: rand(0..20).days.ago,
    end: nil,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

taskAvengers << Task.create(
    name: "Biggest Leap Contest",
    description: "Bounce to the moon!",
    start: rand(0..20).days.ago,
    end: rand(0..20).days.since,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

taskAvengers << Task.create(
    name: "Cook dinner",
    description: "A ton of hamburguers",
    start: nil,
    end: rand(0..20).days.since,
    achieved: rand(0..20) * 5,
    priority: rand(0..100)
)

teamAvengers.tasks << taskAvengers

captainAmerica.tasks << taskAvengers
thor.tasks << [taskAvengers[1], taskAvengers[2]]
hulk.tasks << [taskAvengers[1], taskAvengers[0]]
# Creating the Professor X user
User.create(
    name: 'Charles Francis Xavier',
    email: 'xavier@xmen.com',
    password: 'professor',
    password_confirmation: 'professor'
)

# Creating some Teams


# Creating some Mutants
Mutant.create(
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
Mutant.create(
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

Mutant.create(
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
    more_info_link: 'http://marvel.com/universe/Cyclops_(Scott_Summers)'
)
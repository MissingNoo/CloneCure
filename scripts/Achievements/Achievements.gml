if (!variable_global_exists("gamedata")) {
	GameData = {};
}
#macro AchievementsList GameData.ach
AchievementsList = {};
function achievement(_name, _sprite) constructor {
	name = _name;
	sprite = _sprite;
	amount = 0;
	unlock_type = "money";
	unlock_name = "";
	unlocked = false;
	char = noone;
	static unlock = function () {
		switch (unlock_type) {
			case "money":
				SaveData.money += amount;
				break;
			case "weapon":
				Weapons[$ unlock_name].unlocked = true;
				break;
			case "item":
				Items[$ unlock_name].unlocked = true;
				break;
		}
		return self;
	}
	
	static set_item = function (_name) {
		_name = string_replace(_name, " ", "_");
		unlock_type = "item";
		unlock_name = _name;
		show_message("test");
		return self;
	}
	
	static set_weapon = function (_name) {
		_name = string_replace(_name, " ", "_");
		unlock_type = "weapon";
		unlock_name = _name;
		return self;
	}
	
	static set_money = function (amnt) {
		unlock_type = "money";
		amount = amnt;
		return self;
	}
	
	static set_character = function (charname) {
		char = charname;
		return self;
	}
	
	_name = string_lettersdigits(string_lower(string_replace_all(_name, " ", "_")));
	AchievementsList[$_name] = self;
}

new achievement("First Win!", sAchFirstWin).set_money(500);
new achievement("Fubura is coming", sAchFubura).set_weapon("Fan Beam");
new achievement("BBBBRRRRRRRREEEEEE", sAchFirstBoss).set_item("Gorilla_Paw");
new achievement("Tears of Happiness...?", sAchTears).set_weapon("CEO_Tears");
new achievement("You have been Cursed", sAchCursed).set_money("EN_Curse");
new achievement("Area 15", sBlank).set_weapon("Sausage");
new achievement("I am... Peko!", sBlank).set_weapon("Owl Dagger");
new achievement("Thousand Mile Stare", sBlank).set_money(10000);
new achievement("Thank the Managers", sBlank).set_money(10000);
new achievement("All Outta Candy", sBlank).set_money(10000);
new achievement("Dah Lah", sBlank).set_money(10000);
new achievement("Speed Runner", sBlank).set_money(2000);
new achievement("Idol Group", sBlank).set_money(10000);
new achievement("Special Attack", sBlank).set_item("Idol Costume");
new achievement("Hai...", sBlank).set_money(100);
new achievement("Time To Upgrade", sBlank).set_item("Credit Card");
new achievement("Boing", sBlank).set_weapon("Bounce Ball");
new achievement("It's Safe I Swear", sBlank).set_weapon("Injection Type Asacoco");
new achievement("It's Super Chat Time", sBlank).set_item("Super Chatto Time");
new achievement("The Real Grind", sBlank).set_money(10000);
new achievement("Wamy.", sBlank).set_weapon("Wamy Water");
new achievement("Decked Out", sBlank).set_item("Study Glasses");
new achievement("Glasses are Versatile", sBlank).set_money(2000);
new achievement("Delusional", sBlank).set_item("Halu");
new achievement("Went Too Halu", sBlank).set_item("GWS Pill");
new achievement("Hamburger Country Yeah!", sBlank).set_money(500);
new achievement("Thousand Milestone!", sBlank).set_item("Devil Hat");
new achievement("Over Nine Thousand?!", sBlank).set_money(2000);
new achievement("Couch Potato", sBlank).set_money(10000);
new achievement("Flesh Wound", sBlank).set_item("Just Bandage");
new achievement("I don't need it", sBlank).set_money(1000);
new achievement("Buying Power", sBlank).set_item("Membership");
new achievement("You Can Pet The Dog", sBlank).set_money(200);
new achievement("Full Collab", sBlank).set_money(2000);
new achievement("Muscle!", sBlank).set_item("Breastplate");
new achievement("Please Don't Fail", sBlank).set_item("Blacksmith Gear");
new achievement("I'm CEO now", sBlank).set_money(2500);
new achievement("Payday", sBlank).set_item("Stolen Piggy Bank");
new achievement("Free Stickers", sBlank).set_money(500);
new achievement("Fired", sBlank).set_money(3000);
new achievement("Lucky Day", sBlank).set_money(500);
new achievement("Pain Peko", sBlank).set_money(1000);
new achievement("Hardcore Gamer", sBlank).set_money(1000);
new achievement("Pay To Win", sBlank).set_money(5000);
new achievement("Solo Beater", sBlank).set_money(10000);
new achievement("True RNG", sBlank).set_money(2000);
new achievement("Just RNG", sBlank).set_money(500);
new achievement("Hallucinated", sBlank).set_money(3000);
new achievement("I Did It.", sBlank).set_money(10000);
new achievement("Obliterated", sBlank).set_money(2000);
new achievement("Pacifist", sBlank).set_money(1000);
new achievement("Power Leveling", sBlank).set_money(2000);
new achievement("Fully Loaded", sBlank).set_money(10000);
new achievement("Thank You", sBlank).set_money(1000);
new achievement("Not taking any chances", sBlank).set_money(2000);
new achievement("Millionaire", sBlank).set_money(5000);
new achievement("Look I'm On TV", sBlank).set_money(500);
new achievement("Don't Touch", sBlank).set_item("Researcher Coat");
new achievement("Welcome Home!", sBlank).set_money(500);
new achievement("Hey Hey", sBlank).set_money(500);
new achievement("Harvest Time", sBlank).set_money(500);
new achievement("Gotta Catch 'em All", sBlank).set_money(10000);
new achievement("Thanks for the Fish", sBlank).set_money(500);
new achievement("Dig In!", sBlank).set_money(500);
new achievement("Fish Fear Me", sBlank).set_money(3000);
new achievement("Rhythm Master", sBlank).set_money(10000);
new achievement("Plenty of Fish in the Sea", sBlank).set_money(3000);
new achievement("Love Nature", sBlank).set_money(3000);
new achievement("Employee of the Month", sBlank).set_money(5000);
new achievement("Well Trained", sBlank).set_money(10000);
new achievement("How Could You...", sBlank).set_money(1000);
new achievement("Highway Robbery", sBlank).set_money(100);
new achievement("Eh?", sBlank).set_money(500);
new achievement("Barebones", sBlank).set_money(500);
new achievement("It's Hammer Time", sBlank).set_money(1000);
new achievement("Skill Issue", sBlank).set_item("Beetle");
new achievement("Orarara", sBlank).set_item("Candy Kingdom Sweets");
new achievement("Art Block", sBlank).set_money(1000);
new achievement("No Thoughts Head Empty", sBlank).set_money(5000);
new achievement("Bullet Hell Pro", sBlank).set_money(8000);
new achievement("No Mains", sBlank).set_money(3000);
new achievement("Raw Strength", sBlank).set_money(5000);
new achievement("Tank class", sBlank).set_money(3000);
new achievement("Lets Go Gambling!", sBlank).set_money(500);
new achievement("Faster!!!", sBlank).set_money(2000);
new achievement("This is Legal Right?", sBlank).set_money(2000);
new achievement("Scammed", sBlank).set_money(5000);
new achievement("Lifelong Companion", sBlank).set_money(5000);
new achievement("Zenloss", sBlank).set_money(2000);
new achievement("Now Find Them All", sBlank).set_money(3000);
new achievement("Order of Operations", sBlank).set_money(3000);
new achievement("5% of Gamblers", sBlank).set_money(3000);
new achievement("Stamp Hunter", sBlank).set_item("Promise Tiara");
new achievement("Bigger.", sBlank).set_item("Corporation Pin");
new achievement("Just One More Life", sBlank).set_item("Raven Feather");
new achievement("Queen of Jumping", sBlank).set_money(10000);
new achievement("Get Some Help.", sBlank).set_money(1);

#region Character achievements
new achievement("HIC", sBlank).set_character("Amelia Watson").set_money(500);
new achievement("True Tea-mate", sBlank).set_character("Amelia Watson").set_money(3000);
new achievement("A", sBlank).set_character("Gawr Gura").set_money(500);
new achievement("True Chumbud", sBlank).set_character("Gawr Gura").set_money(3000);
new achievement("Sorry", sBlank).set_character("Ninomae Ina'nis").set_weapon("Cutting Board");
new achievement("Ina Ina Ina!", sBlank).set_character("Ninomae Ina'nis").set_money(500);
new achievement("True Takodachi", sBlank).set_character("Ninomae Ina'nis").set_money(3000);
new achievement("Chicken Down", sBlank).set_character("Takanashi Kiara").set_item("Chicken's Feather");
new achievement("Kikkeriki!", sBlank).set_character("Takanashi Kiara").set_money(500);
new achievement("True KFPg", sBlank).set_character("Takanashi Kiara").set_money(3000);
new achievement("I Like the Cotton Candy Flavor", sBlank).set_character("Mori Calliope").set_item("Energy Drink");
new achievement("Big Ups!", sBlank).set_character("Mori Calliope").set_money(500);
new achievement("True Dead Beat", sBlank).set_character("Mori Calliope").set_money(3000);
new achievement("That's not Dollrys", sBlank).set_character("Hakos Baelz").set_item("Plushie");
new achievement("Boom Boom Boom!", sBlank).set_character("Hakos Baelz").set_money(500);
new achievement("True Brats", sBlank).set_character("Hakos Baelz").set_money(3000);
new achievement("GWAK!", sBlank).set_character("Ouro Kronii").set_money(500);
new achievement("True Kronie", sBlank).set_character("Ouro Kronii").set_money(3000);
new achievement("Uuuuuuuuuuuuuuuuuuuuuuuuuuuu", sBlank).set_character("Ceres Fauna").set_money(500);
new achievement("True Sapling", sBlank).set_character("Ceres Fauna").set_money(3000);
new achievement("I forgor", sBlank).set_character("Nanashi Mumei").set_money(500);
new achievement("True Hooman", sBlank).set_character("Nanashi Mumei").set_money(3000);
new achievement("Limiters Released!", sBlank).set_character("Tsukumo Sana").set_item("Limiter");
new achievement("Sana Is Eternal!", sBlank).set_character("Tsukumo Sana").set_money(500);
new achievement("True Sanallite", sBlank).set_character("Tsukumo Sana").set_money(3000);
new achievement("VSinger", sBlank).set_character("IRyS").set_weapon("Idol Song");
new achievement("Hope has Descended!", sBlank).set_character("IRyS").set_item("Hope Soda");
new achievement("True Irystocrat", sBlank).set_character("IRyS").set_money(3000);
new achievement("Kon Kon Kitsune!", sBlank).set_character("Shirakami Fubuki").set_money(500);
new achievement("True Sukonbu", sBlank).set_character("Shirakami Fubuki").set_money(3000);
new achievement("Uchi Uchi, Uchidayo!", sBlank).set_character("Ookami Mio").set_money(500);
new achievement("True Miofa", sBlank).set_character("Ookami Mio").set_money(3000);
new achievement("Mogu Mogu... Okayu!", sBlank).set_character("Nekomata Okayu").set_money(500);
new achievement("True Onigiriya", sBlank).set_character("Nekomata Okayu").set_money(3000);
new achievement("Hey Guys~", sBlank).set_character("Inugami Korone").set_weapon("X-Potato");
new achievement("Yubi Yubi!", sBlank).set_character("Inugami Korone").set_money(500);
new achievement("True Koronesuki", sBlank).set_character("Inugami Korone").set_money(3000);
new achievement("Nun-nun!", sBlank).set_character("Tokino Sora").set_money(500);
new achievement("True Soratomo", sBlank).set_character("Tokino Sora").set_money(3000);
new achievement("Kon Azki!", sBlank).set_character("AZKi").set_money(500);
new achievement("True Pioneer", sBlank).set_character("AZKi").set_money(3000);
new achievement("He-robo~", sBlank).set_character("Roboco-san").set_money(500);
new achievement("True Robosa", sBlank).set_character("Roboco-san").set_money(3000);
new achievement("Cute today too!", sBlank).set_character("Hoshimachi Suisei").set_money(500);
new achievement("True Hoshiyomi", sBlank).set_character("Hoshimachi Suisei").set_money(3000);
new achievement("Nyahello!", sBlank).set_character("Sakura Miko").set_money(500);
new achievement("True 35P", sBlank).set_character("Sakura Miko").set_money(3000);
new achievement("Big Red Heart!", sBlank).set_character("Akai Haato").set_money(500);
new achievement("True Haaton", sBlank).set_character("Akai Haato").set_money(3000);
new achievement("Kapu Kapu!", sBlank).set_character("Yozora Mel").set_money(500);
new achievement("True Kapumin", sBlank).set_character("Yozora Mel").set_money(3000);
new achievement("Wasshoi! Wasshoi!", sBlank).set_character("Natsuiro Matsuri").set_money(500);
new achievement("True Matsurisu", sBlank).set_character("Natsuiro Matsuri").set_money(3000);
new achievement("Alona~!", sBlank).set_character("Aki Rosenthal").set_money(500);
new achievement("True Rosetai", sBlank).set_character("Aki Rosenthal").set_money(3000);
new achievement("My Cute Students~", sBlank).set_character("Yuzuki Choco").set_money(500);
new achievement("True Chocomate", sBlank).set_character("Yuzuki Choco").set_money(3000);
new achievement("Ajimaru Ajimaru!", sBlank).set_character("Oozora Subaru").set_money(500);
new achievement("True Subatomo", sBlank).set_character("Oozora Subaru").set_money(3000);
new achievement("Kusogaki Power", sBlank).set_character("Murasaki Shion").set_item("Kusogaki Shackles");
new achievement("Neeeeeeeeeeeeeeeeeeeeee~", sBlank).set_character("Murasaki Shion").set_money(500);
new achievement("True Shiokko", sBlank).set_character("Murasaki Shion").set_money(3000);
new achievement("Yodayo!", sBlank).set_character("Nakiri Ayame").set_money(500);
new achievement("True Nakirigumi", sBlank).set_character("Nakiri Ayame").set_money(3000);
new achievement("KonAqua!", sBlank).set_character("Minato Aqua").set_money(500);
new achievement("True AquaCrew", sBlank).set_character("Minato Aqua").set_money(3000);
new achievement("Moon Moon~ Moonafic Dayo!", sBlank).set_character("Moona Hoshinova").set_money(500);
new achievement("True Moonafic", sBlank).set_character("Moona Hoshinova").set_money(3000);
new achievement("OBISA!", sBlank).set_character("Airani Iofifteen").set_money(500);
new achievement("True Ioforia", sBlank).set_character("Airani Iofifteen").set_money(3000);
new achievement("Purupuru ganbari Risu~!", sBlank).set_character("Ayunda Risu").set_money(500);
new achievement("True Risuner", sBlank).set_character("Ayunda Risu").set_money(3000);
new achievement("ZOMBANWA!", sBlank).set_character("Kureiji Ollie").set_money(500);
new achievement("Otsucrazy!", sBlank).set_character("Kureiji Ollie").set_item("Ninja Headband");
new achievement("True Zomrade", sBlank).set_character("Kureiji Ollie").set_money(3000);
new achievement("Attention Please!", sBlank).set_character("Pavolia Reine").set_money(500);
new achievement("True MERAKyat", sBlank).set_character("Pavolia Reine").set_money(3000);
new achievement("Otsukeris~", sBlank).set_character("Anya Melfissa").set_money(500);
new achievement("True Melfriend", sBlank).set_character("Anya Melfissa").set_money(3000);
new achievement("I am under the water", sBlank).set_character("Kobo Kanaeru").set_money(500);
new achievement("True Koboker", sBlank).set_character("Kobo Kanaeru").set_money(3000);
new achievement("Otsulemao~", sBlank).set_character("Kaela Kovalskia").set_money(500);
new achievement("True Pemaloe", sBlank).set_character("Kaela Kovalskia").set_money(3000);
new achievement("A Little Trollin", sBlank).set_character("Vestia Zeta").set_item("Focus Shades");
new achievement("Zetamin", sBlank).set_character("Vestia Zeta").set_money(500);
new achievement("True Zecretary", sBlank).set_character("Vestia Zeta").set_money(3000);
new achievement("Konpeko! Konpeko! Konpeko!", sBlank).set_character("Usada Pekora").set_money(500);
new achievement("True Nousagi", sBlank).set_character("Usada Pekora").set_money(3000);
new achievement("Kon Muscle!", sBlank).set_character("Shirogane Noel").set_money(500);
new achievement("True Danin-san", sBlank).set_character("Shirogane Noel").set_money(3000);
new achievement("Kon Nui!", sBlank).set_character("Shiranui Flare").set_money(500);
new achievement("True Elfriend", sBlank).set_character("Shiranui Flare").set_money(3000);
new achievement("Set Sail~!", sBlank).set_character("Houshou Marine").set_money(500);
new achievement("True Ichimin", sBlank).set_character("Houshou Marine").set_money(3000);
new achievement("GMMF!", sBlank).set_character("Kiryu Coco").set_money(500);
new achievement("True Tatsunoko", sBlank).set_character("Kiryu Coco").set_money(3000);
new achievement("50KG Grip", sBlank).set_character("Amane Kanata").set_money(500);
new achievement("True Heimin", sBlank).set_character("Amane Kanata").set_money(3000);
new achievement("Yo Yo Yo!", sBlank).set_character("Tsunomaki Watame").set_money(500);
new achievement("True Watamate", sBlank).set_character("Tsunomaki Watame").set_money(3000);
new achievement("Konyappi~!", sBlank).set_character("Tokoyami Towa").set_money(500);
new achievement("True Tokoyami Kenzoku", sBlank).set_character("Tokoyami Towa").set_money(3000);
new achievement("Otsukaresama Nanora Ne", sBlank).set_character("Himemori Luna").set_money(500);
new achievement("True Luknight", sBlank).set_character("Himemori Luna").set_money(3000);
#endregion
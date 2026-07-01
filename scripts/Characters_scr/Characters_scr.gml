GameData ??= {};
GameData.characters = {};
#macro Characters GameData.characters

function character(_name) constructor {
	name = string_replace_all(_name, " ", "_");
	uiname = string_replace_all(_name, "_", " ");
	spd = 0;
	idle_sprite = sBlank;
	run_sprite = sBlank;
	title_sprite = sBlank;
	main_weapon = "undefined";
	portrait = sBlank;
	hp = 10;
	atk = 1;
	crit = 1;
	ball_size = 1;
	flat = false;
	unlocked_by_default = true;
	unlocked = false;
	agency = Agencies.Unknown;
	locked_color = undefined;
	skins = {"base": {idle: idle_sprite, run: run_sprite}};
	skinorder = ["base"];
	perks = ["null", "null", "null"];
	completion_ach = undefined;
	Characters[$ _name] = self;

	static set_weapon = function(_w) {
		main_weapon = string_lower(_w);
		return self;
	};

	static set_sprite = function(idle, run, port, title) {
		idle_sprite = idle;
		run_sprite = run;
		portrait = port;
		title_sprite = title;
		skins.base.idle = idle_sprite;
		skins.base.run = run_sprite;
		var surf = surface_create(1, 1);
		surface_set_target(surf);
		draw_sprite_centered(title, 0, 0, 33);
		surface_reset_target();
		locked_color = surface_getpixel(surf, 0, 0);
		surface_free(surf);
		return self;
	};

	static set_speed = function(s) {
		spd = s;
		return self;
	};

	static set_hp = function(s) {
		hp = s;
		return self;
	};

	static set_crit = function(s) {
		crit = s;
		return self;
	};

	static set_atk = function(s) {
		atk = s;
		return self;
	};

	static set_ballsize = function(s) {
		ball_size = s;
		return self;
	};

	static set_flat = function(s) {
		flat = s;
		return self;
	};

	static set_unlocked_default = function(s) {
		unlocked_by_default = s;
		unlocked = s;
		return self;
	};

	static set_unlocked = function(s) {
		unlocked = s;
		return self;
	};

	static set_agency = function(s) {
		agency = s;
		return self;
	};

	static set_perks = function(p1, p2, p3) {
		perks = [string_lower(p1), string_lower(p2), string_lower(p3)];
		return self;
	};

	static add_skin = function(sname, idlespr, runspr) {
		skins[$ sname] = {idle: idlespr, run: runspr};
		array_push(skinorder, sname);
		return self;
	};

	static set_completion = function(achname) {
		completion_ach = achname;
		return self;
	};
}

var c = new character("Amelia_Watson");
c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleAme)
	.set_speed(1.35)
	.set_weapon("Ame_Pistol")
	.set_hp(75)
	.set_atk(1.30)
	.set_crit(10)
	.set_ballsize(3)
	.set_flat(false)
	.set_unlocked_default(true)
	.add_skin("O1", sAmeliaIdleO1, sAmeliaRunO1)
	.add_skin("O2", sAmeliaIdleO2, sAmeliaRunO2)
	.add_skin("O3", sAmeliaIdleO3, sAmeliaRunO3)
	.set_perks("The_Ame_Way", "Detective_Eye", "Bubba")
	.set_completion("HIC")
	.set_agency(Agencies.Hololive);
//c = new character("Aki_Rosenthal");
//c.set_sprite(sAmeliaIdle, sAmeliaRun, sAkiPortrait, sTitleAki)
//.set_speed(1.35)
//.set_weapon("Ame_Pistol")
//.set_hp(75)
//.set_atk(30)
//.set_crit(1.10)
//.set_ballsize(3)
//.set_flat(false);
//
//c = new character("Takanashi_Kiara");
//c.set_sprite(sAmeliaIdle, sAmeliaRun, sAmeliaPortrait, sTitleKiara)
//.set_speed(1.35)
//.set_weapon("BL_Book")
//.set_hp(75)
//.set_atk(30)
//.set_crit(1.10)
//.set_ballsize(3)
//.set_flat(false);
enum Agencies {
	Unknown,
	Hololive,
	PhaseConnect,
	Indies
}

c = new character("Tenma_Maemi");
c.set_sprite(sTenmaIdle, sTenmaRun, sTenmaPortrait, sTitleTenma)
	.set_speed(1.35)
	.set_weapon("Cutting_Board")
	.set_hp(75)
	.set_atk(1.30)
	.set_crit(10)
	.set_flat(true)
	.set_ballsize(1)
	.set_unlocked_default(true)
	.set_agency(Agencies.PhaseConnect);

c = new character("Fujikura_Uruka");
c.set_sprite(sUrukaIdle, sUrukaRunning, sUrukaPortrait, sBlank)
	.set_speed(1)
	.set_weapon("Music_Note")
	.set_perks("Dirty_Mind", "Trash_Bear", "Brittle_Bones")
	.set_hp(85)
	.set_atk(1.50)
	.set_crit(5)
	.set_flat(false)
	.set_ballsize(2)
	.set_unlocked_default(true)
	.set_agency(Agencies.PhaseConnect);

c = new character("Kasumi_Mai");
c.set_sprite(sMaiIdle, sMaiRun, sMaifumiPort, sMaifumiTitle)
	.set_speed(1.50)
	.set_weapon("Fan_Beam")
	.set_hp(60)
	.set_atk(1.30)
	.set_crit(10)
	.set_flat(true)
	.set_ballsize(1)
	.set_unlocked_default(true)
	.set_agency(Agencies.Indies);

c = new character("A_Debug");
c.set_sprite(sTrickyIdle, sTrickyRun, sTrickyPortrait, sTrickyTitle)
	.set_speed(1.35)
	.set_weapon("Bird_Feather")
	.set_hp(100)
	.set_atk(1)
	.set_crit(10)
	.set_flat(false)
	.set_ballsize(3)
	.set_unlocked_default(true)
	.set_agency(Agencies.Indies);

c = new character("Rinkou_Ahelia");
c.set_sprite(sLiaIdle, sLiaRun, sLiaPortrait, sBlank)
	.set_speed(1.35)
	.set_weapon("Bird_Feather")
	.set_hp(100)
	.set_atk(1)
	.set_crit(10)
	.set_flat(false)
	.set_ballsize(3)
	.set_unlocked_default(true)
	.set_agency(Agencies.PhaseConnect);

c = new character("Tsukiboshi_Lumin");
c.set_sprite(sLuminIdle, sLuminRun, sBlank, sBlank)
	.set_speed(1.35)
	.set_weapon("Bird_Feather")
	.set_hp(100)
	.set_atk(1)
	.set_crit(10)
	.set_flat(false)
	.set_ballsize(3)
	.set_unlocked_default(true)
	.set_agency(Agencies.Indies);

//c = new character("Korone_Inugami");
//c.set_sprite(sBlank, sBlank, sKoronePortrait, spr_Title_Korone_0)
	//.set_agency(Agencies.Hololive);
//c = new character("Okayu_Nekomata");
//c.set_sprite(sBlank, sBlank, sOkayuPortrait, spr_Title_Okayu_0)
	//.set_agency(Agencies.Hololive);
c = new character("Fubuki_Shirakami");
c.set_sprite(sFubukiIdle, sFubukiRun, sFubukiPortrait, spr_Title_Fubuki_0)
	.set_agency(Agencies.Hololive)
	.set_weapon("Fox_Tail")
	.set_perks("Kon_Kon", "Friendzone", "Fox_King")
	.set_hp(55)
	.set_atk(1)
	.set_speed(1.5)
	.set_crit(5)
	.set_flat(true)
	.set_ballsize(2);
//c = new character("Haato_Akai");
//c.set_sprite(sBlank, sBlank, sHaatoPortrait, spr_Title_Haato_0)
	//.set_agency(Agencies.Hololive);
//c = new character("Irys_blank");
//c.set_sprite(sBlank, sBlank, sIrysPortrait, spr_Title_Irys_0)
	//.set_agency(Agencies.Hololive);

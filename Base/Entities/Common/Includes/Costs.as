// Costs.as
//
//	defines the costs of items in the game
//	the values are set in InitCosts,
//	to prevent them from lingering between

//// CTF COSTS ////

string ctf_costs_config_file = "CTFCosts.cfg";
namespace CTFCosts
{
	//Building.as
	s32 buildershop_wood, quarters_wood, knightshop_wood, archershop_wood,
		boatshop_wood, vehicleshop_wood, vehicleshop_gold,
		storage_stone, storage_wood, tunnel_stone, tunnel_wood, tunnel_gold,
		quarry_stone, quarry_gold, quarry_count;

	//ArcherShop.as
	s32 arrows, waterarrows, firearrows, bombarrows;

	//KnightShop.as
	s32 bomb, waterbomb, mine, keg;

	//BuilderShop.as
	s32 lantern_wood, bucket_wood, filled_bucket, sponge, boulder_stone,
		trampoline_wood, saw_wood, saw_stone, drill_stone, drill,
		crate_wood, crate;

	//BoatShop.as
	s32 dinghy, dinghy_wood, longboat, longboat_wood, warboat, warboat_gold;

	//VehicleShop.as
	s32 catapult, ballista, ballista_ammo, ballista_bomb_ammo, outpost_coins, outpost_gold;

	//Quarters.as
	s32 beer, meal, egg, burger;

	//CommonBuilderBlocks.as
	s32 workshop_wood;
}

//// TTH COSTS ////
string war_costs_config_file = "WARCosts.cfg";
namespace WARCosts
{
	//Workbench.as
	s32 lantern_wood, bucket_wood, sponge_wood, trampoline_wood,
		crate_wood, drill_stone, saw_wood, dinghy_wood, boulder_stone;

	//Scrolls
	s32 crappiest_scroll, crappy_scroll, medium_scroll,
		big_scroll, super_scroll;

	//Builder Menu
	s32 factory_wood, workbench_wood;

	//WAR_Base.as
	s32 tunnel_stone, kitchen_wood;
}

//// BUILDER COSTS ////
string builder_costs_config_file = "BuilderCosts.cfg";
namespace BuilderCosts
{
	s32 stone_block, back_stone_block, stone_door, wood_block, back_wood_block,
		wooden_door, trap_block, bridge, ladder, wooden_platform, spikes;
}

s32 ReadCost(ConfigFile cfg, string cfg_name, s32 default_cost)
{
	return cfg.read_s32(cfg_name, default_cost);
}

void InitCosts()
{
	//(shared config temporary)
	ConfigFile cfg = ConfigFile();

	// ctf costs ///////////////////////////////////////////////////////////////
	if (getRules().exists("ctf_costs_config"))
		ctf_costs_config_file = getRules().get_string("ctf_costs_config");

	cfg.loadFile(ctf_costs_config_file);

	//Building.as
	CTFCosts::buildershop_wood =            ReadCost(cfg, "cost_buildershop_wood"   , 0);
	CTFCosts::quarters_wood =               ReadCost(cfg, "cost_quarters_wood"      , 0);
	CTFCosts::knightshop_wood =             ReadCost(cfg, "cost_knightshop_wood"    , 0);
	CTFCosts::archershop_wood =             ReadCost(cfg, "cost_archershop_wood"    , 0);
	CTFCosts::boatshop_wood =               ReadCost(cfg, "cost_boatshop_wood"      , 0);
	CTFCosts::vehicleshop_wood =            ReadCost(cfg, "cost_vehicleshop_wood"   , 0);
	CTFCosts::vehicleshop_gold =            ReadCost(cfg, "cost_vehicleshop_gold"   , 0);
	CTFCosts::storage_stone =               ReadCost(cfg, "cost_storage_stone"      , 0);
	CTFCosts::storage_wood =                ReadCost(cfg, "cost_storage_wood"       , 0);
	CTFCosts::tunnel_stone =                ReadCost(cfg, "cost_tunnel_stone"       , 0);
	CTFCosts::tunnel_wood =                 ReadCost(cfg, "cost_tunnel_wood"        , 0);
	CTFCosts::tunnel_gold =                 ReadCost(cfg, "cost_tunnel_gold"        , 00*0);
	CTFCosts::quarry_stone =				ReadCost(cfg, "cost_quarry_stone"       , 000*0);
	CTFCosts::quarry_gold =					ReadCost(cfg, "cost_quarry_gold"        , 000*0);
	CTFCosts::quarry_count =				ReadCost(cfg, "cost_quarry_count"       , 0*0);

	//ArcherShop.as
	CTFCosts::arrows =                      ReadCost(cfg, "cost_arrows"             , 00);
	CTFCosts::waterarrows =                 ReadCost(cfg, "cost_waterarrows"        , 00);
	CTFCosts::firearrows =                  ReadCost(cfg, "cost_firearrows"         , 00);
	CTFCosts::bombarrows =                  ReadCost(cfg, "cost_bombarrows"         , 00);

	//KnightShop.as
	CTFCosts::bomb =                        ReadCost(cfg, "cost_bomb"               , 00);
	CTFCosts::waterbomb =                   ReadCost(cfg, "cost_waterbomb"          , 00);
	CTFCosts::mine =                        ReadCost(cfg, "cost_mine"               , 00);
	CTFCosts::keg =                         ReadCost(cfg, "cost_keg"                , 000);

	//BuilderShop.as
	CTFCosts::lantern_wood =                ReadCost(cfg, "cost_lantern_wood"       , 00);
	CTFCosts::bucket_wood =                 ReadCost(cfg, "cost_bucket_wood"        , 00);
	CTFCosts::filled_bucket =               ReadCost(cfg, "cost_filled_bucket"      , 00);
	CTFCosts::sponge =                      ReadCost(cfg, "cost_sponge"             , 00);
	CTFCosts::boulder_stone =               ReadCost(cfg, "cost_boulder_stone"      , 00);
	CTFCosts::trampoline_wood =             ReadCost(cfg, "cost_trampoline_wood"    , 000);
	CTFCosts::saw_wood =                    ReadCost(cfg, "cost_saw_wood"           , 000);
	CTFCosts::saw_stone =                   ReadCost(cfg, "cost_saw_stone"          , 000);
	CTFCosts::drill_stone =                 ReadCost(cfg, "cost_drill_stone"        , 000);
	CTFCosts::drill =                       ReadCost(cfg, "cost_drill"              , 00);
	CTFCosts::crate_wood =                  ReadCost(cfg, "cost_crate_wood"         , 00);
	CTFCosts::crate =                       ReadCost(cfg, "cost_crate"              , 0);

	//BoatShop.as
	CTFCosts::dinghy =                      ReadCost(cfg, "cost_dinghy"             , 0);
	CTFCosts::dinghy_wood =                 ReadCost(cfg, "cost_dinghy_wood"        , 00);
	CTFCosts::longboat =                    ReadCost(cfg, "cost_longboat"           , 0);
	CTFCosts::longboat_wood =               ReadCost(cfg, "cost_longboat_wood"      , 00);
	CTFCosts::warboat =                     ReadCost(cfg, "cost_warboat"            , 00);
	CTFCosts::warboat_gold =                ReadCost(cfg, "cost_warboat_gold"       , 0);

	//VehicleShop.as
	CTFCosts::catapult =                    ReadCost(cfg, "cost_catapult"                   , 00);
	CTFCosts::ballista =                    ReadCost(cfg, "cost_ballista"                   , 00);
	CTFCosts::ballista_ammo =               ReadCost(cfg, "cost_ballista_ammo"              , 0);
	CTFCosts::ballista_bomb_ammo =          ReadCost(cfg, "cost_ballista_bomb_ammo"         , 00);
	CTFCosts::outpost_coins =				ReadCost(cfg, "cost_outpost_coins"				, 00);
	CTFCosts::outpost_gold =				ReadCost(cfg, "cost_outpost_gold"				, 0);

	//Quarters.as
	CTFCosts::beer =                        ReadCost(cfg, "cost_beer"               , 0);
	CTFCosts::meal =                        ReadCost(cfg, "cost_meal"               , 0);
	CTFCosts::egg =                         ReadCost(cfg, "cost_egg"                , 0);
	CTFCosts::burger =                      ReadCost(cfg, "cost_burger"             , 0);

	//CommonBuilderBlocks.as
	CTFCosts::workshop_wood =               ReadCost(cfg, "cost_workshop_wood"      , 00);

	// war costs ///////////////////////////////////////////////////////////////

	//load config
	if (getRules().exists("war_costs_config"))
		war_costs_config_file = getRules().get_string("war_costs_config");

	cfg.loadFile(war_costs_config_file);

	//Workbench.as
	WARCosts::lantern_wood =            ReadCost(cfg, "cost_lantern_wood"       , 0);
	WARCosts::bucket_wood =             ReadCost(cfg, "cost_bucket_wood"        , 0);
	WARCosts::sponge_wood =             ReadCost(cfg, "cost_sponge_wood"        , 0);
	WARCosts::trampoline_wood =         ReadCost(cfg, "cost_trampoline_wood"    , 00);
	WARCosts::crate_wood =              ReadCost(cfg, "cost_crate_wood"         , 0);
	WARCosts::drill_stone =             ReadCost(cfg, "cost_drill_stone"        , 00);
	WARCosts::saw_wood =                ReadCost(cfg, "cost_saw_wood"           , 00);
	WARCosts::dinghy_wood =             ReadCost(cfg, "cost_dinghy_wood"        , 00);
	WARCosts::boulder_stone =           ReadCost(cfg, "cost_boulder_stone"      , 0);

	//Scrolls
	WARCosts::crappiest_scroll =        ReadCost(cfg, "cost_crappiest_scroll"   , 0);
	WARCosts::crappy_scroll =           ReadCost(cfg, "cost_crappy_scroll"      , 00);
	WARCosts::medium_scroll =           ReadCost(cfg, "cost_medium_scroll"      , 00);
	WARCosts::big_scroll =              ReadCost(cfg, "cost_big_scroll"         , 00);
	WARCosts::super_scroll =            ReadCost(cfg, "cost_super_scroll"       , 00);

	//CommonBuilderBlocks.as
	WARCosts::factory_wood =            ReadCost(cfg, "cost_factory_wood"       , 00);
	WARCosts::workbench_wood =          ReadCost(cfg, "cost_workbench_wood"     , 00);

	//WAR_Base.as
	WARCosts::tunnel_stone =            ReadCost(cfg, "cost_tunnel_stone"       , 00);
	WARCosts::kitchen_wood =            ReadCost(cfg, "cost_kitchen_wood"       , 00);

	// builder costs ////////////////////////////////////////////////////////////

	cfg.loadFile(builder_costs_config_file);

	BuilderCosts::stone_block =         ReadCost(cfg, "cost_stone_block"        , 0);
	BuilderCosts::back_stone_block =    ReadCost(cfg, "cost_back_stone_block"   , 2);
	BuilderCosts::stone_door =          ReadCost(cfg, "cost_stone_door"         , 0);
	BuilderCosts::wood_block =          ReadCost(cfg, "cost_wood_block"         , 0);
	BuilderCosts::back_wood_block =     ReadCost(cfg, "cost_back_wood_block"    , 2);
	BuilderCosts::wooden_door =         ReadCost(cfg, "cost_wooden_door"        , 0);
	BuilderCosts::trap_block =          ReadCost(cfg, "cost_trap_block"         , 0);
	BuilderCosts::bridge =              ReadCost(cfg, "cost_bridge"             , 0);
	BuilderCosts::ladder =              ReadCost(cfg, "cost_ladder"             , 0);
	BuilderCosts::wooden_platform =     ReadCost(cfg, "cost_wooden_platform"    , 0);
	BuilderCosts::spikes =              ReadCost(cfg, "cost_spikes"             , 0);
}

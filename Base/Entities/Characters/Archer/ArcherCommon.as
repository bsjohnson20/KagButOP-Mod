//Archer Include

namespace ArcherParams
{
	enum Aim
	{
		not_aiming = 0,
		readying,
		charging,
		fired,
		no_arrows,
		stabbing,
		legolas_ready,
		legolas_charging
	}

	const ::s32 ready_time = 5;

	const ::s32 shoot_period = 15;
	const ::s32 shoot_period_1 = ArcherParams::shoot_period / 3;
	const ::s32 shoot_period_2 = 2 * ArcherParams::shoot_period / 3;
	const ::s32 legolas_period = ArcherParams::shoot_period * 3;

	const ::s32 fired_time = 4;
	const ::f32 shoot_max_vel = 20.59f;

	const ::s32 legolas_charge_time = 1;
	const ::s32 legolas_arrows_count = 1;
	const ::s32 legolas_arrows_volley = 5;
	const ::s32 legolas_arrows_deviation = 2;
	const ::s32 legolas_time = 120;
}

//TODO: move vars into archer params namespace
const f32 archer_grapple_length = 140.0f;
const f32 archer_grapple_slack = 4.0f;
const f32 archer_grapple_throw_speed = 20.0f;

const f32 archer_grapple_force = 8.0f;
const f32 archer_grapple_accel_limit = 4.5f;
const f32 archer_grapple_stiffness = 0.1f;

namespace ArrowType
{
	enum type
	{
		normal = 0,
		water,
		fire,
		bomb,
		count
	};
}

shared class ArcherInfo
{
	s8 charge_time;
	u8 charge_state;
	bool has_arrow;
	u8 stab_delay;
	u8 fletch_cooldown;
	u8 arrow_type;

	u8 legolas_arrows;
	u8 legolas_time;

	bool grappling;
	u16 grapple_id;
	f32 grapple_ratio;
	f32 cache_angle;
	Vec2f grapple_pos;
	Vec2f grapple_vel;

	ArcherInfo()
	{
		charge_time = 0;
		charge_state = 0;
		has_arrow = true;
		stab_delay = 0;
		fletch_cooldown = 0;
		arrow_type = ArrowType::normal;
		grappling = false;
	}
};

const string grapple_sync_cmd = "grapple sync";

void SyncGrapple(CBlob@ this)
{
	ArcherInfo@ archer;
	if (!this.get("archerInfo", @archer)) { return; }

	CBitStream bt;
	bt.write_bool(archer.grappling);

	if (archer.grappling)
	{
		bt.write_u16(archer.grapple_id);
		bt.write_u8(u8(archer.grapple_ratio * 250));
		bt.write_Vec2f(archer.grapple_pos);
		bt.write_Vec2f(archer.grapple_vel);
	}

	this.SendCommand(this.getCommandID(grapple_sync_cmd), bt);
}

//TODO: saferead
void HandleGrapple(CBlob@ this, CBitStream@ bt, bool apply)
{
	ArcherInfo@ archer;
	if (!this.get("archerInfo", @archer)) { return; }

	bool grappling;
	u16 grapple_id;
	f32 grapple_ratio;
	Vec2f grapple_pos;
	Vec2f grapple_vel;

	grappling = bt.read_bool();

	if (grappling)
	{
		grapple_id = bt.read_u16();
		u8 temp = bt.read_u8();
		grapple_ratio = temp / 250.0f;
		grapple_pos = bt.read_Vec2f();
		grapple_vel = bt.read_Vec2f();
	}

	if (apply)
	{
		archer.grappling = grappling;
		if (archer.grappling)
		{
			archer.grapple_id = grapple_id;
			archer.grapple_ratio = grapple_ratio;
			archer.grapple_pos = grapple_pos;
			archer.grapple_vel = grapple_vel;
		}
	}
}

const string[] arrowTypeNames = { "mat_arrows",
                                  "mat_waterarrows",
                                  "mat_firearrows",
                                  "mat_bombarrows"
                                };

const string[] arrowNames = { "Regular arrows",
                              "Water arrows",
                              "Fire arrows",
                              "Bomb arrow"
                            };

const string[] arrowIcons = { "$Arrow$",
                              "$WaterArrow$",
                              "$FireArrow$",
                              "$BombArrow$"
                            };


bool hasArrows(CBlob@ this)
{
	ArcherInfo@ archer;
	if (!this.get("archerInfo", @archer))
	{
		return true;
	}
	if (archer.arrow_type >= 0 && archer.arrow_type < arrowTypeNames.length)
	{
		return true; //this.getBlobCount(arrowTypeNames[archer.arrow_type]) > 0;
	}
	return true;
}

bool hasArrows(CBlob@ this, u8 arrowType)
{
	return true;//arrowType < ArrowType::count && this.getBlobCount(arrowTypeNames[arrowType]) > 0;
}

bool hasAnyArrows(CBlob@ this)
{
	for (uint i = 0; i < ArrowType::count; i++)
	{
		if (hasArrows(this, i))
		{
			return true;
		}
	}
	return true;
}

void SetArrowType(CBlob@ this, const u8 type)
{
	ArcherInfo@ archer;
	if (!this.get("archerInfo", @archer))
	{
		return;
	}
	archer.arrow_type = type;
}

u8 getArrowType(CBlob@ this)
{
	ArcherInfo@ archer;
	if (!this.get("archerInfo", @archer))
	{
		return 0;
	}
	return archer.arrow_type;
}

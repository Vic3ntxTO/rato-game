var _x1 = x;
var _x2= x + 10;
var _y1 = y-(sprite_height /2);
var _y2 = y+(sprite_height /2);

if (canCreate)
{
	part_emitter_region(wallSystem,wallEmitter, _x1,  _x2,  _y1,  _y2,ps_shape_rectangle,ps_distr_linear);
}

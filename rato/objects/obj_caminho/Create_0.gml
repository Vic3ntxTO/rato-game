canCreate = true;
//nextRoom = noone;
//newX = 0;
//newY = 0;

if(canCreate)
{
	wallSystem = part_system_create();
	part_system_depth(wallSystem,depth - 1);

	wallPartype =  part_type_create();
	part_type_shape(wallPartype, pt_shape_square);
	part_type_size(wallPartype, 0.001,0,0.001,0.5);
	part_type_color2(wallPartype,c_black, c_white);
	part_type_alpha3(wallPartype,1,0.6,0);
	part_type_life(wallPartype,20,40);

	part_type_speed(wallPartype,5,10, -0.1,0);
	part_type_direction(wallPartype,170, 190,0,0);

	wallEmitter = part_emitter_create(wallSystem)

	var _x1 = x;
	var _x2 = x + 10;
	var _y1 = y - (sprite_height/2);
	var _y2 = x + (sprite_height/2);

	part_emitter_region(wallSystem,wallEmitter, _x1,  _x2,  _y1,  _y2,ps_shape_rectangle,ps_distr_linear);

	part_emitter_stream(wallSystem,wallEmitter,wallPartype,3);
}

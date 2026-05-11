if (keyboard_check_pressed(ord("M"))) {

    // Se NÃO estiver na Room1
    if (room != Room1) {
        global.room_anterior = room;
		x_anterior = obj_1.x;
		y_anterior = obj_1.y;
		obj_1.image_alpha = 0;
        room_goto(Room1);
    } 
    else {
        // Se já estiver na Room1, volta
        if (global.room_anterior != -1) {
            room_goto(global.room_anterior);
			obj_1.x = x_anterior;
			obj_1.y = y_anterior;obj_1.image_alpha = 1;
        }
    }
}
if (keyboard_check_pressed(vk_tab))
{
    // Se NÃO estiver na Room1
    if (room != Room6){
        global.room_anterior = room;
        room_goto(Room6);
    } 
    else {
        // Se já estiver na Room1, volta
        if (global.room_anterior != -1) {
            room_goto(global.room_anterior);
        }
    }
}
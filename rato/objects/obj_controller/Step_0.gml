if (keyboard_check_pressed(ord("M"))) {

    // Se NÃO estiver na Room1
    if (room != Room1) {
        global.room_anterior = room;
        room_goto(Room1);
    } 
    else {
        // Se já estiver na Room1, volta
        if (global.room_anterior != -1) {
            room_goto(global.room_anterior);
        }
    }
}
// Gravidade 
vsp += grav;

// Colisão vertical
if (place_meeting(x, y + vsp, obj_2)) {
    while (!place_meeting(x, y + sign(vsp), obj_2)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// DASH
var current_speed = 0; // velocidade que será aplicada neste step

// Detecta dash
if (keyboard_check_pressed(vk_shift) && can_dash) {
    dash_timer = dash_time;
    can_dash = false;
}

// Se dash ativo
if (dash_timer > 0) {
    dash_timer -= 1;
    
    if (keyboard_check(ord("D"))) current_speed = dash_speed;
    else if (keyboard_check(ord("A"))) current_speed = -dash_speed;
    
    sprite_index = spr_3; // sprite do dash
} 
else 
{
    // Movimento normal
    if (keyboard_check(ord("D"))) current_speed = 6;
    else if (keyboard_check(ord("A"))) current_speed = -6;

    // Sprite parado ou andando
    if (current_speed != 0) {
        sprite_index = spr_4; // sprite andando
    } else {
        sprite_index = spr_1; // sprite parado
    }
}

// Aplica movimento horizontal
x += current_speed;

// Mantém flip da sprite
if (current_speed > 0) image_xscale = 2;
if (current_speed < 0) image_xscale = -2;

// Reseta cooldown do dash
if (!can_dash && dash_timer <= 0) {
    dash_cooldown -= 1;
    if (dash_cooldown <= 0) {
        can_dash = true;
        dash_cooldown = 30;
    }
}

// Pulo
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_2)) {
    vsp = jump;
}
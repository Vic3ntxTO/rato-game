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

// Se dash ativo, aplica dash_speed
if (dash_timer > 0) {
    dash_timer -= 1;
    if (keyboard_check(ord("D"))) current_speed = dash_speed;
    if (keyboard_check(ord("A"))) current_speed = -dash_speed;
}

// Se não dashando, movimento normal
if (dash_timer <= 0) {
    if (keyboard_check(ord("D"))) current_speed = 8;
    if (keyboard_check(ord("A"))) current_speed = -8;
}

// Reseta cooldown do dash
if (!can_dash && dash_timer <= 0) {
    dash_cooldown -= 1;
    if (dash_cooldown <= 0) {
        can_dash = true;
        dash_cooldown = 30; // reset cooldown
    }
}

// Aplica movimento horizontal
x += current_speed;

// Sprite flip
if (current_speed > 0) image_xscale = -2; // olhando para a direita
if (current_speed < 0) image_xscale = 2;  // olhando para a esquerda

// Pulo
if (keyboard_check_pressed(vk_space) && place_meeting(x, y + 1, obj_2)) {
    vsp = jump;
}
if (!variable_global_exists("last_checkpoint_x")) {
    global.last_checkpoint_x = x;
    global.last_checkpoint_y = y;
}

key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);

var move = key_right - key_left;

horzspd = move * walksp;
vertspd = vertspd + grav;

if (horzspd > 0) {
    image_xscale = 1;
} else if (horzspd < 0) {
    image_xscale = -1;
}

if (horzspd != 0) {
    image_speed = 0.5;
} else {
    image_speed = 0;
}

var new_x = x + horzspd;
var new_y = y + vertspd;

if (!place_meeting(new_x, y, O_Collision)) {
    x = new_x;
} else {
    horzspd = 0;
}

if (!place_meeting(x, new_y, O_Collision) && !place_meeting(x, new_y, O_CollisionPlatformFall)) {
    y = new_y;
} else {
    vertspd = 0;
}

if (place_meeting(x, y + 1, O_Collision) or (place_meeting(x, y + 1, O_CollisionPlatformFall)))
{
    if( keyboard_check_pressed(vk_space))
	{
		vertspd = -10;
	}
}

var coin = instance_place(x, y, O_Coin);
if (coin) {
    instance_destroy(coin);
    global.coins_collected += 1;
}

var checkpoint = instance_place(x, y, O_CheckPoint);
if (checkpoint) {
    global.last_checkpoint_x = checkpoint.x;
    global.last_checkpoint_y = checkpoint.y;
}


if (place_meeting(x, y, O_Lava)) {
    respawn()

}

function respawn() {
    global.player_lives -= 1;

    if (global.player_lives > 0) {
        var lava = instance_find(O_Lava, 0);

        if (lava != noone) {
            if (lava.y < global.last_checkpoint_y + 150) { 
                lava.y = global.last_checkpoint_y + 300;
            }
        }

        x = global.last_checkpoint_x;
        y = global.last_checkpoint_y;
    }
    else {
        room_goto(R_titlescreen);
    }
}

if (place_meeting(x, y, O_CheckPoint)) {
    checkpoint = instance_position(x, y, O_CheckPoint);
}

if (place_meeting(x, y, O_Pick_Vertical)) {
    respawn();
}
if (place_meeting(x, y, O_Pick_Horizontal)) {
    respawn();
}

if (place_meeting(x, y, O_Lava)) {
    respawn();
}
if (place_meeting(x, y, O_FireSpawner)) {
    respawn();
}
if (place_meeting(x, y, O_kayoux)) {
    respawn(); 
}

if (place_meeting(x, y,O_Fin)) {
    global.final_score = global.coins_collected * global.player_lives;
	room_goto(R_victory);
}
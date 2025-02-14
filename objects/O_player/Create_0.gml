horzspd = 0;
vertspd = 0;
grav = 0.4;
walksp = 4;
check = 0;
checkpoint = undefined;


global.player_lives = 15; 
global.coins_collected = 0;


if (!variable_global_exists("coins_collected")) {
    global.coins_collected = 0;
}

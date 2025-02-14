
vspeed += gravite;
if (vspeed > vitesse_max) vspeed = vitesse_max; 


x += hspeed;


if (place_meeting(x + hspeed, y, O_Collision)) {
    hspeed = -hspeed;
}


if (place_meeting(x, y + 1, O_Collision)) {
    instance_destroy(); 
}
vspeed += 0.3;


if (vspeed > 5) vspeed = 5;


if (!place_meeting(x, y + vspeed, O_Collision)) {
    y += vspeed;
} else {
    vspeed = 0;
}
image_angle += 3;
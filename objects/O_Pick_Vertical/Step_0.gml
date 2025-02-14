switch (state) {
    case "pause":
        timer += .5;
        if (timer >= delay_time) {
            state = "monte";
            timer = 0;
        }
        break;

    case "monte":
        y -= 5;
        if (y <= start_y - 50) {
            state = "descend";
        }
        break;

    case "descend":
        y += 2;
        if (y >= start_y) {
            y = start_y;
            state = "pause";
        }
        break;
}

if (place_meeting(x, y, O_player) && can_damage) {
    global.player_lives -= 1;
    can_damage = false;
}

if (y == start_y && !can_damage) {
    can_damage = true;
}

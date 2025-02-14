switch (state) {
    case "pause":
        timer += 1;
        if (timer >= delay_time) {
            state = "monte";
            timer = 0;
        }
        break;

    case "monte":
        x -= 5;
        if (x <= start_x - 50) {
            state = "descend";
        }
        break;

    case "descend":
        x += 2;
        if (x >= start_x) {
            x = start_x;
            state = "pause";
        }
        break;
}

if (place_meeting(x, y, O_player) && can_damage) {
    global.player_lives -= 1;
    can_damage = false;
}

if (x == start_x && !can_damage) {
    can_damage = true;
}

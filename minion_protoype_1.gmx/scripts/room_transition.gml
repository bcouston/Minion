// Map of all rooms

//[0,0] - room_moe_house
//[1,0] - room_dungeon_overworld

switch (global.map_coordinates_x) {
    case 0:
        switch (global.map_coordinates_y) {
            case 0:
                room_goto(room_moe_house);
                break;
        }
        break;
    case 1:
        switch (global.map_coordinates_y) {
            case 0:
                room_goto(room_dungeon_overworld)
                break;
            case 1:
                room_goto(room_dungeon_street)
                break;
        }
        break;
    case 2:
        switch (global.map_coordinates_y) {
            case 1:
                room_goto(room_dungeon_training_course);
                break;
        }
}

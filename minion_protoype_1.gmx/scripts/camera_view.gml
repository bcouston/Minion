//argument 0 - y
//argument 1 - x
//argument 2 - position following x
//argument 3 - speed x
//argument 4 - min x
//argument 5 - max x
//argument 6 - position following y
//argument 7 - speed y
//argument 8 - max y
//argument 9 - min y
//argument 10 - width
//argument 11 - height
//argument 12 - width/height incrase/decrase speed

// X Pos
if (argument0 != -1) {
    view_yview[1] = argument0
}

// Y Pos
if (argument1 != -1) {
    view_xview[1] = argument1
}

// Width/Height alteration

if (argument10 != -1) {
    if (view_wview[1] < argument10) {
        next_width = view_wview[1] + ((argument10 - global.previous_wview)/argument12)
        if (next_width >= argument10) {
            view_wview[1] = argument10
            global.previous_wview = view_wview[1]
        } else {view_wview[1] = next_width}
    } else if (view_wview[1] > argument10) {
        next_width = view_wview[1] + ((argument10 - global.previous_wview)/argument12)
        if (next_width <= argument10) {
            view_wview[1] = argument10
            global.previous_wview = view_wview[1]
        } else {view_wview[1] = next_width}
    }
} else {
    global.previous_wview = view_wview[1]
}

if (argument11 != -1) {
    if (view_hview[1] < argument11) {
        next_height = view_hview[1] + ((argument11 - global.previous_hview)/argument12)
        if (next_height >= argument11) {
            view_hview[1] = argument11
            global.previous_hview = view_hview[1]
        } else {view_hview[1] = next_height}
    } else if (view_hview[1] > argument11) {
        next_height = view_hview[1] + ((argument11 - global.previous_hview)/argument12)
        if (next_height <= argument11) {
            view_hview[1] = argument11
            global.previous_hview = view_hview[1]
        } else {view_hview[1] = next_height}
    }
} else {
    global.previous_hview = view_hview[1]
}

// X following
if (argument2 != -1) {
    view_xview[1] += ((argument2-((view_wview[1])/2)) - view_xview[1]) * argument3
}

// Min + Max X    
if (argument4 != -1) {
    min_x = argument4
    if ((view_xview[1]) < min_x) {
        view_xview[1] = min_x
    }
}
if (argument5 != -1) {
    max_x = argument5
    if ((view_xview[1] + view_wview[1]) > max_x) {
        view_xview[1] = max_x - view_wview[1]
    }
}

// Y following
if (argument6 !=  -1) {
    view_yview[1] += ((argument6-((view_hview[1])/2)) - view_yview[1]) * argument7
}

// Max + Min Y
max_y = argument8
min_y = argument9

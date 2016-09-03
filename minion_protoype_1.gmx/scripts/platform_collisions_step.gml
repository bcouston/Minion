{
    //==================================================================
    //                             FLOOR
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the floor on the left
    bld_y = bbox_bottom;
    while(!collision_point(bbox_left,bld_y,argument0,true,true) && bld_y < bbox_bottom+check_distance){
        bld_y +=1;
    }
    bld_y -= 1; //1 pixel correction because of bbox
        //Find the floor on the right
    brd_y = bbox_bottom;
    while(!collision_point(bbox_right,brd_y,argument0,true,true) && brd_y < bbox_bottom+check_distance){
        brd_y +=1;
    }
    brd_y -= 1;//1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                          CEILING
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the floor on the left
    tlu_y = bbox_top;
    while(!collision_point(bbox_left,tlu_y,argument0,true,true) && tlu_y > bbox_top-check_distance){
        tlu_y -=1;
    }
    tlu_y += 1; //1 pixel correction because of bbox
        //Find the floor on the right
    tru_y = bbox_top;
    while(!collision_point(bbox_right,tru_y,argument0,true,true) && tru_y > bbox_top-check_distance){
        tru_y -=1;
    }
    tru_y += 1;//1 pixel correction because of bbox
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                           RIGHT WALL
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the wall on the top right
    trr_x = bbox_right;
    while(!collision_point(trr_x,bbox_top,argument0,true,true) && trr_x < bbox_right+check_distance){
        trr_x +=1;
    }
    trr_x -= 1;//1 pixel correction because of bbox
        //Find the wall on the bottom right
    brr_x = bbox_right;
    while(!collision_point(brr_x,bbox_bottom,argument0,true,true) && brr_x < bbox_right+check_distance){
        brr_x +=1;
    }
    brr_x -= 1; //1 pixel correction because of bbox
       //Find the wall in the middle 
    mrr_x = bbox_right;
    while(!collision_point(mrr_x,y,argument0,true,true) && mrr_x < bbox_right+check_distance){
        mrr_x +=1;
    }
    mrr_x -= 1;
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                           LEFT WALL
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the wall on the top right
    tll_x = bbox_left;
    while(!collision_point(tll_x,bbox_top,argument0,true,true) && tll_x > bbox_left-check_distance){
        tll_x -=1;
    }
    tll_x += 1;//1 pixel correction because of bbox
        //Find the wall on the bottom right
    bll_x = bbox_left;
    while(!collision_point(bll_x,bbox_bottom,argument0,true,true) && bll_x > bbox_left-check_distance){
        bll_x -=1;
    }
    bll_x += 1; //1 pixel correction because of bbox
        //Find the wall in the middle
    mll_x = bbox_left;
    while(!collision_point(mll_x,y,argument0,true,true) && mll_x > bbox_left-check_distance){
        mll_x -=1;
    }
    mll_x += 1;
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                             GRAVITY
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the closest floor and move towards it if you aren't touching it.
    //if bottom of player is above or at floor
    if(bbox_bottom <= min(bld_y,brd_y)){
        // if floor is smaller distance away from player than player speed
        if(point_distance(x,bbox_bottom,x,min(bld_y,brd_y)) < vspeed){
            //set player to floor
            y=min(bld_y,brd_y)-(bbox_bottom-y);
            vspeed = 0;
        }
    //player is at floor
    }else{
        y=min(bld_y,brd_y)-(bbox_bottom-y);
        vspeed = 0;
    }
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        CEILING COLLISION
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        //Find the closest floor and move towards it if you aren't touching it.
    if(bbox_top >= max(tlu_y,tru_y)){
        if((point_distance(x,bbox_top,x,max(tlu_y,tru_y))*-1) > vspeed){
            y=max(tlu_y,tru_y)+(y-bbox_top);
            vspeed = 0;
        }
    }else{
        y=max(tlu_y,tru_y)+(y-bbox_top);
        vspeed = 0;
    }
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        COLLIDING RIGHT
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if ((bbox_right <= min(trr_x,brr_x,mrr_x)) || (object_get_name(argument0) == "object_dungeon_slope_right")) {
        if (point_distance(bbox_right,y,min(brr_x,trr_x,mrr_x),y) < hspeed) {
            // Going up slope
            yplus = 0
            while (collision_point(bbox_right + hspeed,bbox_bottom - yplus,argument0,true,true) && yplus <= abs(1 * hspeed) ) {
                yplus +=1
            }
            if yplus > abs(1 * hspeed) {
                x=min(brr_x,trr_x,mrr_x)-(bbox_right-x);
                hspeed = 0;
            } else if (jump == false) {
                y -= yplus
                vspeed = 0
            }
        } else {
            //
        }
    } else if !(object_get_name(argument0) == "object_dungeon_slope_right") {
        x=min(brr_x,trr_x,mrr_x)-(bbox_right-x);
        hspeed = 0;
    }
    
    //------------------------------------------------------------------
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    //==================================================================
    //                        COLLIDING LEFT
    //==================================================================
    //||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    if ((bbox_left >= max(tll_x,bll_x,mll_x)) || (object_get_name(argument0) == "object_dungeon_slope_left")) {
        if ((point_distance(bbox_left,y,max(bll_x,tll_x,mll_x),y)*-1) > hspeed) {
            // Going up slope
            yplus = 0
            while (collision_point(bbox_left + hspeed,bbox_bottom - yplus,argument0,true,true) && yplus <= abs(1 * hspeed) ) {
               yplus +=1
            }
            if yplus > abs(1 * hspeed) {
                x=max(bll_x,tll_x,mll_x)+(x-bbox_left);
                hspeed = 0;
            } else if (jump == false) {
                y -= yplus
                vspeed = 0
            }
        } else {
            //
        }
    } else if !(object_get_name(argument0) == "object_dungeon_slope_left") {
        x=max(bll_x,tll_x,mll_x)+(x-bbox_left);
        hspeed = 0;
    }
    
    //=================
    // GOING DOWN SLOPE
    //=================
    //|||||||||||||||||
    
    // Going down slope - Not very scalable, might have to do for each sloped object
    if ((object_get_name(argument0) == "object_dungeon_slope_left") && (D == "rig")) {
        if (!collision_point(bbox_left + hspeed,bbox_bottom + 1,argument0,true,true) && collision_point(bbox_left,bbox_bottom + 1,argument0,true,true)) {
            yminus = 0
            while (place_free(x + hspeed,y + yminus + 1) && yminus <= abs(1 * hspeed)) {
                yminus +=1
            }
            //show_message(yminus)
            if yminus <= abs(1 * hspeed) && (jump == false) {
                y += yminus
                vspeed = 0
            }
        }
    } else {
        // Going down slope - Not very scalable, might have to do for each sloped object
        if ((object_get_name(argument0) == "object_dungeon_slope_right") && (D == "lef")) {
            if (!collision_point(bbox_right + hspeed,bbox_bottom + 1,argument0,true,true) && collision_point(bbox_right,bbox_bottom + 1,argument0,true,true)) {//(place_meeting(bbox_left,bbox_bottom + 1,object_dungeon_slope)) && 
                yminus = 0
                while (place_free(x + hspeed,y + yminus + 1) && yminus <= abs(1 * hspeed)) {
                    yminus +=1
                }
                //show_message(yminus)
                if yminus <= abs(1 * hspeed) && (jump == false) {
                    y += yminus
                    vspeed = 0
                }
            }
        }
    }
    
    //------------------------------------------------------------------
    
    // Correction in case of collision into wall
    if ((object_get_name(argument0) != "object_dungeon_slope_left") && (object_get_name(argument0) != "object_dungeon_slope_right")) {
        while (collision_point(bbox_right,bbox_top,argument0,true,true)) {
            x -= 1
        }
        while (collision_point(bbox_left,bbox_bottom,argument0,true,true)) {
            x += 1
        }
        while (collision_point(bbox_right,bbox_bottom,argument0,true,true)) {
            y -= 1
        }
        while (collision_point(bbox_left,bbox_top,argument0,true,true)) {
            y += 1
        }
    }
    while (collision_point(bbox_right,y,argument0,true,true)) {
        x -= 1
    }
    while (collision_point(bbox_left,y,argument0,true,true)) {
        x += 1
    }

}

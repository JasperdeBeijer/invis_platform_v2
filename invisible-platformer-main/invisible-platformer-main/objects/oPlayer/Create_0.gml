// This code executes only once, when an object is made

hsp = 0;	  // Horizontal speed
vsp = 0;	  // Vertical speed
grv = 0.6;	  // Gravity
walksp = 8;	  // Walk speed
jumpsp = -14; // Jump speed (must be negative) 
coyote_time = 0;          // Tracks the frames since the player was last on the ground
coyote_time_max = 2;      // Maximum frames allowed for coyote time

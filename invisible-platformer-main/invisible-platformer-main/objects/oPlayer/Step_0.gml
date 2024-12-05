// This code executes every frame

// Get player input
is_left_key_pressed = keyboard_check(vk_left) or keyboard_check(ord("A"));
is_right_key_pressed = keyboard_check(vk_right) or keyboard_check(ord("D"));
is_jump_key_pressed = keyboard_check(vk_up) or keyboard_check(vk_space) or keyboard_check(ord("W"));
is_down_key_pressed = keyboard_check(vk_down) or keyboard_check(ord("S")) or keyboard_check(vk_shift);

// Constants for acceleration and deceleration
var acceleration = 3;   // How quickly the player accelerates
var deceleration = 1.1;   // How quickly the player decelerates

// Calculate movement input
var move = is_right_key_pressed - is_left_key_pressed;

// Horizontal movement
if (move != 0) {
    // Accelerate towards the direction of input
    hsp += move * acceleration;
    
    // Clamp horizontal speed to the maximum walk speed
    if (hsp > walksp) hsp = walksp;
    if (hsp < -walksp) hsp = -walksp;
} else {
    // Decelerate when no input is given
    if (hsp > 0) {
        hsp = max(0, hsp - deceleration);
    } else if (hsp < 0) {
        hsp = min(0, hsp + deceleration);
    }
}

// Gravity
if (!place_meeting(x, y + vsp, oWall) && is_down_key_pressed) {
    vsp = vsp + grv * 10;
} else {
    vsp = vsp + grv;
}

// Check if the player is grounded
var is_grounded = place_meeting(x, y + 1, oWall);

// Update coyote time
if (is_grounded) {
    coyote_time = coyote_time_max;  // Reset coyote time when on the ground
} else if (coyote_time > 0) {
    coyote_time--;  // Decrease coyote time if not grounded
}

// Jumping with coyote time
if (is_jump_key_pressed && coyote_time > 0) {
    vsp = jumpsp;
    coyote_time = 0;  // Consume coyote time on jump
}

// Horizontal wall collision
if (place_meeting(x + hsp, y, oWall)) {
    while (!place_meeting(x + sign(hsp), y, oWall)) {
        x = x + sign(hsp);
    }

    hsp = 0;
}
x = x + hsp;

// Vertical wall collision
if (place_meeting(x, y + vsp, oWall)) {
    while (!place_meeting(x, y + sign(vsp), oWall)) {
        y = y + sign(vsp);
    }

    vsp = 0;
}
y = y + vsp;
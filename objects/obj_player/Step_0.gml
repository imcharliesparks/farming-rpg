/// @description Collision System
leftKeyboardInput = keyboard_check(vk_left) 
rightKeyboardInput = keyboard_check(vk_right)
upKeyboardInput = keyboard_check(vk_up)
downKeyboardInput = keyboard_check(vk_down)
controlKeyboardInput = keyboard_check(vk_control)
shiftKeyboardInput = keyboard_check(vk_shift)

if (controlKeyboardInput) spd = walkingSpeed
else if (shiftKeyboardInput) spd = runningSpeed
else spd = normalSpeed

// Reset Movement Variables (how far we want to move)
moveX = 0
moveY = 0

// Intended Movement
moveX = (rightKeyboardInput - leftKeyboardInput) * spd
moveY = (downKeyboardInput - upKeyboardInput) * spd

// Collision Checks
// Horizontal Check
if (moveX != 0) {
	if (place_meeting(x + moveX, y, obj_collision)) {
		repeat(abs(moveX)){
			if (!place_meeting(x + sign(moveX), y, obj_collision)) x += sign(moveX)	
			else break
		}
		moveX = 0
	}
}


// Vertical Check
if (moveY != 0) {
	if (place_meeting(x, y + moveY, obj_collision)) {
		repeat(abs(moveY)){
			if (!place_meeting(x, y + sign(moveY), obj_collision)) y += sign(moveY)	
			else break
		}
		moveY = 0
	}	
}

// Applying movement
x += moveX
y += moveY
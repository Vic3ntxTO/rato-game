var _nextRoom = other.nextRoom;
var _newX = other.newX;
var _newY = other.newY;

if (_nextRoom != noone)
{
	room_goto(_nextRoom);
	x = _newX;
	y = _newY;
	other.canCreate = false;
}

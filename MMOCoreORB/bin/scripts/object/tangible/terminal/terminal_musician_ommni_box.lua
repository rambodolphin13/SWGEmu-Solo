-- Custom musician-controlled omni box jukebox test object.
--
-- Goal:
-- Look like an omni box, but behave like a jukebox/server music source.
--
-- This uses the omni box shared client template for appearance:
-- object/tangible/instrument/shared_ommni_box.iff
--
-- But declares the jukebox game object type and active_area child like terminal_jukebox.lua.
-- If Core3 instantiates Jukebox behavior by gameObjectType, this should cast as Jukebox.
-- If Core3 instantiates Jukebox behavior only by the stock terminal_jukebox.iff path,
-- this will appear but not work as a Jukebox.

object_tangible_terminal_terminal_musician_ommni_box = object_tangible_instrument_shared_ommni_box:new {
	gameObjectType = 16408,

	childObjects = {
		{templateFile = "object/active_area.iff", x = 0, z = 0, y = 0, ox = 0, oy = 0, oz = 0, ow = 0, cellid = -1, containmentType = -1},
	},

	noTrade = 1,
	targetable = 1
}

ObjectTemplates:addTemplate(object_tangible_terminal_terminal_musician_ommni_box, "object/tangible/terminal/terminal_musician_ommni_box.iff")

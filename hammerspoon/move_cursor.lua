--[[
Hammerspoon Script for Cursor Movement

This script uses Hammerspoon to automatically move the cursor to the top-left corner of the screen when specific applications gain focus. The script is particularly useful for avoiding unwanted hover actions in these applications.

Configuration:
- moveCursorToCorner(): Function that moves the cursor to the top-left corner of the screen. It uses Hammerspoon's mouse module to set the absolute position of the mouse cursor.
- applicationWatcher(): Function that handles application focus change events. It watches for when an application gains focus (event type 'activated').
- appWatcher: An instance of hs.application.watcher that monitors application focus changes and triggers the cursor movement for the specified applications.

Current Behavior:
- The script is configured to move the cursor when focusing on the application "Alacritty".
- This can be useful for scenarios where entering specific applications requires the cursor to be in a neutral position.

Usage:
- Modify the appName condition in applicationWatcher() to change the monitored application.
- Start Hammerspoon or reload the configuration to apply changes.

Note: The script triggers the cursor movement when refocusing the monitored application, not when leaving it.
]]

-- Function to move the cursor to the top-left corner of the screen
function moveCursorToCorner()
  -- Set the absolute position of the mouse cursor using Hammerspoon's mouse module
  -- hs.geometry.point(0, 0) specifies the top-left corner of the screen
  hs.mouse.absolutePosition(hs.geometry.point(0, 0))
end

-- Function to handle application focus change events
function applicationWatcher(appName, eventType, appObject)
  -- Check if the event type is 'activated', which means an app has gained focus
  if eventType == hs.application.watcher.activated then
    -- Check if the focused application is the following
    if appName == "Alacritty" then
      -- Call the function to move the cursor to the top-left corner
      moveCursorToCorner()
    end
  end
end

-- Create a new application watcher
-- This watcher runs the 'applicationWatcher' function whenever an application focus change event occurs
appWatcher = hs.application.watcher.new(applicationWatcher)

-- Start the application watcher
-- This makes the watcher begin listening for application focus change events
appWatcher:start()

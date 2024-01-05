--[[
Hammerspoon Script for Cursor Movement

Note: The script triggers the cursor movement when refocusing the monitored applications, not when leaving them.

This script uses Hammerspoon to automatically move the cursor to the top-left corner of the screen based on application focus changes:
- Focuses on specific applications (Google Chrome, YouTube).
- When switching back to these applications, it moves the cursor to the top-left corner.
- This can be useful for avoiding unwanted hover actions in these applications.

Configuration:
- lastFocusedApp: Stores the name of the last application that was in focus.
- moveCursorToCorner(): Function that moves the cursor to the top-left corner of the screen.
- applicationWatcher(): Watches for application focus changes.
  - If switching back to a monitored application (Chrome or YouTube), triggers cursor movement.
- appWatcher: Starts the application watcher.

Usage:
- Update the conditions within applicationWatcher() to change monitored applications.
- Start Hammerspoon or reload the configuration for changes to take effect.

]]

-- Variable to store the name of the last focused application
lastFocusedApp = nil

-- Function to move the cursor to the top-left corner of the screen
function moveCursorToCorner()
  hs.mouse.absolutePosition(hs.geometry.point(0, 0))
end

-- Function to handle application focus change events
function applicationWatcher(appName, eventType, appObject)
  -- Check if the event type is 'activated', which means an app has gained focus
  if eventType == hs.application.watcher.activated then
    -- Check if the last focused application was either Google Chrome or YouTube
    if lastFocusedApp == "Google Chrome" or lastFocusedApp == "YouTube" then
      -- Call the function to move the cursor to the top-left corner
      moveCursorToCorner()
    end
    -- Update the last focused application
    lastFocusedApp = appName
  end
end

-- Create a new application watcher
appWatcher = hs.application.watcher.new(applicationWatcher)

-- Start the application watcher
appWatcher:start()

-------------------------------------------------------------------------------------------------------------------

-- -- Function to move the cursor to the top-left corner of the screen
-- function moveCursorToCorner()
--   -- Set the absolute position of the mouse cursor using Hammerspoon's mouse module
--   -- hs.geometry.point(0, 0) specifies the top-left corner of the screen
--   hs.mouse.absolutePosition(hs.geometry.point(0, 0))
-- end
--
-- -- Function to handle application focus change events
-- function applicationWatcher(appName, eventType, appObject)
--   -- Check if the event type is 'activated', which means an app has gained focus
--   if eventType == hs.application.watcher.activated then
--     -- Check if the focused application is the following
--     if appName == "Alacritty" then
--       -- Call the function to move the cursor to the top-left corner
--       moveCursorToCorner()
--     end
--   end
-- end
--
-- -- Create a new application watcher
-- -- This watcher runs the 'applicationWatcher' function whenever an application focus change event occurs
-- appWatcher = hs.application.watcher.new(applicationWatcher)
--
-- -- Start the application watcher
-- -- This makes the watcher begin listening for application focus change events
-- appWatcher:start()

---

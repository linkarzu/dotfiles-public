--[[
Hammerspoon Script for Escape Key Automation

This script uses Hammerspoon to automatically press the Escape key when switching to specific applications. It is designed to enhance workflow efficiency, particularly in web browsers or other applications where pressing Escape can reset the state or close modal dialogs.

Key Features:
- Automatically presses the Escape key upon focusing on certain applications.
- Targeted applications: Google Chrome, Safari, and YouTube.
- Utilizes Hammerspoon's application watcher to monitor application focus changes.

How it Works:
- When an application gains focus (event type 'activated'), the script checks if it's one of the specified applications.
- If the focused application is Google Chrome, Safari, or YouTube, the script simulates an Escape key press.

Usage:
- To modify the list of targeted applications, update the appName conditions in the applicationWatcher() function.
- After making changes, reload the Hammerspoon configuration to apply them.

Note: This script is particularly useful for scenarios where entering specific applications requires triggering an Escape key action, such as closing pop-ups or exiting full-screen mode in browsers.

Author: [Your Name]
Date: [Date of Creation/Modification]
]]

-- Function to simulate pressing the Escape key
function pressEscapeKey()
  hs.eventtap.keyStroke({}, "escape")
end

-- Function to handle application focus change events
function applicationWatcher(appName, eventType, appObject)
  -- Check if the event type is 'activated', which means an app has gained focus
  if eventType == hs.application.watcher.activated then
    -- Check if the currently focused application is Google Chrome, Safari, or YouTube
    if appName == "Google Chrome" or appName == "Safari" or appName == "YouTube" then
      -- Simulate pressing the Escape key
      pressEscapeKey()
    end
  end
end

-- Create a new application watcher
appWatcher = hs.application.watcher.new(applicationWatcher)

-- Start the application watcher
appWatcher:start()

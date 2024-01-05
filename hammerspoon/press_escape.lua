--[[
Hammerspoon Script for Escape Key Simulation

Note: The script triggers the Escape key action when refocusing the monitored applications.

This script uses Hammerspoon to simulate pressing the Escape key based on application focus changes:
- Monitors specified applications (Google Chrome, Safari, YouTube, etc.).
- When switching back to these monitored applications, it simulates an Escape key press.
- Useful for resetting state or closing modals in web browsers or other applications.

Configuration:
- appsToMonitor: Table of application names to monitor.
- monitorAllApps: Boolean flag to switch monitoring behavior.
   - true: Monitors all applications.
   - false: Monitors only specified applications in appsToMonitor.
- pressEscapeKey(): Function that simulates pressing the Escape key.
- applicationWatcher(): Watches for application focus changes and triggers Escape key press.
- appWatcher: Starts the application watcher.

Usage:
- Toggle monitorAllApps to switch between monitoring all applications or specific ones.
- Modify appsToMonitor to add or remove applications from the monitoring list.
- Reload Hammerspoon configuration for changes to take effect.

]]

-- Variable to store the name of the last focused application
lastFocusedApp = nil

-- The monitorAllApps variable is a boolean flag.
-- Set it to true to monitor all applications, or false to monitor only the specified applications.
local monitorAllApps = false

-- Table containing the list of applications to monitor
local appsToMonitor = {
  ["Google Chrome"] = true,
  ["Safari"] = true,
  ["YouTube"] = true,
  -- Add more applications as needed
}

-- Function to simulate pressing the Escape key
function pressEscapeKey()
  hs.eventtap.keyStroke({}, "escape")
end

-- Function to handle application focus change events
function applicationWatcher(appName, eventType, appObject)
  -- Check if the event type is 'activated', which means an app has gained focus
  if eventType == hs.application.watcher.activated then
    -- The if condition in applicationWatcher checks if either monitorAllApps is true
    -- or if lastFocusedApp is in the appsToMonitor table
    if monitorAllApps or appsToMonitor[lastFocusedApp] then
      -- Simulate pressing the Escape key
      pressEscapeKey()
    end
    -- Update the last focused application
    lastFocusedApp = appName
  end
end

-- Create a new application watcher
appWatcher = hs.application.watcher.new(applicationWatcher)

-- Start the application watcher
appWatcher:start()

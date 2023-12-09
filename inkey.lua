local SDL = require("SDL")

-- Initialize SDL
SDL.init(SDL.flags.Video)

-- Create a window
local window = SDL.createWindow({
    title = "Non-Blocking Input with SDL",
    width = 800,
    height = 600,
    resizable = true
})

-- Create a renderer
local renderer = SDL.createRenderer(window, -1, SDL.rendererFlags.Accelerated)

-- Main loop
local quit = false

while not quit do
    -- Handle events
    local event = SDL.pollEvent()
    while event do
        if event.type == SDL.eventType.Quit then
            quit = true
        elseif event.type == SDL.eventType.KeyDown then
            print("Key pressed:", event.key.keysym.sym)
        end
        event = SDL.pollEvent()  -- Check for more events
    end

    -- Your game or application logic goes here

    -- Render something (replace this with your rendering code)
    SDL.renderClear(renderer)
    SDL.renderPresent(renderer)

    -- Add a short delay to avoid high CPU usage (adjust as needed)
    SDL.delay(10)
end

-- Clean up and quit
SDL.destroyRenderer(renderer)
SDL.destroyWindow(window)
SDL.quit()

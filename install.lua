-- Installer
local downloader_code = [[
-- This is the source code for picodl.
-- Only edit if you know what you're doing.
-- Otherwise, enjoy editing your code!
-- Usage: picodl "download URL" "base file name" "file extension"
local args = env().argv or {}
local url = args[1] or ""
local baseName = args[2] or ""
local ext = args[3] or ""
local ver = "1"


if url == "" or baseName == "" or ext == "" then
  print("Usage: picodl \"<download URL>\" \"base file name\" \"file extension\"")
  return
end

if ext:sub(1,1) ~= "." then ext = "." .. ext end
local fileName = baseName .. ext
-- Save the file to /desktop (i.e. root/Desktop).
local fullPath = "/desktop/" .. fileName

print("Downloading from: " .. url)
local data = fetch(url)
if not data then
  print("Download failed for URL: " .. url)
  return
end

store(fullPath, data, {})
print("Download complete! File saved as: " .. fullPath)
]]

-- Ensure the system util folder exists.
mkdir("/appdata/system/util")

-- Install the downloader command by storing it into /appdata/system/util as "picodl.lua".
store("/appdata/system/util/picodl.lua", downloader_code, {})

print("Installation complete! The downloader command 'picodl' has been installed.")
print("You can now run it from the terminal as:")
print('  picodl "download URL" "base file name" "file extension"')


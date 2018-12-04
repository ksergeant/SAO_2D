local player = {}
local playerTileSheet = require("Tilesheet")

player.images = {}
player.imgCurrent = 1
player.line = 1
player.column = 1

player.x = 150
player.y = 230
player.angle = 0
player.speed = 300
player.vx = 0
player.vy = 0
player.uniteC = 6
player.uniteVol = 3
player.energie = 100
player.bouclier = 50
player.engineOn = false


function player.Load(dt)
  playerTileSheet.Load()
  player.images[1] = playerTileSheet.TileTextures[1]
  player.images[2] = playerTileSheet.TileTextures[2]
  player.images[3] = playerTileSheet.TileTextures[3]
  player.images[4] = playerTileSheet.TileTextures[13]
  player.images[5] = playerTileSheet.TileTextures[14]
  player.images[6] = playerTileSheet.TileTextures[15]
  player.images[7] = playerTileSheet.TileTextures[25]
  player.images[8] = playerTileSheet.TileTextures[26]
  player.images[9] = playerTileSheet.TileTextures[27]
  player.images[10] = playerTileSheet.TileTextures[37]
  player.images[11] = playerTileSheet.TileTextures[38]
  player.images[12] = playerTileSheet.TileTextures[39]
 
end

function player.Update(dt)
end

function player.Draw(dt)
end

return player
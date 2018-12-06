local kirito = {}
local kiritoTileSheet = require("Tilesheet")
local kiritoTileSheetFace = require("TileSheetFace")

kirito.images = {}
kirito.imgCurrent = 1
kirito.line = 1
kirito.column = 1

kirito.gui = love.graphics.newImage("GUI/StatusBar.png")
kirito.nom ="Kirito"
kirito.x = 500
kirito.y = 230
kirito.angle = 0
kirito.speed = 300
kirito.vx = 0
kirito.vy = 0
kirito.uniteC = 6
kirito.uniteVol = 3
kirito.energie = 100
kirito.bouclier = 50
kirito.engineOn = false
kirito.imageFace = {}


function kirito.Load(dt)
  kiritoTileSheet.Load()
  kiritoTileSheetFace.Load()
  
  kirito.images[1] = kiritoTileSheet.TileTextures[1]
  kirito.images[2] = kiritoTileSheet.TileTextures[2]
  kirito.images[3] = kiritoTileSheet.TileTextures[3]
  kirito.images[4] = kiritoTileSheet.TileTextures[13]
  kirito.images[5] = kiritoTileSheet.TileTextures[14]
  kirito.images[6] = kiritoTileSheet.TileTextures[15]
  kirito.images[7] = kiritoTileSheet.TileTextures[25]
  kirito.images[8] = kiritoTileSheet.TileTextures[26]
  kirito.images[9] = kiritoTileSheet.TileTextures[27]
  kirito.images[10] = kiritoTileSheet.TileTextures[37]
  kirito.images[11] = kiritoTileSheet.TileTextures[38]
  kirito.images[12] = kiritoTileSheet.TileTextures[39]
  
  kirito.imageFace[1] = kiritoTileSheetFace.TileTextures[1]
 
end

function kirito.Update(dt)
end

function kirito.Draw(dt)
end

return kirito
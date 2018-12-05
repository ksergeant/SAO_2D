local asuna = {}
local asunaTileSheet = require("Tilesheet")
local asunaTileSheetFace = require("TileSheetFace")

asuna.images = {}
asuna.imgCurrent = 1
asuna.line = 1
asuna.column = 1

asuna.x = 120
asuna.y = 280
asuna.angle = 0
asuna.speed = 300
asuna.vx = 0
asuna.vy = 0
asuna.uniteC = 6
asuna.uniteVol = 3
asuna.energie = 100
asuna.bouclier = 50
asuna.engineOn = false
asuna.imageFace = {}


function asuna.Load(dt)
  asunaTileSheet.Load()
  asunaTileSheetFace.Load()
  asuna.images[1] = asunaTileSheet.TileTextures[49]
  asuna.images[2] = asunaTileSheet.TileTextures[50]
  asuna.images[3] = asunaTileSheet.TileTextures[51]
  asuna.images[4] = asunaTileSheet.TileTextures[61]
  asuna.images[5] = asunaTileSheet.TileTextures[62]
  asuna.images[6] = asunaTileSheet.TileTextures[63]
  asuna.images[7] = asunaTileSheet.TileTextures[73]
  asuna.images[8] = asunaTileSheet.TileTextures[74]
  asuna.images[9] = asunaTileSheet.TileTextures[75]
  asuna.images[10] = asunaTileSheet.TileTextures[85]
  asuna.images[11] = asunaTileSheet.TileTextures[86]
  asuna.images[12] = asunaTileSheet.TileTextures[87]
  asuna.imageFace[1] = asunaTileSheetFace.TileTextures[2]

end

function asuna.Update(dt)
end

function asuna.Draw(dt)
end

return asuna
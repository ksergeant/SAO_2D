local bot = {}

local botTileSheet = require("Tilesheet")

bot.images = {}
bot.imgCurrent = 1
bot.line = 1
bot.column = 1

bot.x = 500
bot.y = 230
bot.angle = 0
bot.speed = 300
bot.vx = 0
bot.vy = 0
bot.uniteC = 6
bot.uniteVol = 3
bot.energie = 100
bot.bouclier = 50
bot.engineOn = false


function bot.Load(dt)
  botTileSheet.Load()
  bot.images[1] = botTileSheet.TileTextures[49]
  bot.images[2] = botTileSheet.TileTextures[50]
  bot.images[3] = botTileSheet.TileTextures[51]
  bot.images[4] = botTileSheet.TileTextures[61]
  bot.images[5] = botTileSheet.TileTextures[62]
  bot.images[6] = botTileSheet.TileTextures[63]
  bot.images[7] = botTileSheet.TileTextures[73]
  bot.images[8] = botTileSheet.TileTextures[74]
  bot.images[9] = botTileSheet.TileTextures[75]
  bot.images[10] = botTileSheet.TileTextures[85]
  bot.images[11] = botTileSheet.TileTextures[86]
  bot.images[12] = botTileSheet.TileTextures[87]
 

end

function bot.Update(dt)
end

function bot.Draw(dt)
end

return bot
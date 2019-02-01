local kirito = {}
local kiritoTileSheet = require("Tilesheet")
local kiritoTileSheetFace = require("TileSheetFace")
local kiritoTileSheetCurseur = require("TileSheetCurseur")

kirito.images = {}
kirito.imgCurrent = 1
kirito.line = 1
kirito.column = 1

kirito.barreDeVieVide = love.graphics.newImage("GUI/StatusBarVideFinal.png")
kirito.barreDeVieVerte = love.graphics.newImage("GUI/StatusBarVert.png")
kirito.barreDeVieJaune = love.graphics.newImage("GUI/StatusBarJaune.png")
kirito.barreDeVieRouge = love.graphics.newImage("GUI/StatusBarRouge.png")

kirito.iconeEtat = love.graphics.newImage("GUI/IconEtat.png")
kirito.boite = love.graphics.newImage("GUI/BoiteDeDialogueFinal2.png")
kirito.barreXp = love.graphics.newImage("rpg-battle-system/HUD/bar/background.png")
kirito.barreXpPleine = love.graphics.newImage("rpg-battle-system/HUD/bar/purple.png")

kirito.nom ="Kirito"
kirito.x = 500
kirito.y = 230
kirito.vieActuelle = 100
kirito.vieMax = 100
kirito.viePourcentage = 100
kirito.niveau = 1
kirito.force = 10
kirito.vitesse = 5
kirito.attaque = 25
kirito.defense = 10

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
kirito.imageCurseur = {}

function kirito.Load(dt)
  kiritoTileSheet.Load()
  kiritoTileSheetFace.Load()
  kiritoTileSheetCurseur.Load()
  
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
  kirito.imageCurseur[1] = kiritoTileSheetCurseur.TileTextures[3]
 
end

function kirito.Update(dt)
end

function kirito.Draw(dt)
end

return kirito
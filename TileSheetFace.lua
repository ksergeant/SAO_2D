local TileSheetFace= {}
local MAP_WIDTH = 12
local MAP_HEIGHT = 8
local TILE_WIDTH = 200
local TILE_HEIGHT = 200

TileSheetFace.Map = {}
TileSheetFace.Map =  {
  
  {1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12},
  {13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24},
  {25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36},
  {37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48}, 
  {49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60},
  {61, 62, 63, 64, 65, 66},
  {73, 74, 75, 76, 77, 78},
  {85, 86, 87, 88, 89, 90},


}

TileSheetFace.TileSheet = {}
TileSheetFace.TileTextures = {}
TileSheetFace.TileTypes = {}

function TileSheetFace.Load()
  print("TileSheet:Chargement des textures...")
  
  TileSheetFace.TileSheet = love.graphics.newImage("images/imageFaceTileSheet.png")
  local nbColumns = TileSheetFace.TileSheet:getWidth() / TILE_WIDTH
  local nbLines = TileSheetFace.TileSheet:getHeight() / TILE_HEIGHT
  local id = 1
  
  TileSheetFace.TileTextures[0] = nil
  for l=1,nbLines do
    for c=1,nbColumns do
      TileSheetFace.TileTextures[id] = love.graphics.newQuad(
        (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT,
        TILE_WIDTH, TILE_HEIGHT, 
        TileSheetFace.TileSheet:getWidth(), TileSheetFace.TileSheet:getHeight()
        )
      id = id + 1
    end
  end
  
  TileSheetFace.TileTypes[1] = "Herbe"
  TileSheetFace.TileTypes[11] = "Grass"

  print("TileSheet:Chargement des textures terminées...")
end

function TileSheetFace.Draw()
  local l,c
  
  for l=1,MAP_HEIGHT do
    for c=1,MAP_WIDTH do
      local id = TileSheetFace.Map[l][c]
      local texQuad = TileSheetFace.TileTextures[id]
      if texQuad ~= nil then
        love.graphics.draw(TileSheetFace.TileSheet, texQuad, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT)
      end
    end
  end
  
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  local c = math.floor(x / TILE_WIDTH) + 1
  local l = math.floor(y / TILE_HEIGHT) + 1
  if l>0 and c>0 and l <= MAP_HEIGHT and c <= MAP_WIDTH then
    local id = TileSheetFace.Map[l][c]
    
    love.graphics.print(
      "Ligne: "..tostring(l)..
      " Colonne: "..tostring(c)..
      " ID: "..tostring(id)..
      " ("..tostring(TileSheetFace.TileTypes[id])..")"
      ,1,733)
    
  end
end

return TileSheetFace

local TileSheet = {}
local MAP_WIDTH = 12
local MAP_HEIGHT = 8
local TILE_WIDTH = 32
local TILE_HEIGHT = 32

TileSheet.Map = {}
TileSheet.Map =  {
  
  {1,  2,  3,  4,  5,  6,  7,  8,  9,  10, 11, 12},
  {13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24},
  {25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36},
  {37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48}, 
  {49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60},
  {61, 62, 63, 64, 65, 66},
  {73, 74, 75, 76, 77, 78},
  {85, 86, 87, 88, 89, 90},


}

TileSheet.TileSheet = {}
TileSheet.TileTextures = {}
TileSheet.TileTypes = {}

function TileSheet.Load()
  print("TileSheet:Chargement des textures...")
  
  TileSheet.TileSheet = love.graphics.newImage("images/perso_tilesheet.png")
  local nbColumns = TileSheet.TileSheet:getWidth() / TILE_WIDTH
  local nbLines = TileSheet.TileSheet:getHeight() / TILE_HEIGHT
  local id = 1
  
  TileSheet.TileTextures[0] = nil
  for l=1,nbLines do
    for c=1,nbColumns do
      TileSheet.TileTextures[id] = love.graphics.newQuad(
        (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT,
        TILE_WIDTH, TILE_HEIGHT, 
        TileSheet.TileSheet:getWidth(), TileSheet.TileSheet:getHeight()
        )
      id = id + 1
    end
  end
  
  TileSheet.TileTypes[1] = "Herbe"
  TileSheet.TileTypes[11] = "Grass"

  print("TileSheet:Chargement des textures terminées...")
end

function TileSheet.Draw()
  local l,c
  
  for l=1,MAP_HEIGHT do
    for c=1,MAP_WIDTH do
      local id = TileSheet.Map[l][c]
      local texQuad = TileSheet.TileTextures[id]
      if texQuad ~= nil then
        love.graphics.draw(TileSheet.TileSheet, texQuad, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT)
      end
    end
  end
  
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  local c = math.floor(x / TILE_WIDTH) + 1
  local l = math.floor(y / TILE_HEIGHT) + 1
  
  if l>0 and c>0 and l <= MAP_HEIGHT and c <= MAP_WIDTH then
    local id = TileSheet.Map[l][c]
    
    love.graphics.print(
      "Ligne: "..tostring(l)..
      " Colonne: "..tostring(c)..
      " ID: "..tostring(id)..
      " ("..tostring(TileSheet.TileTypes[id])..")"
      ,1,733)
    
  end
end

return TileSheet
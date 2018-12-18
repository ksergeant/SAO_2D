local TileSheetCurseur= {}
local MAP_WIDTH = 3
local MAP_HEIGHT = 3
local TILE_WIDTH = 200
local TILE_HEIGHT = 188

TileSheetCurseur.Map = {}
TileSheetCurseur.Map =  {
  
  {1,2,3},
  {4,5,6},
  {7,8,9},
 

}

TileSheetCurseur.TileSheet = {}
TileSheetCurseur.TileTextures = {}
TileSheetCurseur.TileTypes = {}

function TileSheetCurseur.Load()
  print("TileSheet:Chargement des textures...")
  
  TileSheetCurseur.TileSheet = love.graphics.newImage("GUI/Curseur.png")
  local nbColumns = TileSheetCurseur.TileSheet:getWidth() / TILE_WIDTH
  local nbLines = TileSheetCurseur.TileSheet:getHeight() / TILE_HEIGHT
  local id = 1
  
  TileSheetCurseur.TileTextures[0] = nil
  for l=1,nbLines do
    for c=1,nbColumns do
      TileSheetCurseur.TileTextures[id] = love.graphics.newQuad(
        (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT,
        TILE_WIDTH, TILE_HEIGHT, 
        TileSheetCurseur.TileSheet:getWidth(), TileSheetCurseur.TileSheet:getHeight()
        )
      id = id + 1
    end
  end
  
  TileSheetCurseur.TileTypes[1] = "Herbe"
  TileSheetCurseur.TileTypes[11] = "Grass"

  print("TileSheet:Chargement des textures terminées...")
end

function TileSheetCurseur.Draw()
  local l,c
  
  for l=1,MAP_HEIGHT do
    for c=1,MAP_WIDTH do
      local id = TileSheetCurseur.Map[l][c]
      local texQuad = TileSheetCurseur.TileTextures[id]
      if texQuad ~= nil then
        love.graphics.draw(TileSheetCurseur.TileSheet, texQuad, (c-1)*TILE_WIDTH, (l-1)*TILE_HEIGHT)
      end
    end
  end
  
  local x = love.mouse.getX()
  local y = love.mouse.getY()
  local c = math.floor(x / TILE_WIDTH) + 1
  local l = math.floor(y / TILE_HEIGHT) + 1
  if l>0 and c>0 and l <= MAP_HEIGHT and c <= MAP_WIDTH then
    local id = TileSheetCurseur.Map[l][c]
    
    love.graphics.print(
      "Ligne: "..tostring(l)..
      " Colonne: "..tostring(c)..
      " ID: "..tostring(id)..
      " ("..tostring(TileSheetCurseur.TileTypes[id])..")"
      ,1,733)
    
  end
end

return TileSheetCurseur

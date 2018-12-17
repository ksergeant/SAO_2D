-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local myGame = require("Game")
local myTileSheet = require("Tilesheet")
local myTileSheetFace = require("TileSheetFace")

local tableauCommand = "TabCommand :"
local command = "nul"

--local Background = {}


local kirito = require("Kirito")
local asuna = require("Asuna")
local sanglier = require("Sanglier")

bgm = love.audio.newSource("/sons/maintrack.ogg", "stream")
love.audio.play(bgm)

local listeCommand = {}
local sprites = {}
local ListeTirs = {}
local tirs = {}

function CreeSprite(pNomImage, pX, pY)
  
  sprite = {}
  sprite.x = pX
  sprite.y = pY
  sprite.supprime = false
  sprite.image = love.graphics.newImage("images/"..pNomImage..".png")
  sprite.l = sprite.image:getWidth()
  sprite.h = sprite.image:getHeight()
  
  table.insert(sprites, sprite)
  
  return sprite
  
end

function love.load()
love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 15)
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  kirito.Load()
  asuna.Load()
  love.audio.play(bgm)
  
end

function love.update(dt)
  love.audio.play(bgm)
       -- Purge des sprites à supprimer
  for n=#sprites,1,-1 do
    if sprites[n].supprime == true then
      table.remove(sprites,n)
    end
  end

end
  



function love.draw()
  
  
  local n
  for n=1,#sprites do
    
    
    local s = sprites[n]
   -- love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end
  
   
   love.graphics.draw(myGame.Background.img,0,0,0,1,1)
   
   love.graphics.draw(kirito.boite, 0, 470,
      math.rad(kirito.angle), 1, 1)
   
  
   love.graphics.draw(myTileSheet.TileSheet,kirito.images[6], kirito.x, kirito.y, 
      math.rad(kirito.angle), 1.5, 1.5)
  
   love.graphics.draw(myTileSheet.TileSheet,asuna.images[6], asuna.x, asuna.y, 
      math.rad(asuna.angle), 1.5, 1.5)
    
   love.graphics.draw(myTileSheetFace.TileSheet,kirito.imageFace[1], -35, 470, 
      math.rad(kirito.angle), 0.9, 0.9)
    
    --love.graphics.draw(myTileSheetFace.TileSheet,asuna.imageFace[1], 460, 470, 
     -- math.rad(asuna.angle), 0.9, 0.9)
    
    love.graphics.draw(sanglier.image, sanglier.x, sanglier.y, 
      math.rad(sanglier.angle), 0.7, 0.7)
    
    love.graphics.draw(kirito.gui, 135, 490,
      math.rad(kirito.angle), 0.30, 0.30)
    
    love.graphics.draw(kirito.gui2, 237, 507,
    math.rad(kirito.angle), 0.348, 0.348)
  
    love.graphics.draw(kirito.iconeEtat, 122, 504.5,
    math.rad(kirito.angle), 0.35, 0.35)
  
    
    love.graphics.print(kirito.niveau,578,544)
    love.graphics.print(kirito.nom,179,513)
    love.graphics.print(kirito.vieActuelle,443,544)
    love.graphics.print(kirito.vieMax,503,544)

    local sDebug = " Debug:"
    sDebug = sDebug.. " x="..tostring(kirito.x)
    sDebug = sDebug.. " y="..tostring(kirito.y)
    local Tab = "Tab"
    Tab = Tab.. "command="..tostring(command)
    
    --local InfoPlayer = "Player1:"
    --InfoPlayer = InfoPlayer.. "Energie="..tostring(myPlayer.energie)
    --InfoPlayer = InfoPlayer.. " Bouclier=" ..tostring(myPlayer.bouclier)
    --InfoPlayer = InfoPlayer.. " UC="..tostring(myPlayer.uniteC)
    --InfoPlayer = InfoPlayer.. " UV="..tostring(myPlayer.uniteVol)

   love.graphics.setColor(1,0,0,100)
   love.graphics.print("Combat Scene",(largeur/2)-40, 10)
   love.graphics.setColor(255,255,255,100)

    

    --love.graphics.print(sDebug,0,0)
    --love.graphics.print(InfoPlayer, 200, 10)
    --love.graphics.print(Tab,815, 30)
    
    
    
   -- love.graphics.rectangle("fill", 752, 450, 250,50)
   -- love.graphics.setColor(1,0,0,100)
   -- love.graphics.print("Lancement",842, 470)
   -- love.graphics.setColor(255,255,255,100)
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then 
      
   end
end
 
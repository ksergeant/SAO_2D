-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local myGame = require("Game")
local myTileSheet = require("Tilesheet")

local tableauCommand = "TabCommand :"
local command = "nul"

--local Background = {}


local myPlayer = require("Player")
local myBot = require("bot")

bgm = love.audio.newSource("/sons/Fight1.ogg", "stream")
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

  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  myPlayer.Load()
  myBot.Load()
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
    love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end
  
   
   love.graphics.draw(myGame.Background.img,0,0)
   
  
   love.graphics.draw(myTileSheet.TileSheet,myPlayer.images[9], myPlayer.x, myPlayer.y, 
      math.rad(myPlayer.angle), 1.3, 1.3)
    
    love.graphics.draw(myTileSheet.TileSheet,myBot.images[4], myBot.x, myBot.y, 
      math.rad(myBot.angle), 1.3, 1.3)
    
    local sDebug = " Debug:"
    sDebug = sDebug.. " x="..tostring(myPlayer.x)
    sDebug = sDebug.. " y="..tostring(myPlayer.y)
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
      myPlayer.x = x
      myPlayer.y = y
   end
end



function love.keypressed(key)
  
  if key == "up" then
    myPlayer.y =  myPlayer.y - 50
    
      if myPlayer.y < 50 then
         myPlayer.y = 75
      end
    
    myPlayer.angle = 360
    command = "up"
    print(key)
  end

  if key == "down" then
    myPlayer.y =  Player.y + 50
    if myPlayer.y > 450 then
       myPlayer.y = 475
    end
    
    myPlayer.angle = 180
    
    command = "down"
    print(key)
  end

  if key == "left" then
    myPlayer.x =  Player.x - 50
    if myPlayer.x < 50 then
       myPlayer.x = 75
    end
    
    myPlayer.angle = 270

    command = "left"
    print(key)
  end

  if key == "right" then
    myPlayer.x =  myPlayer.x + 50
    if myPlayer.x > 700 then
       myPlayer.x = 725
    end
    
    myPlayer.angle = 90
    
    command = "right"
    print(key)
  end

  if key == "space" then
    
    
  end

end  
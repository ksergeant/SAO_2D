-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées

-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local myGame = require("Game")
local myTileSheet = require("Tilesheet")

local tableauCommand = "TabCommand :"
local command = "nul"

--local Background = {}


local Player = {}
Player.x = 0
Player.y = 0
Player.angle = 90
Player.speed = 300
Player.vx = 0
Player.vy = 0
Player.uniteC = 6
Player.uniteVol = 3
Player.energie = 100
Player.bouclier = 50
Player.engineOn = false
Player.img = love.graphics.newImage("images/Ship1_blue.png")


bgm = love.audio.newSource("/sons/mainTrack.ogg", "stream")
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
  myTileSheet.Load()
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
   
  
   love.graphics.draw(Player.img, Player.x, Player.y, 
      math.rad(Player.angle), 1, 1, Player.img:getWidth()/2, Player.img:getHeight()/2)
    
    local sDebug = " Debug:"
    sDebug = sDebug.. " x="..tostring(Player.x)
    sDebug = sDebug.. " y="..tostring(Player.y)
    local Tab = "Tab"
    Tab = Tab.. "command="..tostring(command)
    
    local InfoPlayer = "Player1:"
    InfoPlayer = InfoPlayer.. "Energie="..tostring(Player.energie)
    InfoPlayer = InfoPlayer.. " Bouclier=" ..tostring(Player.bouclier)
    InfoPlayer = InfoPlayer.. " UC="..tostring(Player.uniteC)
    InfoPlayer = InfoPlayer.. " UV="..tostring(Player.uniteVol)

   love.graphics.setColor(1,0,0,100)
   love.graphics.print("Combat Scene",(largeur/2)-40, 10)
  love.graphics.setColor(255,255,255,100)

    

    love.graphics.print(sDebug,0,0)
    love.graphics.print(InfoPlayer, 200, 10)
    love.graphics.print(Tab,815, 30)
    
    myTileSheet.Draw()
    
   -- love.graphics.rectangle("fill", 752, 450, 250,50)
   -- love.graphics.setColor(1,0,0,100)
   -- love.graphics.print("Lancement",842, 470)
   -- love.graphics.setColor(255,255,255,100)
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 then 
      Player.x = x
      Player.y = y
   end
end



function love.keypressed(key)
  
  if key == "up" then
    Player.y =  Player.y - 50
    
      if Player.y < 50 then
         Player.y = 75
      end
    
    Player.angle = 360
    command = "up"
    print(key)
  end

  if key == "down" then
    Player.y =  Player.y + 50
    if Player.y > 450 then
       Player.y = 475
    end
    
    Player.angle = 180
    
    command = "down"
    print(key)
  end

  if key == "left" then
    Player.x =  Player.x - 50
    if Player.x < 50 then
       Player.x = 75
    end
    
    Player.angle = 270

    command = "left"
    print(key)
  end

  if key == "right" then
    Player.x =  Player.x + 50
    if Player.x > 700 then
       Player.x = 725
    end
    
    Player.angle = 90
    
    command = "right"
    print(key)
  end

  if key == "space" then
    
    
  end

end  
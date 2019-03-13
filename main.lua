-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")

-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

local myGame = require("Game")
local myTileSheet = require("Tilesheet")
local myTileSheetFace = require("TileSheetFace")
local myTileSheetCurseur = require("TileSheetCurseur")

local ecran_courant = "menu" 
local imgMenu1 = love.graphics.newImage("Menu/EcranMenu1.jpg")
local imgMenu2 = love.graphics.newImage("Menu/EcranMenu2.jpg")
local imgMenu3 = love.graphics.newImage("Menu/EcranMenu3.jpg")
local imgMenu4 = love.graphics.newImage("Menu/EcranMenu4.jpg")
local imgBoutonMenu = love.graphics.newImage("base_pack/PNG/grey_button00.png")
local imgEnteteMenu = love.graphics.newImage("Menu/EnteteImage.png")
local compteurMenu = 0

local tableauCommand = "TabCommand :"
local command = "nul"

--local Background = {}

local kirito = require("Kirito")
local asuna = require("Asuna")
local sanglier = require("Sanglier")

bgm = love.audio.newSource("/sons/maintrack.ogg", "stream")

musiqueMenu = love.audio.newSource("/sons/Menu.ogg", "stream")

local listeCommand = {}
local sprites = {}
local ListeTirs = {}
local tirs = {}
local diffPourcentage = {}
local vitesseAnimation = 0.08
local pourcentagePrecedent = {}
local vieActuelle = {}

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
  
  DemarreJeu()
  
end

function DemarreJeu()
  
  love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 15)
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  kirito.Load()
  asuna.Load()
end

function UpdateJeu(dt)
  
  --love.audio.play(bgm)
       -- Purge des sprites à supprimer
  for n=#sprites,1,-1 do
    if sprites[n].supprime == true then
      table.remove(sprites,n)
    end
  end
    vieActuelle = kirito.viePourcentage

  kirito.viePourcentage = (kirito.vieActuelle * 100) / kirito.vieMax
  
  if kirito.vieActuelle < 0 then
     kirito.vieActuelle = 0
  end
end

function DrawJeu()

  love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 15)
    local n
  for n=1,#sprites do
    
    
    local s = sprites[n]
   -- love.graphics.draw(s.image, s.x, s.y, 0, 2, 2, s.l/2, s.h/2)
  end
  
   -- Background Haut
   love.graphics.draw(myGame.Background.img,0,0,0,1,1)
   
   -- Background Bas
   love.graphics.draw(kirito.boite, 0, 390,
      math.rad(kirito.angle), 1, 1)
   
  -- Kirito combat
   love.graphics.draw(myTileSheet.TileSheet,kirito.images[6], kirito.x, kirito.y, 
      math.rad(kirito.angle), 1.5, 1.5)
  
  -- Asuna combat
   love.graphics.draw(myTileSheet.TileSheet,asuna.images[6], asuna.x, asuna.y, 
      math.rad(asuna.angle), 1.5, 1.5)
    
    -- Portrait Kirito
   love.graphics.draw(myTileSheetFace.TileSheet,kirito.imageFace[1], -35, 380, 
      math.rad(kirito.angle), 0.9, 0.9)
    
    --love.graphics.draw(myTileSheetFace.TileSheet,asuna.imageFace[1], 460, 470, 
     -- math.rad(asuna.angle), 0.9, 0.9)
    
    -- Sanglier combat
    love.graphics.draw(sanglier.image, sanglier.x, sanglier.y, 
      math.rad(sanglier.angle), 0.7, 0.7)
    
    -- Barre de vie vide
    love.graphics.draw(kirito.barreDeVieVide, 135, 410,
      math.rad(kirito.angle), 0.30, 0.30)
    
    ----======= ANIMATION BARRE DE VIE ==========
   
    if kirito.viePourcentage < 0 then
      kirito.viePourcentage = 0
    end
    
    if kirito.viePourcentage > 50 then
    -- Barre de vie vert 
      
        local barreVerteValeurPourcentage = math.floor( ( kirito.viePourcentage / 100 ) * 1015)
        
        local barreVerteQuad = love.graphics.newQuad(0 ,0, barreVerteValeurPourcentage, 65, 1015, 65)
        love.graphics.draw(kirito.barreDeVieVerte, barreVerteQuad, 237, 427,
        math.rad(kirito.angle), 0.348, 0.348)
      
    
    else if kirito.viePourcentage < 51 and kirito.viePourcentage > 25 then
  -- Barre de vie jaune 
    local barreJauneValeurPourcentage = (kirito.viePourcentage / 100 ) * 1015
    local barreJauneQuad = love.graphics.newQuad(0, 0, barreJauneValeurPourcentage, 65, 1015, 65)
  
    love.graphics.draw(kirito.barreDeVieJaune, barreJauneQuad, 237, 427,
    math.rad(kirito.angle), 0.348, 0.348)
    
    else
  -- Barre de vie rouge
    local barreRougeValeurPourcentage = (kirito.viePourcentage / 100 ) * 1015
    local barreRougeQuad = love.graphics.newQuad(0, 0, barreRougeValeurPourcentage, 65, 1015, 65)
    
    love.graphics.draw(kirito.barreDeVieRouge, barreRougeQuad, 237, 427,
    math.rad(kirito.angle), 0.348, 0.348)
  
  end 
  
  end
  
    ----======= FIN ANIMATION BARRE DE VIE ==========
  
   -- Barre d'xp vide
   love.graphics.draw(kirito.barreXp, 25, 569,
   math.rad(kirito.angle), 1, 1)
  
  -- Barre d'xp pleine
  love.graphics.draw(kirito.barreXpPleine, 30, 569,
    math.rad(kirito.angle), 1, 1)
  
  -- infos Kirito
    love.graphics.print(math.floor(kirito.viePourcentage).."%", 376,433)
    love.graphics.print(kirito.niveau,578,464)
    love.graphics.print(kirito.nom,179,433)
    love.graphics.print(kirito.vieActuelle,443,464)
    love.graphics.print(kirito.vieMax,503,464)

-- Curseur
love.graphics.draw(myTileSheetCurseur.TileSheet, kirito.imageCurseur[1], 165, 505,
    math.rad(kirito.angle), 0.25,0.25)
love.graphics.draw(myTileSheetCurseur.TileSheet, kirito.imageCurseur[2], kirito.x+3, kirito.y-38,
    math.rad(kirito.angle), 0.20,0.20)
  

love.graphics.print("ATTAQUE", 220,522)
love.graphics.print("INVENTAIRE", 220,580)
love.graphics.print("SWITCH", 490,522)
love.graphics.print("COURRIR", 490,580)

love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 12)
love.graphics.print("XP",1,567)
love.graphics.print("ATT",40,587)
love.graphics.print("DEF",40,607)
love.graphics.print("VIT",40,627)

love.graphics.print(tostring(kirito.attaque),85,587)
love.graphics.print(tostring(kirito.defense),85,607)
love.graphics.print(tostring(kirito.vitesse),85,627)
    local sDebug = " Debug:"
    sDebug = sDebug.. " x="..tostring(kirito.x)
    sDebug = sDebug.. " y="..tostring(kirito.y)
    local Tab = "Tab"
    Tab = Tab.. "command="..tostring(command)
    love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 15)

    
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

function UpdateMenu(dt)
  
  -- compteur pour l'animation du selecteur du menu
  compteurMenu = compteurMenu + (7.2 * dt)
    if math.floor(compteurMenu) > 1 then
      compteurMenu = 0
    end
    
end

function DrawMenu()
  --love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 40)
  love.audio.play(musiqueMenu)
  
  local r,g,b = love.graphics.getColor() 
  
  love.graphics.setNewFont(40) 
  love.graphics.draw(imgMenu4,0,0) -- Image du menu 
  love.graphics.draw(imgEnteteMenu,130, 60, 0, 0.5, 0.5);
  
  love.graphics.setColor(255, 255, 255) -- Blanc
  --love.graphics.print("MENU PRINCIPAL", 170, 150)
  love.graphics.setColor(255, 255, 255) -- Blanc
  --love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 22)
  love.graphics.setNewFont(22)
  
  love.graphics.draw(imgBoutonMenu, 20, 270) -- Bouton Combat
  love.graphics.setColor(0.8, 0, 0) -- Rouge
  love.graphics.print("COMBAT", 68, 279)
  love.graphics.setColor(255, 255, 255) -- Blanc
  
  love.graphics.draw(imgBoutonMenu, 225, 270) -- Bouton Aventure
  love.graphics.setColor(0.8, 0, 0) -- Rouge
 -- love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 22)
  love.graphics.print("AVENTURE", 261, 279)
  love.graphics.setColor(255, 255, 255) -- Blanc
  
  love.graphics.draw(imgBoutonMenu, 430, 270) -- Bouton Quitter
  love.graphics.setColor(0.8, 0, 0) -- Rouge
 -- love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 22)
  love.graphics.print("QUITTER", 477, 279)
  love.graphics.setColor(255, 255, 255) -- Blanc
  
 -- love.graphics.setNewFont("GUI/Maximilien_Regular.ttf", 20)
  love.graphics.setColor(0.8, 0, 0) -- Rouge
  love.graphics.print("BY MOKS", 530, 600)
  love.graphics.setColor(255, 255, 255) -- Blanc
 
  love.graphics.setLineWidth(5)
  
  -- Animation du selecteur
   if math.floor(compteurMenu) == 0 then 
      love.graphics.setColor(1, 0, 0)
    else
      love.graphics.setColor(1, 1, 0)
    end
  
  love.graphics.rectangle("line",15, 266, 200, 53)
  love.graphics.setColor(r,g,b) 
  

end

function love.update(dt)
  
  if ecran_courant == "jeu" then
    UpdateJeu(dt)
  elseif ecran_courant == "menu" then
    UpdateMenu(dt)
  end

end

function love.draw()
  
  if ecran_courant == "jeu" then
    DrawJeu()
  elseif ecran_courant == "menu" then
    DrawMenu()
  end
  
end

function love.keypressed(key)
  

end

function love.mousepressed(x, y, button, istouch)
  if ecran_courant == "jeu" then
   if button == 1 then 
       sanglier.Attaque(kirito)
    end
  elseif ecran_courant == "menu" then
    if button == 1 then
      ecran_courant = "jeu"
    end
  end
 
end
 
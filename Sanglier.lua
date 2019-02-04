local sanglier = {}

sanglier.image = love.graphics.newImage("rpg-battle-system/monster/boar.png")
sanglier.imgCurrent = 1
sanglier.line = 1
sanglier.column = 1

sanglier.nom ="Sanglier"
sanglier.x = 100
sanglier.y = 200
sanglier.vie = 100
sanglier.mana = 50
sanglier.force = 10
sanglier.defense = 40
sanglier.attaque = 25

sanglier.angle = 0
sanglier.vitesse = 0
sanglier.vx = 0
sanglier.vy = 0


function sanglier.Attaque(cible)
  
  cible.vieActuelle = cible.vieActuelle - sanglier.attaque

end
function sanglier.Load(dt)
  
end

function sanglier.Update(dt)
end

function sanglier.Draw(dt)
end

return sanglier
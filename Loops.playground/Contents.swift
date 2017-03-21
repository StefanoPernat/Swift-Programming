import Cocoa

var myFirstInt: Int = 0
var mySecondInt: Int = 0

for _ in 1...5 {
    myFirstInt += 1
    myFirstInt
    
    // print("myFirstInt equals \(myFirstInt) at iteration \(i)")
    
    print(myFirstInt)
}

//  for-in with where clause
for i in 1...100 where i % 3 == 0 {
    print(i)
}

//  while loop
var i = 1
while i < 6 {
    mySecondInt += 1
    print(mySecondInt)
    i += 1
}

//  Control Tranfer Statement
var shields = 5
var blastersOverheating = false
var blastersFireCount = 0
var spaceDemonsDestroyed = 0

while shields > 0 {
    if spaceDemonsDestroyed == 500 {
        print("You beat the game")
        break
    }
    
    if blastersOverheating {
        print("Blaster are overheated! Cooldown initiated.")
        sleep(5)
        print("Blaster ready to fire")
        sleep(1)
        blastersOverheating = false
        blastersFireCount = 0
    }
    
    if blastersFireCount > 100 {
        blastersOverheating = true
        continue
    }
    
    print("Fire Blasters!")
    blastersFireCount += 1
    spaceDemonsDestroyed += 1
}

import Cocoa

//var bucketList: Array<String> first way to declare an array in Swift

//var bucketList: [String] = ["Climb Mt. Everest"]        //    second way to declare an Array

var bucketList = ["Climb Mt Everest"]                     //    third way to declare an Array, its type is inferred by the Compiler
var newItems = [
    "Fly hot air baloon to Fiji",
    "Watch the Lord of the Rings trilogy in one day",
    "Go on a walkabout",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

//for item in newItems {                                  //    for loop with Collections
//    bucketList.append(item)
//}

bucketList += newItems                                    //    Use of the += operator to add elements to the Array

bucketList.remove(at: 2)
bucketList
print(bucketList.count)
print(bucketList[0...2])
bucketList[2] += " In Australia"
bucketList
bucketList[0] = "Climb Mt Kilimanjaro"
bucketList.insert("Toboggan across Alaska", at: 2)
bucketList

var myronList = [
    "Climb Mt Kilimanjaro",
    "Fly hot air baloon to Fiji",
    "Toboggan across Alaska",
    "Go on a walkabout In Australia",
    "Scuba dive in the Great Blue Hole",
    "Find a triple rainbow"
]

let equal = (bucketList == myronList)                   //  comparing Arrays with == order matters

let launches = [                                        //  immutable array cannot be changed
    "Cheeseburger",
    "Veggie Pizza",
    "Chicken Cesar Salad",
    "Black Bean Burrito",
    "Falafel Wrap"
]


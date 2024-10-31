import UIKit
import Combine


//one way to create a publisher
let myArray = ["1","2","3","4"]
let myPublisher = myArray.publisher

//Other way to create a publisher
let just = Just(["1", "2", "3"])

//Create a suscriber
let cancellable = myPublisher.sink { isFinished in        //This first clousure will be called when all the values ​​of the array are received.
    print("isFinished: \(isFinished)")
} receiveValue: { value in              //This clousure will be called as many times as values ​​we have in the array
    print("value received: \(value)")
}


class YoutubeChannel {
    var numberOfSubscribers: Int = 0
}

let justInteger = Just(222)
let swiftBetaChannel = YoutubeChannel()
//Suscribe to assign value of "justInteger" to propierty "numberOfSuscribers"
justInteger.assign(to: \YoutubeChannel.numberOfSubscribers, on: swiftBetaChannel)
print(justInteger)
swiftBetaChannel.numberOfSubscribers

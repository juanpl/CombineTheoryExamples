//: [Previous](@previous)

import Foundation
import Combine

//let intPublisher = PassthroughSubject <Int, Never>()

[35, 32].publisher
    .map{ value in String(value)}
    .sink { value in
    print ("Value \(value)")
}

/*intPublisher.send(1)
intPublisher.send(2)
intPublisher.send(3)*/



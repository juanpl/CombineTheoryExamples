import Foundation
import Combine

/*struct Weather {
    let weatherPublisher = PassthroughSubject<Int, Error>()
    
    func getWeather() {
        weatherPublisher.send(35)
        weatherPublisher.send(completion: .failure(URLError(.badURL)))
        weatherPublisher.send(32)
    }
}

//suscribe in the publisher
let weather = Weather()
weather.weatherPublisher.sink { completion in
        print("Completion \(completion)")
} receiveValue: { value in
    print("Value: \(value)")
}

weather.getWeather()*/


struct BotApp {
    var onboardingPublisher = CurrentValueSubject<String, Error>("Bienvenidos a SwiftBeta!")
    
    func startOnboarding() {
        onboardingPublisher.send("Crea una conversación con algún contacto")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            onboardingPublisher.send("Envía un Sticker")
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            onboardingPublisher.send("Activa las notificaciones")
        }
    }
}

let botApp = BotApp()
let cancellable = botApp.onboardingPublisher.sink { completion in
    switch completion{
    case .failure(let error):
        print("Error \(error.localizedDescription)")
    case .finished:
        print("Finished")
    }
} receiveValue: { value in
    print("Values: \(value)")
}

botApp.startOnboarding()


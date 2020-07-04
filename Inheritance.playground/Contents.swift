import UIKit


//----------------------------------------------------------------------------------------//
// Defining a base class
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "Traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")


//----------------------------------------------------------------------------------------//
// Subclassing

/*
 syntax -
 
 class SomeSubclass: SomeSuperclass {
 // subclass definition goes here
 }
 */

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicyle = Bicycle()
bicyle.hasBasket = true

bicyle.currentSpeed = 15.0
print("Bicycle: \(bicyle.description)")

class TwoseaterBicycle: Bicycle {
    var currentNumberOfPassanger: Int = 0 {
        didSet {
            if currentNumberOfPassanger > 2 {
                currentNumberOfPassanger = 2
            }
        }
    }
}

let twoSeaterBicyle = TwoseaterBicycle()
twoSeaterBicyle.hasBasket = true
twoSeaterBicyle.currentNumberOfPassanger = 590
twoSeaterBicyle.currentSpeed = 22.0
print("TwoSeaterBicyle: \(twoSeaterBicyle.description) \(twoSeaterBicyle.currentNumberOfPassanger)")

//----------------------------------------------------------------------------------------//

// Overriding - for theory look into documentation
// Overriding Methods

class Train: Vehicle {
    override func makeNoise() {
        print("cho cho")
    }
}

let train = Train()
train.makeNoise()

// Overriding Properties

class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

// Overriding Property Observers

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

//Preventing overriding

// you can prevent a method, property, or subscript form being overridden by marking it as final. Do this by writting the final before the method, property, or subscript's (such as final var, final func, final class, final subscript)

// You can mark an entire class as final by writing the final modifier before the class keyword in its class definition (final class).

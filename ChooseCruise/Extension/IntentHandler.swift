//
//  IntentHandler.swift
//  Extension
//
//  Created by Arinjay Sharma on 3/18/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import Intents
import UIKit

class IntentHandler: INExtension , INRidesharingDomainHandling {
    
    
    func handle(listRideOptions intent: INListRideOptionsIntent, completion: @escaping (INListRideOptionsIntentResponse) -> Void) {
        
        
        let result = INListRideOptionsIntentResponse(code: .success, userActivity: nil)
        
        let mini = INRideOption(name: "Honda Amze", estimatedPickupDate: Date(timeIntervalSinceNow: 1000))
        let accord = INRideOption(name: "Honda Accord", estimatedPickupDate: Date(timeIntervalSinceNow: 800))
        let ferrari = INRideOption(name: "Ferrari F430", estimatedPickupDate: Date(timeIntervalSinceNow: 300))
        ferrari.disclaimerMessage = "This is bad for the environment"
        
        result.expirationDate = Date(timeIntervalSinceNow: 3600)
        result.rideOptions = [mini, accord, ferrari]
        
        completion(result)
        
        
        
    }
    
    func handle(requestRide intent: INRequestRideIntent, completion: @escaping (INRequestRideIntentResponse) -> Void) {
        
        let result = INRequestRideIntentResponse(code: .success, userActivity: nil)
        
        let status = INRideStatus()
        
        status.rideIdentifier = "abc123"
        
        status.pickupLocation = intent.pickupLocation
        status.dropOffLocation = intent.dropOffLocation
        
        status.phase = INRidePhase.confirmed
        
        status.estimatedPickupDate = Date(timeIntervalSince1970: 900)
        
        let vehicle = INRideVehicle()
        
        
        let image = UIImage(named: "car.png")
        let data  = UIImagePNGRepresentation(image!)!
        vehicle.mapAnnotationImage = INImage(imageData: data)
        
        vehicle.location = intent.dropOffLocation!.location
        result.rideStatus = status
        
        completion(result)
        
    }
    
    func handle(getRideStatus intent: INGetRideStatusIntent, completion: @escaping (INGetRideStatusIntentResponse) -> Void) {
        
        
        let result = INGetRideStatusIntentResponse(code: .success, userActivity: nil)
        completion(result)
        
    }
    
    func startSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent, to observer: INGetRideStatusIntentResponseObserver) {
        
    }
    
    func stopSendingUpdates(forGetRideStatus intent: INGetRideStatusIntent) {
        
    }
    
    
    
    func resolvePickupLocation(forListRideOptions intent: INListRideOptionsIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        
        let result : INPlacemarkResolutionResult
        if let requestLocation = intent.pickupLocation {
            result = INPlacemarkResolutionResult.success(with: requestLocation)
        }else{
            result = INPlacemarkResolutionResult.needsValue()
        }
        
    }
    
    func resolveDropOffLocation(forRequestRide intent: INRequestRideIntent, with completion: @escaping (INPlacemarkResolutionResult) -> Void) {
        
        let result : INPlacemarkResolutionResult
        if let requestLocation = intent.dropOffLocation {
            result = INPlacemarkResolutionResult.success(with: requestLocation)
        }else{
            result = INPlacemarkResolutionResult.needsValue()
        }
        
    }
    
    
    
}

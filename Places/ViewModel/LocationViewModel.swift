//
//  LocationViewModel.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import Foundation
import MapKit

class locationViewModel:ObservableObject{

    @Published var locations : [Location]

    @Published var CoordinateRegion  = MKCoordinateRegion()

    @Published var SheetLocation : Location?

    @Published var CurrentMApLocation : Location {
        didSet {
            updateCoordinateRegin(location: CurrentMApLocation)
        }

    }

    @Published  var isListDisplayed =  false

    let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)

    init(){
        let location = LocationsDataService.locations
        locations=location
        CurrentMApLocation =  LocationsDataService.locations.first!
        self.updateCoordinateRegin(location: locations.first!)
    }

    func updateCoordinateRegin(location:Location){
        CoordinateRegion = MKCoordinateRegion(center: location.coordinates, span: span)
    }

    func updateListState(){
     isListDisplayed.toggle()
    }

    func getNextLocation(){
        let currentIndex = locations.firstIndex { Location in
            return CurrentMApLocation.id == Location.id
        }

        if currentIndex != locations.count-1
        {
            CurrentMApLocation = locations[currentIndex!+1]
        }
        else{
            CurrentMApLocation = locations[0]
        }
    }

}

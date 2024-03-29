//
//  Location.swift
//  Places
//
//  Created by Kareem Ragab Hassan on 27/11/2023.
//

import Foundation

import MapKit

struct Location:Identifiable{
    var name : String
    var cityName : String
    var coordinates : CLLocationCoordinate2D
    var description : String
    var imageNames : [String]
    var link : String

    var id : String {

        return name+cityName

    }

}

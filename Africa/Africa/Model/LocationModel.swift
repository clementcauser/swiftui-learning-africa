//
//  LocationModel.swift
//  Africa
//
//  Created by Clément Causer on 05/05/2022.
//

import Foundation
import MapKit

struct NationalParkLocation: Identifiable, Codable {
    let id: String
    let name: String
    let image: String
    var latitude: Double
    var longitude: Double

    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

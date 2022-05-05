//
//  MapView.swift
//  Africa
//
//  Created by Clément Causer on 05/05/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70, longitudeDelta: 70)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)

        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: - BODY
    var body: some View {
        // MARK: - #1 BASIC MAP
        // Map(coordinateRegion: $region)

        // MARK: #2 ADVANCED MAP
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {
            item in
            // Option A: PIN OLD STYLE (static)
            // MapPin(coordinate: item.location, tint: .accentColor)

            // Option B: NEW STYLE (static)
            // MapMarker(coordinate: item.location, tint: .accentColor)

            // Option C: CUSTOM BASIC ANNOTATION (interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32, alignment: .center)
//            }

            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
            .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                    }

                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                    }
                }
            }
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color.black.cornerRadius(8).opacity(0.6))
                .padding()
            , alignment: .top
        )
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

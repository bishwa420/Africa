//
//  MapView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTIES

    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    // MARK: - BODY

    var body: some View {
        // MARK: - No1 BASIC MAP

//        Map(coordinateRegion: $region)

        // MARK: - No2 ADVANCED MAP

        Map(
            coordinateRegion: $region,
            annotationItems: locations,
            annotationContent: { item in

                // (A) PIN: OLD STYLE (always static)
//                MapPin(
//                    coordinate: item.location,
//                    tint: .accentColor
//                )

                // (B) MARKER: NEW STYLE (always static)
//                MapMarker(coordinate: item.location, tint: .accentColor)

                // (C) CUSTOM BASIC ANNOTATION (it could be interactive)
                MapAnnotation(coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }) //: MAP
            .overlay(
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
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

//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 30/11/22.
//

import SwiftUI

struct MapAnnotationView: View {
    // MARK: - PROPERTIES

    var location: NationalParkLocation
    @State private var animation: Double = 0.0

    // MARK: - BODY

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .opacity(1 - animation)
                .scaleEffect(1 + CGFloat(animation))

            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
        } //: ZSTACK
        .onAppear(perform: {
            withAnimation(
                .easeOut(duration: 2)
                    .repeatForever(autoreverses: false)
            ) {
                animation = 1.0
            }
        })
    }
}

// MARK: - PREVIEW

struct MapAnnotationView_Previews: PreviewProvider {
    static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")

    static var previews: some View {
        MapAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

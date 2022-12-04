//
//  GalleryView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES

    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var selectedAnimal: String = "lion"

    // SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//    ]

    // EFFICIENT GRID DEFINITION
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0

    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }

    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            // MARK: - GRID

            VStack(alignment: .center, spacing: 30) {
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(
                                .white,
                                lineWidth: 5)
                        ,
                        alignment: .center
                    )

                // MARK: - SLIDER

                Slider(value: $gridColumn, in: 2 ... 4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumn, perform: { _ in
                        gridSwitch()
                    })

                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(
                                        .white,
                                        lineWidth: 1
                                    ),
                                alignment: .center
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                    } //: LOOP
                } //: GRID
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VSTACK
        } //: SCROLL
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

// MARK: - PREVIEW

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}

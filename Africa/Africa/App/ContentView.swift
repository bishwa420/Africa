//
//  ContentView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES

    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)

    @State private var isGridViewActive: Bool = true
    @State private var gridLayout: [GridItem] = Array(
        repeating: GridItem(.flexible()),
        count: 2
    )
    @State private var gridColumns: Int = 2
    @State private var gridToolbarIcon: String = "square.grid.2x2"

    // MARK: - FUNCTIONS

    func switchGrid() {
        gridColumns = gridColumns % 3 + 1
        gridLayout = Array(
            repeating: .init(.flexible()),
            count: gridColumns
        )

        switch gridColumns {
        case 1:
            gridToolbarIcon = "square.grid.2x2"
        case 2:
            gridToolbarIcon = "square.grid.3x2"
        case 3:
            gridToolbarIcon = "rectangle.grid.1x2"
        default:
            gridToolbarIcon = "square.grid.2x2"
        }
    }

    func resetGrid() {
        gridColumns = 2
        gridLayout = Array(repeating: .init(.flexible()), count: gridColumns)
        gridToolbarIcon = "square.grid.2x2"
    }

    // MARK: - BODY

    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        ForEach(animals) { animal in
                            NavigationLink(
                                destination: AnimalDetailView(
                                    animal: animal)
                            ) {
                                AnimalListItemView(animal: animal)
                            } //: LINK
                        } //: LOOP
                        .listRowBackground(Color.black)
                    } //: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(
                            columns: gridLayout,
                            alignment: .center,
                            spacing: 5
                        ) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    Image(animal.image)
                                        .resizable()
                                        .scaledToFit()
                                        .cornerRadius(12)
                                }
                            }
                        } //: V GRID
                        .padding(10)
                        .animation(.easeIn)
                    }
                } //: CONDITION
            } //: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        // LIST VIEW
                        Button(action: {
                            isGridViewActive = false
                            resetGrid()
                            haptics.impactOccurred()
                        }) {
                            Image(
                                systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(
                                    !isGridViewActive
                                        ?
                                        .accentColor
                                        :
                                        .primary)
                        }
                        // GRID VIEW
                        Button(action: {
                            switch isGridViewActive {
                            case true:
                                switchGrid()
                            case false:
                                resetGrid()
                                isGridViewActive = true
                            }
                            haptics.impactOccurred()
                        }) {
                            Image(systemName: gridToolbarIcon)
                                .font(.title2)
                                .foregroundColor(
                                    isGridViewActive
                                        ?
                                        .accentColor
                                        :
                                        .primary)
                        }
                    } //: HSTACK
                } //: TOOBAR ITEM
            } //: TOOLBAR
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

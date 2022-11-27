//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 28/11/22.
//

import SwiftUI

struct ExternalWebLinkView: View {
    // MARK: - PROPERTIES

    let animal: Animal

    // MARK: - BODY

    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()

                Group {
                    Link(
                        animal.name,
                        destination: (
                            URL(string: animal.link)
                                ??
                                URL(string: "https://wikipedia.org")
                        )!
                    )
                    Image(
                        systemName: "arrow.up.right.square"
                    )
                } //: GROUP
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: GROUP
    }
}

// MARK: - PREVIEW

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

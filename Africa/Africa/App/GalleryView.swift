//
//  GalleryView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES

    // MARK: - BODY

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            EmptyView()
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

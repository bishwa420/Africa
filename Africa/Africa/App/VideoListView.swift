//
//  VideoListView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 27/11/22.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES

    @State var videos: [Video] = Bundle.main.decode("videos.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)

    // MARK: - BODY

    var body: some View {
        NavigationView {
            List {
                ForEach(videos) { video in
                    VideoListItemView(video: video)
                } //: LOOP
                .padding(.vertical, 8)
            } //: LIST
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        videos.shuffle()
                        hapticImpact.impactOccurred()
                    }) {
                        Image(systemName: "arrow.2.squarepath")
                    }
                }
            }
        } //: NAVIGATION
    }
}

// MARK: - PREVIEW

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

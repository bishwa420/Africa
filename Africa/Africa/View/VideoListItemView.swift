//
//  VideoListItemView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 30/11/22.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES

    let video: Video

    // MARK: - BODY

    var body: some View {
        HStack(alignment: .top) {
            ZStack {
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                    .clipShape(Circle())
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 32)
                    .shadow(radius: 4)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(video.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy)
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            } //: VSTACK
        } //: HSTACK
    }
}

// MARK: - PREVIEW

struct VideoListItemView_Previews: PreviewProvider {
    static let videos: [Video] = Bundle.main.decode("videos.json")
    static var previews: some View {
        VideoListItemView(video: videos[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

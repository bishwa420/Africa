//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 4/12/22.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES

    @State private var randomCirclesCount = Int.random(in: 12 ... 16)
    @State private var isAnimating: Bool = false

    // MARK: - FUNCTIONS

    // RANDOM COORDINATE
    func getRandomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0 ... max)
    }

    // RANDOM SIZE
    func getRandomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10 ... 300))
    }

    // RANDOM SCALE
    func getRandomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1 ... 2.0))
    }

    // RANDOM SPEED
    func getRandomSpeed() -> Double {
        return Double.random(in: 0.25 ... 1.0)
    }

    // RANDOM DELAY
    func getRandomDelay() -> Double {
        return Double.random(in: 0 ... 2)
    }

    // MARK: - BODY

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0 ... randomCirclesCount, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: getRandomSize(), height: getRandomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? getRandomScale() : 1.0)
                        .position(
                            x: getRandomCoordinate(max: geometry.size.width),
                            y: getRandomCoordinate(max: geometry.size.height)
                        )

                        .onAppear(
                            perform: {
                                withAnimation(
                                    .interpolatingSpring(
                                        stiffness: 0.5,
                                        damping: 0.5
                                    )
                                    .repeatForever()
                                    .speed(getRandomSpeed())
                                    .delay(getRandomDelay())
                                ) {
                                    isAnimating = true
                                }
                            }
                        )
                } //: LOOP
            } //: ZSTACK
            .drawingGroup()
        } //: GEOMETRY
    }
}

// MARK: - PREVIEW

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}

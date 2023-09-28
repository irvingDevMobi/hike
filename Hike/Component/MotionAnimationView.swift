//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Irving Lop on 28/09/23.
//

import SwiftUI

struct MotionAnimationView: View {
    // MARK: - PROPERTIES
    @State private var randomCircles: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    // 1. Random Coordinate
    func randomCoordinates() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    
    // 3. Random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircles, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinates(),
                        y: randomCoordinates()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(.interpolatingSpring(stiffness: 0.25, damping: 0.25).repeatForever()) {
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            MotionAnimationView()
        }
    }
}

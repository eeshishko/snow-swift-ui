//
//  SnowfallBackgroundView.swift
//
//
//  Created by Evgeny Shishko on 01.02.2024.
//

import SwiftUI

public struct SnowfallBackground: View {
    private let numberOfSnowflakes: Int
    private let animationDuration: Double
    private let repeatCount: Int
    @State private var isAnimating = false
    
    public init(
        numberOfSnowflakes: Int = 100,
        animationDuration: Double = 10.0,
        repeatCount: Int = 2
    ) {
        self.numberOfSnowflakes = numberOfSnowflakes
        self.animationDuration = animationDuration
        self.repeatCount = repeatCount
    }

    public var body: some View {
        GeometryReader { geometry in
            ForEach(0..<numberOfSnowflakes, id: \.self) { _ in
                SnowflakeView()
                    .position(
                        x: CGFloat.random(in: 0...geometry.size.width),
                        y: isAnimating ? 
                            geometry.size.height + CGFloat(Int.random(in: 50...500)) // randomly position snowflakes on Y axis
                            : -50
                    )
                    .onAppear {
                        withAnimation(
                            Animation.linear(duration: animationDuration).repeatCount(2, autoreverses: false)
                        ) {
                            isAnimating = true
                        }
                    }
            }
        }
    }
}

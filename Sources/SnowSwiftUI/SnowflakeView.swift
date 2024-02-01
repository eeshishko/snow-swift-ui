//
//  SnowflakeView.swift
//  
//
//  Created by Evgeny Shishko on 01.02.2024.
//

import SwiftUI

public struct SnowflakeView: View {
    private let color: Color
    private let size: CGSize
    private let lineWidth: CGFloat
    
    public init(
        color: Color = .white,
        size: CGSize = .init(width: 30, height: 30),
        lineWidth: CGFloat = 2
    ) {
        self.color = color
        self.size = size
        self.lineWidth = lineWidth
    }
    
    public var body: some View {
        SnowflakeShape()
            .stroke(color, lineWidth: lineWidth)
            .frame(width: size.width, height: size.height)
    }
}

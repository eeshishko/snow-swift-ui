//
//  SnowflakeShape.swift
//
//
//  Created by Evgeny Shishko on 01.02.2024.
//

import SwiftUI

public struct SnowflakeShape: Shape {
    private let numberOfPoints: Int
    
    public init(numberOfPoints: Int = 6) {
        self.numberOfPoints = numberOfPoints
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        
        // Create an array to store the end points of each line
        var endPoints: [CGPoint] = []
        
        // Calculate the end points of each line
        for i in 0..<numberOfPoints {
            let angle = (Double(i) * (360.0 / Double(numberOfPoints))) * Double.pi / 180
            let pointX = center.x + rect.width / 2 * cos(CGFloat(angle))
            let pointY = center.y + rect.height / 2 * sin(CGFloat(angle))
            endPoints.append(CGPoint(x: pointX, y: pointY))
        }
        
        // Draw lines between the end points
        for i in 0..<numberOfPoints {
            let start = i == 0 ? endPoints.last! : endPoints[i - 1]
            let end = endPoints[i]
            path.move(to: center)
            path.addLine(to: start)
            path.move(to: center)
            path.addLine(to: end)
        }
        
        // Draw small circles at the end points
        for endPoint in endPoints {
            let circleRect = CGRect(x: endPoint.x - rect.width / 20,
                                    y: endPoint.y - rect.width / 20,
                                    width: rect.width / 10,
                                    height: rect.width / 10)
            path.addEllipse(in: circleRect)
        }

        return path
    }
}

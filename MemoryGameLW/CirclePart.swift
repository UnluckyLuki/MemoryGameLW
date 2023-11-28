//
//  CirclePart.swift
//  MemoryGameLW
//
//  Created by student on 28/11/2023.
//

import SwiftUI
import CoreGraphics

struct CirclePart: Shape{
    
    var rotationAdjustment = Angle.degrees(90)
    var startAngle: Angle = .zero
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius*cos(startAngle.radians - rotationAdjustment.radians),
            y: center.y + radius*sin(startAngle.radians - rotationAdjustment.radians))
        var p = Path()
        
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngle - rotationAdjustment, endAngle: endAngle - rotationAdjustment, clockwise: false)
        
        return p
    }
    
}

#Preview
{
    CirclePart(endAngle: .degrees(210))
}

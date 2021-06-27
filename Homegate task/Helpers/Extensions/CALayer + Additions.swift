//
//  CALayer + Additions.swift
//  Homegate task
//
//  Created by Vladimir on 26.06.2021.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0, //swiftlint:disable:this identifier_name
        y: CGFloat = 0, //swiftlint:disable:this identifier_name
        blur: CGFloat = 4,
        spread: CGFloat = 0,
        cornerRadius: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
        if spread == 0, cornerRadius == 0 {
            shadowPath = nil
        } else {
            let dx = -spread //swiftlint:disable:this identifier_name
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        }
        masksToBounds = false
    }

    func removeShadow() {
        applyShadow(color: .clear, alpha: 0, x: 0, y: 0, blur: 0, spread: 0, cornerRadius: 0)
    }
}

//
//  AnimationButton.swift
//  32th-Sopt-First-Seminar
//
//  Created by 남유진 on 2023/04/13.
//  Copyright © 2023 남유진. All rights reserved.
//

import UIKit

final class AnimationButton: UIButton {
    
    @frozen
    private enum Animation {
        typealias Element = (
          duration: TimeInterval,
          delay: TimeInterval,
          options: UIView.AnimationOptions,
          scale: CGAffineTransform,
          alpha: CGFloat
        )
        
        case touchDown
        case touchUp
        
        var element: Element {
          switch self {
          case .touchDown:
            return Element(
              duration: 0,
              delay: 0,
              options: .curveLinear,
              scale: .init(scaleX: 1.3, y: 1.3),
              alpha: 0.8
            )
          case .touchUp:
            return Element(
              duration: 0,
              delay: 0,
              options: .curveLinear,
              scale: .identity,
              alpha: 1
            )
          }
        }
      }
    
    override var isHighlighted: Bool {
        didSet { self.animateWhenHighlighted() }
    }
    
    private func animateWhenHighlighted() {
        let animationElement = self.isHighlighted ? Animation.touchDown.element : Animation.touchUp.element
        
        UIView.animate(
            withDuration: animationElement.duration,
            delay: animationElement.delay,
            options: animationElement.options,
            animations: {
                self.transform = animationElement.scale
                self.alpha = animationElement.alpha
            }
        )
    }
}

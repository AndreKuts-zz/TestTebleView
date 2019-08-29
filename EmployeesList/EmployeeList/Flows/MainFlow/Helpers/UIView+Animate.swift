//
//  UIView+Animate.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

extension UIView {
  
  func fadeIn(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in }) {
    self.alpha = 0.0
    
    UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
      self.isHidden = false
      self.alpha = 1.0
    }, completion: completion)
  }
  
  func fadeOut(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in }) {
    self.alpha = 1.0
    
    UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
      self.alpha = 0.0
    }) { (completed) in
      self.isHidden = true
      completion(true)
    }
  }
}

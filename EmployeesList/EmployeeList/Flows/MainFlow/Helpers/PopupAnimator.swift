//
//  PopupAnimator.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

final class PopupAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  private let animationDuration = 0.4
  private let showingMode: PopupAnimatorShowingMode

  init(showingMode: PopupAnimatorShowingMode) {
    self.showingMode = showingMode
  }

  // MARK: - UIViewControllerAnimatedTransitioning
  
  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return animationDuration
  }
  
  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    guard let fromVC = transitionContext.viewController(forKey: .from),
      let toVC = transitionContext.viewController(forKey: .to) else {
        return
    }
    
    let containerView = transitionContext.containerView
    self.animateTransition(in: containerView, from: fromVC, to: toVC, using: transitionContext)
  }
  
  private func animateTransition(in conteinerView: UIView,
                                 from fromVC: UIViewController,
                                 to toVC: UIViewController,
                                 using transitionContext: UIViewControllerContextTransitioning) {
    
    switch showingMode {
    case .show:
      showAnimation(for: toVC.view, in: conteinerView, using: transitionContext)
    case .dismiss:
      hideAnimation(for: fromVC.view, in: conteinerView, using: transitionContext)
    }
  }
  
  private func showAnimation(for view: UIView,
                             in containerView: UIView,
                             using transitionContext: UIViewControllerContextTransitioning) {
    
    containerView.addSubview(view)
    view.frame.origin.y = containerView.bounds.maxY
    
    UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseIn, animations: {
      view.center = containerView.center
    }, completion: { _ in
      transitionContext.completeTransition(true)
    })
  }
  
  private func hideAnimation(for view: UIView,
                             in containerView: UIView,
                             using transitionContext: UIViewControllerContextTransitioning) {
    
    view.center = containerView.center
    
    UIView.animate(withDuration: animationDuration, delay: 0.0, options: .curveEaseIn, animations: {
      view.frame.origin.y = containerView.bounds.maxY
    }, completion: { _ in
      transitionContext.completeTransition(true)
      view.removeFromSuperview()
    })
  }
}

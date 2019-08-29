//
//  PopupViewController.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController, UIViewControllerTransitioningDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    modalPresentationStyle = .custom
    transitioningDelegate = self
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return PopupAnimator(showingMode: .dismiss)
  }

  func animationController(forPresented presented: UIViewController,
                           presenting: UIViewController,
                           source: UIViewController) -> UIViewControllerAnimatedTransitioning? {

    return PopupAnimator(showingMode: .show)
  }
}

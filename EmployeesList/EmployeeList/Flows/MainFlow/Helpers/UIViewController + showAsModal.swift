//
//  UIViewController + showing.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

extension UIViewController {

  func showAsModal(_ viewController: UIViewController) {

    viewController.view.center = view.center
    viewController.modalPresentationStyle = .overFullScreen
    viewController.view.frame = view.frame
    
    present(viewController, animated: true)
  }

}

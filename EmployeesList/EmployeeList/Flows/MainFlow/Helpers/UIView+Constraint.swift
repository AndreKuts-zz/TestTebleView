//
//  UIView+Constraint.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

extension UIView {

  func addInto(_ view: UIView, topIndent: CGFloat = 0, leftIndent: CGFloat = 0, rightIndent: CGFloat = 0, bottomIndent: CGFloat = 0) {
    view.addSubview(self)
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: view.topAnchor, constant: topIndent).isActive = true
    leftAnchor.constraint(equalTo: view.leftAnchor, constant: leftIndent).isActive = true
    rightAnchor.constraint(equalTo: view.rightAnchor, constant: rightIndent).isActive = true
    bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  bottomIndent).isActive = true
  }
}

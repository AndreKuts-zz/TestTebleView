//
//  EmployeeTableHeaderView.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class EmployeeTableHeaderView: UITableViewHeaderFooterView, Reusable {

  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)

    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)

    setupUI()
  }

  override func prepareForReuse() {
    super.prepareForReuse()

    setupUI()
  }

  func setTitle(_ text: String?) {
    textLabel?.text = text
  }

  private func setupUI() {
    backgroundColor = .lightText
    textLabel?.textColor = .gray
  }
}

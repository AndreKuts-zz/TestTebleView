//
//  AddNewTableViewCell.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit
import Foundation

class AddNewTableViewCell: BaseTableViewCell {

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    self.setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupUI() {

    textLabel?.text = "Добавить"
    imageView?.image = UIImage(named: "plus")
    addAddButton()

  }

  private func addAddButton() {

    let addButton = UIButton()
    self.addSubview(addButton)

    addButton.translatesAutoresizingMaskIntoConstraints = false
    addButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    addButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    addButton.widthAnchor.constraint(equalToConstant: 44).isActive = true

    addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
  }

  @objc private func addButtonAction() {

    model?.showInitialInfoAlert()

  }
}


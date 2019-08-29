//
//  EmployeeTableViewCell.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: BaseTableViewCell {

  private var salaryLabel: UILabel?
  private var nameLabel: UILabel?

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    setupUI()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func configure(_ model: TableViewCellItemModel?) {
    super.configure(model)

    updateInfo()
  }

  private func setupUI() {

    addDeleteButton()
    addSalaryLabel()
    addNameLabel()
    imageView?.image = UIImage(named: "remove")
  }

  func updateInfo() {

    nameLabel?.text = model?.info.employee?.name
    salaryLabel?.text = model?.info.employee?.salary
  }

  private func addDeleteButton() {

    let deleteButton = UIButton()
    self.addSubview(deleteButton)

    deleteButton.translatesAutoresizingMaskIntoConstraints = false
    deleteButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    deleteButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    deleteButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
    deleteButton.widthAnchor.constraint(equalToConstant: 44).isActive = true
    deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)

  }

  private func addSalaryLabel() {
    let label = UILabel()
    label.textColor = .lightGray
    label.textAlignment = .right
    self.addSubview(label)

    label.translatesAutoresizingMaskIntoConstraints = false
    label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    label.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
    label.widthAnchor.constraint(equalToConstant: 100).isActive = true

    salaryLabel = label
  }

  private func addNameLabel() {

    let label = UILabel()
    label.textColor = .black
    self.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
    label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    label.leftAnchor.constraint(equalTo: leftAnchor, constant: 70).isActive = true

    // TODO: Remove force unwrapping!

    label.rightAnchor.constraint(equalTo: salaryLabel!.leftAnchor, constant: -8).isActive = true
    nameLabel = label

  }

  @objc func deleteButtonAction() {

    guard let employee = model?.info.employee else {
      return
    }
  
    model?.onRemoveEmployee?(employee)
  }
}

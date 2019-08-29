//
//  BaseCell.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/28/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class BaseCell: UITableViewCell, Reusable {
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

//
//  BaseTableViewCell.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/28/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit
import Foundation

class BaseTableViewCell: UITableViewCell, Reusable {

  var model: TableViewCellItemModel?

  func configure(_ model: TableViewCellItemModel?) {
    self.model = model
  }

}

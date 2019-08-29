//
//  ItemType.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

enum ItemType {

  case addNewInfo
  case filled

  var cellReuseId: String {
    switch self {
    case .addNewInfo:
      return AddNewTableViewCell.reuseIdentifier
    case .filled:
      return EmployeeTableViewCell.reuseIdentifier
    }
  }
}

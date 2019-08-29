//
//  BaseTableViewCellProtocol.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import Foundation

protocol BaseTableViewCellProtocol {
  func setupCell(_ info: CellItemProtocol)
  func setupUI()
}

protocol CellItemProtocol {

}

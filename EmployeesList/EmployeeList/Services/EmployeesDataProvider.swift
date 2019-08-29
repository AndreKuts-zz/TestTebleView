//
//  EmployeesDataProvider.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

protocol EmployeesDataProvider: class {

  var itemsCount: Int { get }

  var onUpdateItem: (() -> Void)? { get set }

  func getTableViewItem(at index: Int) -> TableViewCellItemModel?
  func removeEmployee(_ employee: Employee)
  func addEmployee(_ newEnmployee: Employee)
}

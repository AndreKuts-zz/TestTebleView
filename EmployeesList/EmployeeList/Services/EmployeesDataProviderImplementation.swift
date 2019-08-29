//
//  EmployeesDataProviderImplementation.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import Foundation

class EmployeesDataProviderImplementation: EmployeesDataProvider {

  private static let alertService = AlertService()

  private var items: [TableViewCellItemModel] = [
    TableViewCellItemModel(itemType: .addNewInfo,
                    infoModel: ItemInfo(title: "Добавить", employee: nil),
                    alertService: EmployeesDataProviderImplementation.alertService)
  ]

  var onUpdateItem: (() -> Void)?

  var itemsCount: Int {
    return items.count
  }

  func getTableViewItem(at index: Int) -> TableViewCellItemModel? {

    guard index <= itemsCount else {
      return nil
    }

    let item = items[index]

    item.onNewEmployee = { [weak self] employee in
      self?.addEmployee(employee)
    }
    item.onRemoveEmployee = { [weak self] employee in
      self?.removeEmployee(employee)
    }
    item.updateEmployee = { [weak self] in
      self?.onUpdateItem?()
    }

    return item
  }

  func removeEmployee(_ employee: Employee) {

    items.enumerated().forEach { item in
      if item.element.info.employee == employee {
        items.remove(at: item.offset)
        onUpdateItem?()
      }
    }
  }

  func addEmployee(_ newEnmployee: Employee) {

    let infoModel = ItemInfo(title: nil, employee: newEnmployee)
    let newItem = TableViewCellItemModel(itemType: .filled, infoModel: infoModel, alertService: EmployeesDataProviderImplementation.alertService)
    items.append(newItem)

    onUpdateItem?()
  }

  func removeItem(at index: Int) {

    guard index <= itemsCount else {
      return
    }

    items.remove(at: index)
  }
}

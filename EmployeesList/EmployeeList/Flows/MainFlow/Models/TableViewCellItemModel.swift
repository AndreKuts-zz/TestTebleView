//
//  TableViewCellItemModel.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

class TableViewCellItemModel {

  var itemType: ItemType
  var info: ItemInfo
  var alertService: AlertService

  var onNewEmployee: ((Employee) -> Void)?
  var onRemoveEmployee: ((Employee) -> Void)?
  var updateEmployee: (() -> Void)?

  init(itemType: ItemType, infoModel: ItemInfo, alertService: AlertService) {

    self.itemType = itemType
    self.info = infoModel
    self.alertService = alertService

  }

  func editEmployee() {
    let alertModel = AlertModel(title: nil, message: nil, fullName: info.employee?.name, accountNumber: "4SVG4W8Q8936AFK82H4", moneyType: "BYN")
    alertService.showEditinfoAlert(alertModel) { [weak self] result in
      guard let result = result else {
        return
      }

      self?.info.employee?.changeSalary(result.sum)
      self?.updateEmployee?()
    }
  }

  func showInitialInfoAlert() {

    let alertModel = AlertModel(title: "", message: "", fullName: nil, accountNumber: nil, moneyType: "")
    alertService.showRequestInfoAlert(alertModel, completion: { [weak self] alertResult in
      guard let info = alertResult else {
          return
      }

      let employee = Employee(name: info.name, salary: info.sum)
      self?.onNewEmployee?(employee)
    })
  }

  func removeEmployee(_ employee: Employee) {
    onRemoveEmployee?(employee)
  }
}

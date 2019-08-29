//
//  EmployeeListViewControllerModel.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class EmployeeListViewModel: EmployeeListViewModelProtocol {

  weak var view: EmployeeListViewProtocol?
  private var dataProvider: EmployeesDataProvider

  init(view: EmployeeListViewProtocol, dataProvider: EmployeesDataProvider) {

    self.view = view
    self.dataProvider = dataProvider
    dataProvider.onUpdateItem = {
      view.updateEmployeeList()
    }
  }

  var numberOfRowsInSection: Int {
    return dataProvider.itemsCount
  }

  func getCellModel(at index: Int) -> TableViewCellItemModel? {

    let model = dataProvider.getTableViewItem(at: index)
    return model

  }

}

protocol EmployeeListViewModelProtocol {

  var numberOfRowsInSection: Int { get }
  var view: EmployeeListViewProtocol? { get }

  func getCellModel(at index: Int) -> TableViewCellItemModel?

}

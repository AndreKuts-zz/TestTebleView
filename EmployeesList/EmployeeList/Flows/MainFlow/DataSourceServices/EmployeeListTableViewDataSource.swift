//
//  EmployeeListTableViewDataSource.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

class EmployeeListTableViewDataSource: NSObject, UITableViewDataSource {

//  let dataProvider: EmployeesDataProvider = EmployeesDataProviderImplementation()

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: BaseTableViewCell.reuseIdentifier, for: indexPath) as? BaseTableViewCell else {
      return UITableViewCell()
    }
    
//    cell.setupType(dataProvider)

    return cell
  }
}

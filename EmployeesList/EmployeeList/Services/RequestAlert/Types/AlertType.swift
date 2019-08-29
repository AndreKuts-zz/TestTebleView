//
//  AlertType.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

enum AlertType {
  
  case requestInfo(moneyType: MoneyType)
  case editInfo(forName: String, accountNumber: String, moneyType: MoneyType)
  
}

//
//  TextFieldType.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

enum TextFieldType: Int {
  
  typealias TextFieldType = Int
  case name = 1
  case sum
  
  var placeholder: String {
    switch self {
    case .name:
      return "Имя"
    case .sum:
      return "Сумма"
    }
  }
  
}

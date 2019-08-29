//
//  Employee.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

class Employee: EmployeeProtocol, Equatable {

  static func == (lhs: Employee, rhs: Employee) -> Bool {
    return lhs === rhs
  }

  var name: String
  var salary: String

  init(name: String, salary: String) {
    self.name = name
    self.salary = salary
  }

  func changeSalary(_ newSalary: String) {
    salary = newSalary
  }

}

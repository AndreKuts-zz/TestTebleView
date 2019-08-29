//
//  Employee.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

protocol EmployeeProtocol: HumanProtocol {

  var salary: String { get }

  func changeSalary(_ newSalary: String)
}

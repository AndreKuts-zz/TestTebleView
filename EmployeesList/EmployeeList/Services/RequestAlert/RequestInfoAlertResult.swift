//
//  RequestInfoAlertResult.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/28/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

protocol RequestInfoAlertResult {

  var name: String { get }
  var sum: String { get }

}

struct RequestInfoResultItem: RequestInfoAlertResult {

  var name: String
  var sum: String

}

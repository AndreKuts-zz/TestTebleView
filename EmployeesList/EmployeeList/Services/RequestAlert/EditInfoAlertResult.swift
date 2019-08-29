//
//  EditInfoAlertResult.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/28/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import Foundation

protocol EditInfoAlertResult {

  var sum: String { get }

}

struct EditInfoResultItem: EditInfoAlertResult {

  var sum: String

}

//
//  RequestInfoAlertManagerProtocol.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/28/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

protocol RequestInfoAlertManagerProtocol: class {
  func showAlertController(_ alertModel: AlertModel, completion: @escaping (AlertResult?) -> Void)
}

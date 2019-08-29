//
//  AlertService.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

struct AlertService {

  func showRequestInfoAlert(_ alertModel: AlertModel, completion: @escaping (RequestInfoAlertResult?) -> Void) {

    guard let presentController = topViewController() else {
      return
    }

    let viewController = InfoViewController()
    viewController.setupUI(for: .request)
    viewController.onNewInfoAdded = { name, sum in
      let result = RequestInfoResultItem(name: name, sum: sum)
      completion(result)
    }
    presentController.showAsModal(viewController)
  }

  func showEditinfoAlert(_ alertModel: AlertModel, completion: @escaping (EditInfoAlertResult?) -> Void) {

    guard let presentController = topViewController() else {
      return
    }

    let viewController = InfoViewController()
    viewController.setupUI(for: .edit(name: alertModel.fullName ?? "", accountNumber: alertModel.accountNumber ?? "", moneyType: alertModel.moneyType ?? "BYN" ))
    viewController.onInfoEdited = { sum in
      let result = EditInfoResultItem(sum: sum)
      completion(result)
    }
    presentController.showAsModal(viewController)
  }

  private func addTextFields(to alertController: UIAlertController, textfieldTypes: [TextFieldType]) {

    textfieldTypes.forEach { textFieldType in
      alertController.addTextField(configurationHandler: { textField in
        textField.tag = textFieldType.rawValue
        textField.placeholder = textFieldType.placeholder
      })
    }

  }

  private func confirmationRequestInfoAction(_ alertController: UIAlertController,
                                             completion: @escaping (RequestInfoAlertResult) -> Void) -> UIAlertAction {

    let confirmationAction = UIAlertAction(title: "Применить", style: .default) { _ in

      let nameTextField = alertController.textFields?.first(where: { $0.tag == TextFieldType.name.rawValue })
      let sumTextField = alertController.textFields?.first(where: { $0.tag == TextFieldType.sum.rawValue })
      let name = nameTextField?.text ?? "" // TODO: show if testfields are empty
      let sum = sumTextField?.text ?? ""
      let result = RequestInfoResultItem(name: name, sum: sum)
      completion(result)
    }

    return confirmationAction

  }

  private func cancelAction<T>(_ alertController: UIAlertController, completion: @escaping (T?) -> Void) -> UIAlertAction {

    let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: { _ in
      completion(nil)
    })
    return cancelAction

  }

  private func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {

    if let navigationController = controller as? UINavigationController {
      return topViewController(controller: navigationController.visibleViewController)
    }

    if let tabController = controller as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topViewController(controller: selected)
      }
    }

    if let presented = controller?.presentedViewController {
      return topViewController(controller: presented)
    }

    return controller
  }

}







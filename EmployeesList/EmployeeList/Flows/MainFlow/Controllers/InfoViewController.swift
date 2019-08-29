//
//  RequestInfoViewController.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/29/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

private enum Constant {
  static let cornerRadius: CGFloat = 15
  static let helveticaBold = UIFont(name: "Helvetica Bold", size: 20)
  static let helvetica = UIFont(name: "Helvetica", size: 20)
  static let alertWidth: CGFloat = 350
  static let alertHeight: CGFloat = 250
  static let buttonHeight: CGFloat = 50
  static let backgroundAlpha: CGFloat = 0.45
  static let infoViewHeight: CGFloat = -(buttonHeight + 1)
  static let detailInfoLeftIndent: CGFloat = 24
  static let detailInfoRightIndent: CGFloat = -detailInfoLeftIndent
  static let headerHeight: CGFloat = 30
  static let headerIndent: CGFloat = 16
  static let infoSubviewHeight: CGFloat = 30
  static let detailIndent: CGFloat = 4
  static let infoViewSizeWithIndents: CGFloat = 32
  static let detailInfoTopConstraint: CGFloat = headerHeight + headerIndent + detailIndent
}

class InfoViewController: PopupViewController {

  private var alertView: UIView?
  private var infoView: UIView?
  private var titleLabel: UILabel?
  private var nameTextfield: UITextField?
  private var sumTextfield: UITextField?

  private lazy var buttons = [makeCancelButton(), makeApplayButton()]

  var onInfoEdited: ((_ sum: String) -> Void)?
  var onNewInfoAdded: ((_ name: String, _ sum: String) -> Void)?

  func setupUI(for type: InfoControllerType) {

    setupBackgroundView()
    setupAlertView(for: type)
  }

  private func setupBackgroundView() {

    let backgroundView = UIView()
    backgroundView.addInto(view)
    backgroundView.backgroundColor = .black
    backgroundView.alpha = Constant.backgroundAlpha
  }

  private func setupAlertView(for type: InfoControllerType) {
    let alertView = UIView()
    self.alertView = alertView
    self.view.addSubview(alertView)

    alertView.translatesAutoresizingMaskIntoConstraints = false
    alertView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    alertView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    alertView.widthAnchor.constraint(equalToConstant: Constant.alertWidth).isActive = true
    alertView.heightAnchor.constraint(equalToConstant: Constant.alertHeight).isActive = true
    alertView.layer.cornerRadius = Constant.cornerRadius
    alertView.clipsToBounds = true
    alertView.backgroundColor = .lightGray

    setupButtons(in: alertView)
    setupInfoView(in: alertView, for: type)
  }

  private func setupButtons(in view: UIView) {
    
    let buttonsStackView = UIStackView()
    view.addSubview(buttonsStackView)
    buttonsStackView.backgroundColor = .black
    buttonsStackView.axis = .horizontal
    buttonsStackView.spacing = 1
    buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
    buttonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    buttonsStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    buttonsStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    buttonsStackView.heightAnchor.constraint(equalToConstant: Constant.buttonHeight).isActive = true

    addButtons(buttons, to: buttonsStackView)
  }

  private func addButtons(_ buttons: [UIButton], to stackView: UIStackView) {
    
    let buttonWidth = Constant.alertWidth / CGFloat(buttons.count)
    
    buttons.forEach { button in
      stackView.addArrangedSubview(button)
      button.backgroundColor = .white
      button.setTitleColor(.blue, for: .normal)
      button.setTitleColor(.darkGray, for: .highlighted)
      button.translatesAutoresizingMaskIntoConstraints = false
      button.widthAnchor.constraint(equalToConstant: buttonWidth - 1).isActive = true
      button.clipsToBounds = true
    }
  }

  private func makeCancelButton() -> UIButton {

    let cancelButton = UIButton()
    cancelButton.setTitle("Отмена", for: .normal)
    cancelButton.titleLabel?.font = Constant.helveticaBold
    cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)

    return cancelButton
  }

  private func makeApplayButton() -> UIButton {

    let applayButton = UIButton()
    applayButton.setTitle("Применить", for: .normal)
    applayButton.titleLabel?.font = Constant.helvetica
    applayButton.addTarget(self, action: #selector(apply), for: .touchUpInside)
    
    return applayButton
  }

  @objc private func apply() {

    if let name = nameTextfield?.text, let sum = sumTextfield?.text {
      onNewInfoAdded?(name, sum)
    }

    if let sum = sumTextfield?.text {
      self.onInfoEdited?(sum)
    }

    self.dismiss(animated: true)
  }

  @objc private func cancel() {

    self.dismiss(animated: true)

  }

  private func setupInfoView(in view: UIView, for type: InfoControllerType) {

    let infoView = UIView()
    self.infoView = infoView

    view.addSubview(infoView)
    infoView.backgroundColor = UIColor(white: 10, alpha: 1)
    infoView.translatesAutoresizingMaskIntoConstraints = false
    infoView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    infoView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    infoView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constant.infoViewHeight).isActive = true

    addTitleLabel(in: infoView)
    addDetailInfoView(in: view, for: type)
  }

  private func addTitleLabel(in view: UIView) {
    let titleLabel = UILabel()
    self.titleLabel = titleLabel
    view.addSubview(titleLabel)

    titleLabel.textAlignment = .center
    titleLabel.font = Constant.helveticaBold
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constant.headerIndent).isActive = true
    titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constant.headerIndent).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(Constant.headerIndent)).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: Constant.headerHeight).isActive = true
    titleLabel.text = "Сотрудник"
  }

  private func addDetailInfoView(in view: UIView, for type: InfoControllerType) {

    switch type {
    case .request:
      requestDetail(in: view)
    case .edit(let name, let accountNumber, let moneyType):
      editDetail(in: view, name: name, accountNumber: accountNumber, moneyType: moneyType)
    }
  }

  private func editDetail(in view: UIView, name: String, accountNumber: String, moneyType: String) {
    let detailInfoView = UIView()
    detailInfoView.backgroundColor = .clear
    detailInfoView.addInto(view,
                           topIndent: Constant.detailInfoTopConstraint,
                           leftIndent: Constant.detailInfoLeftIndent,
                           rightIndent: Constant.detailInfoRightIndent,
                           bottomIndent: Constant.infoViewHeight)
    addDetailLabel(in: detailInfoView, atPosition: 0, withText: "ФИО: \(name)")
    addDetailLabel(in: detailInfoView, atPosition: 1, withText: "Счет: \(accountNumber)")
    addDetailLabel(in: detailInfoView, atPosition: 2, withText: "Сумма, \(moneyType): ")
    self.sumTextfield = addTextField(in: detailInfoView, atPosition: 3)
  }

  private func requestDetail(in view: UIView) {
    let detailInfoView = UIView()
    detailInfoView.backgroundColor = .clear
    detailInfoView.addInto(view,
                           topIndent: Constant.detailInfoTopConstraint,
                           leftIndent: Constant.detailInfoLeftIndent,
                           rightIndent: Constant.detailInfoRightIndent,
                           bottomIndent: Constant.infoViewHeight)
    addDetailLabel(in: detailInfoView, atPosition: 0, withText: "ФИО: ")
    self.nameTextfield = addTextField(in: detailInfoView, atPosition: 1)
    addDetailLabel(in: detailInfoView, atPosition: 2, withText: "Сумма, BYN: ")
    self.sumTextfield = addTextField(in: detailInfoView, atPosition: 3)
  }
  
  private func addTextField(in view: UIView, atPosition position: Int) -> UITextField {
    let textField = UITextField()
    view.addSubview(textField)
    textField.delegate = self
    textField.backgroundColor = .white
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.gray.cgColor
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constant.infoViewSizeWithIndents * CGFloat(position)).isActive = true
    textField.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    textField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    textField.heightAnchor.constraint(equalToConstant: Constant.infoSubviewHeight).isActive = true
    textField.placeholder = "Введите"

    return textField
  }

  private func addDetailLabel(in view: UIView, atPosition position: Int, withText text: String) {
    let labelName = UILabel()
    let constant = position == 0 ? 4 : Constant.infoViewSizeWithIndents * CGFloat(position)
    view.addSubview(labelName)
    labelName.translatesAutoresizingMaskIntoConstraints = false
    labelName.topAnchor.constraint(equalTo: view.topAnchor, constant: constant).isActive = true
    labelName.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    labelName.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    labelName.heightAnchor.constraint(equalToConstant: Constant.infoSubviewHeight).isActive = true
    labelName.text = text
  }
}

// MARK: UITextFieldDelegate

extension InfoViewController: UITextFieldDelegate {
  
}

enum InfoControllerType {

  case edit(name: String, accountNumber: String, moneyType: String)
  case request

}

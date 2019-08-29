//
//  EmployeeListViewController.swift
//  EmployeeList
//
//  Created by Andrii Kuts on 8/27/19.
//  Copyright © 2019 Andrii Kuts. All rights reserved.
//

import UIKit

private struct Constant {

  static let topSpace: CGFloat = 20
  static let leftSpace: CGFloat = 8
  static let rightSpace: CGFloat = -8
  static let bottomSpace: CGFloat = 0
  static let heightForHeader: CGFloat = 44
  static let heightForCell: CGFloat = 60
  static let headerDefaultTitle = "список сотрудников"

}

class EmployeeListViewController: UIViewController {

  private lazy var viewModel: EmployeeListViewModelProtocol = {
    return EmployeeListViewModel(view: self, dataProvider: EmployeesDataProviderImplementation())
  }()

  private lazy var employeeListtableView: UITableView = {
    return getTableView()
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()
    setupTableView()

  }

  private func setupUI() {

    self.view.backgroundColor = .lightGray
    self.view.addSubview(employeeListtableView)
    setTableViewConstraint(employeeListtableView)

  }

  private func setTableViewConstraint(_ tableView: UITableView) {

    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: Constant.topSpace).isActive = true
    tableView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: Constant.leftSpace).isActive = true
    tableView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: Constant.rightSpace).isActive = true
    tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: Constant.bottomSpace).isActive = true

  }

  private func setupTableView() {

    employeeListtableView.delegate = self
    employeeListtableView.dataSource = self
    registerViewsIntoTableView(employeeListtableView)

  }

  private func registerViewsIntoTableView(_ tableView: UITableView) {

    tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.reuseIdentifier)
    tableView.register(AddNewTableViewCell.self, forCellReuseIdentifier: AddNewTableViewCell.reuseIdentifier)
    tableView.register(EmployeeTableHeaderView.self, forHeaderFooterViewReuseIdentifier: EmployeeTableHeaderView.reuseIdentifier)

  }

  private func getTableView() -> UITableView {
    let tabeleView = UITableView()
    return tabeleView
  }
}

// MARK: EmployeeListViewProtocol

extension EmployeeListViewController: EmployeeListViewProtocol {

  func updateEmployeeList() {

    //TODO: add animated inserting / deleting rows

    employeeListtableView.reloadData()

  }
}

// MARK: UITableViewDelegate

extension EmployeeListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  
    viewModel.getCellModel(at: indexPath.row)?.editEmployee()

  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: EmployeeTableHeaderView.reuseIdentifier) as? EmployeeTableHeaderView
    view?.setTitle(Constant.headerDefaultTitle.uppercased())
    
    return view

  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

    return Constant.heightForHeader
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

    return Constant.heightForCell
  }
}

extension EmployeeListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfRowsInSection
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = setupCell(tableView: tableView, at: indexPath) else {
      return UITableViewCell()
    }
    return cell
  }

  private func setupCell(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell? {

    guard let model = viewModel.getCellModel(at: indexPath.row) else {
      return nil
    }

    switch model.itemType {
    case .addNewInfo:
      let cell = tableView.dequeueReusableCell(withIdentifier: model.itemType.cellReuseId, for: indexPath) as? AddNewTableViewCell
      cell?.configure(viewModel.getCellModel(at: indexPath.row))
      return cell
    case .filled:
      let cell = tableView.dequeueReusableCell(withIdentifier: model.itemType.cellReuseId, for: indexPath) as? EmployeeTableViewCell
      cell?.configure(viewModel.getCellModel(at: indexPath.row))
      cell?.updateInfo()
      return cell
    }
  }
}


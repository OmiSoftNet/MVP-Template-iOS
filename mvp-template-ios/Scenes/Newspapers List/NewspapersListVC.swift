//
//  ViewController.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import UIKit

class NewspapersListVC: BaseVC<NewspapersListPresenter> {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            let nib = UINib(nibName: NewspaperTableViewCell.cellIdent, bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: NewspaperTableViewCell.cellIdent)
        }
    }

    override func initPresenter(with context: RouteContext?) {
        presenter = NewspapersListPresenter()
        presenter?.attachView(mvpView: self)
        presenter?.setContext(to: context)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.doOnStart()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

extension NewspapersListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.newspapersList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewspaperTableViewCell.cellIdent, for: indexPath) as? NewspaperTableViewCell, let newspaper = presenter?.newspapersList[indexPath.row] {
            cell.setNewspaper(newspaper)
            return cell
        } else {
            return NewspaperTableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return NewspaperTableViewCell.cellHeight
    }
}

extension NewspapersListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedCell(withRow: indexPath.row)
    }

}

extension NewspapersListVC: NewspapersMvpView {
    func updateList() {
        tableView.reloadData()
    }
}


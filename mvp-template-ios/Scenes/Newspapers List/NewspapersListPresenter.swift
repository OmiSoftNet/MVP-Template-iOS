//
//  NewspapersListPresenter.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/5/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation

class NewspapersListPresenter: MvpPresenter<NewspapersMvpView> {

    var newspapersList = [Newspaper]()

    private let service = NetworkService.shared
    
    func selectedCell(withRow: Int) {
        let parameters = [NewspaperDetailVC.ArgNewspaperDetailUrl: newspapersList[withRow].url, NewspaperDetailVC.ArgNewspaperDetailTitle: newspapersList[withRow].title]
        let context = RouteContext(parameters)
        mvpView?.openChildScreen(.newspaperDetail, fromStoryboard: .main, withContext: context)
    }

    func doOnStart() {
        fetchNewspapers()
    }

    private func fetchNewspapers() {
        service.getNewspapersList(completion: {(list, error) in
            if let list = list {
                self.newspapersList = list.newspapersList.reversed()
                self.mvpView?.updateList()
            }
        })
    }
}

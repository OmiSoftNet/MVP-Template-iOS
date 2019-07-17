//
//  NewspaperDetailPresenter.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/6/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation

class NewspaperDetailPresenter: MvpPresenter<NewspaperDetailMvpView> {

    private let service = NetworkService.shared
    
    private var newspaperUrl: String?
    private var newspaperTitle: String?
    private let unknownPublisher = "Unknown"
    private let unknownYear = "??"
    
    override func setContext(to context: RouteContext?) {
        guard let context = context else {
            return
        }
        newspaperUrl = context[NewspaperDetailVC.ArgNewspaperDetailUrl]
        newspaperTitle = context[NewspaperDetailVC.ArgNewspaperDetailTitle]
    }

    func backButtonPressed() {
        mvpView?.backToPrevScreen(with: nil)
    }

    func doOnStart() {
        mvpView?.updateView(withTitle: newspaperTitle ?? "", publisher: "", years: "")
        fetchDetail()
    }

    private func fetchDetail() {
        guard let url = newspaperUrl else {
            return
        }

        service.getNewspaperDetail(byUrl: url, completion: {(detail, error) in
            guard let detail = detail else {
                return 
            }
            self.processDetail(detail)
        })
    }

    private func processDetail(_ detail: NewspaperDetail) {
        let title = detail.title
        let publisher = detail.publisher ?? unknownPublisher
        let years = "\(detail.startYear ?? unknownYear)-\(detail.endYear ?? unknownYear)"
        self.mvpView?.updateView(withTitle: title, publisher: publisher, years: years)
    }
}

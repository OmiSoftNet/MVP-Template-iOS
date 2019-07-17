//
//  NewspaperDetailVC.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/6/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import UIKit

class NewspaperDetailVC: BaseVC<NewspaperDetailPresenter> {

    static let ArgNewspaperDetailUrl = "ARG_NEWSPAPER_DETAIL_URL"
    static let ArgNewspaperDetailTitle = "ARG_NEWSPAPER_DETAIL_TITLE"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!

    override func initPresenter(with context: RouteContext?) {
        presenter = NewspaperDetailPresenter()
        presenter?.attachView(mvpView: self)
        presenter?.setContext(to: context)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.doOnStart()
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        presenter?.backButtonPressed() 
    }

    override func setupStyle() {
       // backButton.backgroundColor = .clear
        backButton.layer.cornerRadius = backButton.frame.height/2
        //backButton.imageView?.contentMode = .scaleAspectFit
    }
}

extension NewspaperDetailVC: NewspaperDetailMvpView {
    func updateView(withTitle title: String, publisher: String, years: String) {
        titleLabel.text = title
        publisherLabel.text = publisher
        yearsLabel.text = years
    }

    func setTitle(_ title: String) {
        titleLabel.text = title
    }
}

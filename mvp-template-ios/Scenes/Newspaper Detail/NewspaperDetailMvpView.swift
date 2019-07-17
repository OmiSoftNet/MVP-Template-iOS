//
//  NewspaperDetailMvpView.swift
//  NewspapersDemoApp
//
//  Created by Руслан Федорович on 7/6/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation

protocol NewspaperDetailMvpView: MvpView {
    func updateView(withTitle title: String, publisher: String, years: String)
}

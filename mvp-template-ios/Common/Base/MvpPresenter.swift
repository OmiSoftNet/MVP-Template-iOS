//
// Created by eugene on 12.08.18.
// Copyright (c) 2018 omisoft. All rights reserved.
//

import Foundation
import RxSwift

class MvpPresenter<V> {

    var mvpView: V?
    var context: RouteContext?

    func attachView(mvpView: V) {
        self.mvpView = mvpView
    }

    func setContext(to context: RouteContext?) {
        self.context = context
    }

    func detachView() {
        mvpView = nil
    }
}

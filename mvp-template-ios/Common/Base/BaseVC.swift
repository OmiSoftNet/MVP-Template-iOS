//
// Created by eugene on 12.08.18.
// Copyright (c) 2018 omisoft. All rights reserved.
//

import Foundation
import UIKit

class BaseVC<P>: UIViewController, RoutableScreen {

    var context: RouteContext?
    var presenter: P?
    var router: Router {
        return Router(viewController: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyle()
        initPresenter(with: context)
    }

    func initPresenter(with context: RouteContext?) {
        fatalError("Subclasses must implement initPresenter()")
    }

    func setupStyle() {
        setNeedsStatusBarAppearanceUpdate()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

extension BaseVC: MvpView {
    func openScreen(_ screen: Screen,
                    fromStoryboard storyboard: Storyboard,
                    withContext context: RouteContext? = nil) {
        Router(viewController: self)
            .openScreen(screen, fromStoryboard: storyboard, isChildScreen: false, withContext: context)
    }

    func openChildScreen(_ screen: Screen,
                         fromStoryboard storyboard: Storyboard,
                         withContext context: RouteContext? = nil) {
        Router(viewController: self)
            .openScreen(screen, fromStoryboard: storyboard, isChildScreen: true, withContext: context)
    }

    func backToPrevScreen(with context: RouteContext? = nil) {
        Router(viewController: self).backToPrevScreen(with: context)
    }
}

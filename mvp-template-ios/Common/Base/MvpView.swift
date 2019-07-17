//
// Created by eugene on 12.08.18.
// Copyright (c) 2018 omisoft. All rights reserved.
//
import UIKit

protocol MvpView {
    func openScreen(_ screen: Screen,
    fromStoryboard storyboard: Storyboard,
    withContext context: RouteContext?)

    func openChildScreen(_ screen: Screen,
    fromStoryboard storyboard: Storyboard,
    withContext context: RouteContext?)

    func backToPrevScreen(with context: RouteContext?)
}

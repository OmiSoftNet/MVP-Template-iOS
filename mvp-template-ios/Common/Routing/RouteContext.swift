//
//  RouteContext.swift
//
//  Created by Dmytro Romaniuk on 9/10/18.
//  Copyright © 2018 omisoft. All rights reserved.
//

import Foundation

protocol RoutableScreen {
    var context: RouteContext? { get set }
}

struct RouteContext {
    private let params: [String: Any]
    
    subscript<T>(key: String) -> T? {
        return params[key] as? T
    }
    
    init(_ params: [String: Any]) {
        self.params = params
    }
}


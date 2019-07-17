//
//  WindowRouter.swift
//
//  Created by Dmytro Romaniuk on 8/29/18.
//  Copyright © 2018 omisoft. All rights reserved.
//

import Foundation
import UIKit

class WindowRouter {
    
    let window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func openScreen(_ screen: Screen,
                    fromStoryboard storyboard: Storyboard,
                    withContext context: RouteContext? = nil) {
        
        let storyboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        let initialViewController = storyboard.instantiateViewController(withIdentifier: screen.rawValue)
        
        if var nextRoutableScreen = initialViewController as? RoutableScreen {
            nextRoutableScreen.context = context
        }
        
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
    }
    
}

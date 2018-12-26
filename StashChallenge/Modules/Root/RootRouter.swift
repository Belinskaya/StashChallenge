//
//  RootRouter.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentSmartInvestingScreen(in window: UIWindow?) {
        window?.makeKeyAndVisible()
        window?.rootViewController = AchievementsRouter.createModule()
    }
}

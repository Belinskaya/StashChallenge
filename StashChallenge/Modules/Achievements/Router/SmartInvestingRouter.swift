//
//  SmartInvestingRouter.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

class AchievementsRouter: AchievementsWireframe {
    var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let router = AchievementsRouter()
        let presenter = AchievementsPresenter(with: router)
        let interactor = AchievementsInteractor(with: presenter)
        presenter.interactor = interactor
        let smartInvesting = SmartInvestingViewController.create(with: presenter)
        presenter.view = smartInvesting
        let navigationVC = UINavigationController(rootViewController: smartInvesting)
        return navigationVC
    }
}

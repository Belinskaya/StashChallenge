//
//  AchievementsPresenter.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import Foundation

class AchievementsPresenter: AchievementsPresentation {
    var router: AchievementsWireframe!
    var interactor: AchievementsInteraction!
    weak var view: AchievementsView?
    
    init(with router: AchievementsWireframe) {
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchAchievements()
    }
}

extension AchievementsPresenter: AchievementsInteractionOutput {
    func achievementsFetched(_ achievements: [Achievement]) {
        view?.updateView(with: achievements)
    }
    
    func achievementsFetchFailed() {
        print("Failed to fetch")
    }
}

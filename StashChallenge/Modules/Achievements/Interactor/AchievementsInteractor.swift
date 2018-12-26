//
//  AchievementsInteractor.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import Foundation

class AchievementsInteractor: AchievementsInteraction {
    weak var output: AchievementsInteractionOutput?
    
    init(with outputHandler: AchievementsInteractionOutput) {
        output = outputHandler
    }
    
    func fetchAchievements() {
        APIManager().retrieveAchivement { [weak self] (result) in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let achievements):
                    print(achievements)
                    strongSelf.output?.achievementsFetched(achievements)
                case .failure(let error):
                    strongSelf.output?.achievementsFetchFailed()
                }
            }
        }
    }
}

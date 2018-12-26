//
//  SmartInvestingContracts.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

//SmartInvestingRouter
protocol AchievementsWireframe: class {
    var viewController: UIViewController? { get set }
    
    static func createModule() -> UIViewController
    //    func presentSortOptions(sortCompletion: ((ArticlesSortType) -> ())?)
    //    func presentDetails(forArticle article: Article)
}

protocol AchievementsView: class {
    var presenter: AchievementsPresentation! { get set }
    func updateView(with data: [Achievement])
}

protocol AchievementsPresentation: class {
    var view: AchievementsView? { get set }
    
    var interactor: AchievementsInteraction! { get set }
    var router: AchievementsWireframe! { get set }
    
    func viewDidLoad()
//    func didClickSortButton()
//    func didSelectArticle(_ article: Article)
}

protocol AchievementsInteraction: class {
    var output: AchievementsInteractionOutput? { get set }
    
    func fetchAchievements()
}

protocol AchievementsInteractionOutput: class {
    func achievementsFetched(_ achievements: [Achievement])
    func achievementsFetchFailed()
}

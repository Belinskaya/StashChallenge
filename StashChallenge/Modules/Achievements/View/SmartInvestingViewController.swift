//
//  ViewController.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

class SmartInvestingViewController: UIViewController, AchievementsView {
    var presenter: AchievementsPresentation!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var achievements = [Achievement]()
    
    static func create(with presenter: AchievementsPresentation) -> SmartInvestingViewController {
        guard let smartInvestingVC = Storyboards.smartInvestingStoryboard.instantiateInitialViewController() as? SmartInvestingViewController else {
            fatalError()
        }
        smartInvestingVC.presenter = presenter
        return smartInvestingVC
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
        presenter.viewDidLoad()
    }
    
    private func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // MARK: AchievementsView
    func updateView(with data: [Achievement]) {
        achievements = data
        collectionView.reloadData()
    }
}

extension SmartInvestingViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AchievementCollectionViewCell.self), for: indexPath) as? AchievementCollectionViewCell else {
            fatalError()
        }
        cell.setup(with: achievements[indexPath.item])
        return cell
    }
}


//
//  AchievementCollectionViewCell.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

class AchievementCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var roundLabel: RoundLabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var maxlabel: UILabel!
    @IBOutlet weak var greyoutView: UIView!
    
    func setup(with achievement: Achievement) {
        roundLabel.setup(with: AchievementsLocalizations.levelTitle, description: String(achievement.level))
        APIManager().retrieveImage(at: achievement.imageURL) { [weak self] (image) in
            self?.backgroundImage.image = image
        }
        //progressBar
        print("\(String(format: AchievementsLocalizations.pointsFormat, "\(achievement.progress)"))")
        print("\(String(format: AchievementsLocalizations.pointsFormat,"\(achievement.total)"))")
        minLabel.text = String(format: AchievementsLocalizations.pointsFormat, "\(achievement.progress)")
        maxlabel.text = String(format: AchievementsLocalizations.pointsFormat,"\(achievement.total)")
        greyoutView.isHidden = achievement.accessible
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
}


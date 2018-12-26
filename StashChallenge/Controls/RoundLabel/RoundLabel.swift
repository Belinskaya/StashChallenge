//
//  RoundLabel.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

class RoundLabel: UIView {
    var view: UIView?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        view = loadFromXib()
    }
    
    override required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view = loadFromXib()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: RoundLabel.self), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
    
    private func loadFromXib() -> UIView? {
        if let view = loadViewFromNib() {
            view.frame = bounds
            view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            addSubview(view)
            return view
        }
        return nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("corner radius \(frame.size.height/2)")
        layer.cornerRadius = frame.size.height/2
        layer.masksToBounds = true
    }
    
    func setup(with title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}

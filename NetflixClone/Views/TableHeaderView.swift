//
//  TableHeaderView.swift
//  NetflixClone
//
//  Created by Kostya Lee on 03/03/22.
//

import UIKit

class TableHeaderView: UIView {
    private var image: UIImage?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func updateBackgroundImage(with image: UIImage?) {
        self.image = image
    }
}

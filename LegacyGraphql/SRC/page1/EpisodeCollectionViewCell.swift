//
//  EpisodeCollectionViewCell.swift
//  LegacyGraphql
//
//  Created by Neosoft on 24/03/23.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    //MARK: - outlets
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    
    //MARK: - awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        redView.layer.shadowOffset = CGSize(width: 0.2, height: 1)
        redView.layer.shadowOpacity = 1
        redView.layer.cornerRadius = 15
        // Initialization code
    }
    
    //Automatic cell layout
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Get the preferred size of the content view that fits its constraints
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height + 10)
        frame.size.width = UIScreen.main.bounds.width
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    

    

}

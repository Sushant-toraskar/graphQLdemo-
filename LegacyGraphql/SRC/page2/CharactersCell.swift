//
//  CharactersCell.swift
//  LegacyGraphql
//
//  Created by Neosoft on 28/03/23.
//

import UIKit

class CharactersCell: UICollectionViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        characterCell.layer.borderColor = UIColor.white.cgColor
        characterCell.layer.borderWidth = 1.0
        characterCell.layer.cornerRadius = 10.0
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        // Get the preferred size of the content view that fits its constraints
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height + 10)
        frame.size.width = ceil(size.width + 10)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    
}

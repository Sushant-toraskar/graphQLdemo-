//
//  CharacterTableViewCell.swift
//  LegacyGraphql
//
//  Created by Neosoft on 23/03/23.
//

import UIKit
import SDWebImage

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setup(name : String,id : String,img : String){
        self.name.text = name
        self.id.text = id
        let imageURL = URL(string: img)!
        charImage.sd_setImage(with: imageURL)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

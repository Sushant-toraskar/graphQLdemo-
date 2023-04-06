//
//  flashScreenVC.swift
//  LegacyGraphql
//
//  Created by Neosoft on 04/04/23.
//

import UIKit
import FLAnimatedImage

class flashScreenVC: UIViewController {
    @IBOutlet weak var imgView: FLAnimatedImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        imgView?.sd_setImage(with: URL(string: "https://www.icegif.com/wp-content/uploads/2022/06/icegif-519.gif"))
//        imgView?.sd_setImage(with: URL(string: RCValues.sharedInstance.remoteConfig.configValue(forKey: "splash_screen")!))
        self.view.backgroundColor = .black
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

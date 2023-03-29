//
//  extentions.swift
//  LegacyGraphql
//
//  Created by Neosoft on 29/03/23.
//

import Foundation
import UIKit

class Extentions : UIViewController{
    let spinnerview = UIView()
    let activityindicator = UIActivityIndicatorView(style: .large)
    
    func startLoader(){
        spinnerview.frame = self.view.frame
        spinnerview.backgroundColor =  UIColor(red: 255, green: 255, blue: 255, alpha: 0.3)
        activityindicator.center = spinnerview.center
        spinnerview.addSubview(activityindicator)
        activityindicator.startAnimating()
        self.view.addSubview(spinnerview)
    }
    func stopLoader(){
        spinnerview.isHidden = true
    }
}

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
        spinnerview.backgroundColor =  UIColor(red: 2, green: 2, blue: 2, alpha: 0.2)
        activityindicator.center = spinnerview.center
        spinnerview.addSubview(activityindicator)
        activityindicator.startAnimating()
        self.view.addSubview(spinnerview)
    }
    func stopLoader(){
        spinnerview.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.backItem?.hidesBackButton = true
        let back = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(goBack))
        back.tintColor = .white
        navigationItem.leftBarButtonItem = back
    }
    
    @objc func goBack(){
        navigationController?.popViewController(animated: true)
    }
    
   
}

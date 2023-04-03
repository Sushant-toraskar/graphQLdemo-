//
//  CharacterDetailPage.swift
//  LegacyGraphql
//
//  Created by Neosoft on 29/03/23.
//

import UIKit

class CharacterDetailPage: Extentions {
    
    var viewModel : CommonViewModel?
    var id : String?
    
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var lName: UILabel!
    @IBOutlet weak var lType: UILabel!
    @IBOutlet weak var ldimention: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        viewModel?.getCharacterDetailsById(id: id)
        characterImage.layer.borderColor = UIColor.black.cgColor
        characterImage.layer.borderWidth = 1.0
        characterImage.layer.cornerRadius = 10
    }
    
    static func loadnib(viewModel : CommonViewModel?, id : String?)-> CharacterDetailPage {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharacterDetailPage") as! CharacterDetailPage
        vc.viewModel = viewModel
        vc.viewModel?.delegate = vc
        vc.id = id
        return vc
    }
    
    private func setupUI(){
        status.text = "\(viewModel?.characterDetails?.status ?? "")"
        name.text = " \(viewModel?.characterDetails?.name ?? "")"
        species.text = "Species : \(viewModel?.characterDetails?.species ?? "")"
        gender.text = "Gender : \(viewModel?.characterDetails?.gender ?? "")"
        lName.text = "Exact Location : \(viewModel?.characterDetails?.location?.name ?? "")"
        lType.text = "Type Of Location : \(viewModel?.characterDetails?.location?.type ?? "")"
        ldimention.text = "Dimention  : \(viewModel?.characterDetails?.location?.dimension ?? "")"
        let url = viewModel?.characterDetails?.image ?? ""
        characterImage.sd_setImage(with: URL(string: url))
        self.stopLoader()
    }
}

extension CharacterDetailPage : EpisodesResponce {
    func success() {
        print("success")
    }
    
    func failure() {
        print("failure")
    }
    
    func isLoading(_ request: Bool?) {
        setupUI()
    }
    
    
}

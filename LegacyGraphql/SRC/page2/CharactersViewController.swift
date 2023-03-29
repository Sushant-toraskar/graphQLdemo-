//
//  ViewController.swift
//  LegacyGraphql
//
//  Created by Neosoft on 23/03/23.
//

import UIKit
import Apollo

class CharactersViewController: Extentions {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var characters: UILabel!
    @IBOutlet weak var charactersArray: UICollectionView!
    
//    @IBOutlet weak var episodesTable: UITableView!
    var viewModel : CommonViewModel?
    var id : String?
    
    
    static func loadNib(viewModel: CommonViewModel?, id : String?) -> CharactersViewController{
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CharactersViewController" ) as! CharactersViewController
        nextVC.viewModel = viewModel
        nextVC.id = id
        nextVC.viewModel?.delegate = nextVC
        nextVC.viewModel?.getEpisodeDetailsById(id: id)
        return nextVC
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startLoader()
        setup()
       // self.viewModel?.delegate = self
       // self.viewModel?.getEpisodeDetailsById(id: id)
    }
    
    func setup(){
        charactersArray.delegate = self
        charactersArray.dataSource = self
    }
    
    func setupUI(){
        guard let Ename = viewModel?.Characters?.name ,let episodeName = viewModel?.Characters?.episode,let airDateis = viewModel?.Characters?.airDate  else {
            return
        }
        name.text = "Episode Name : \(Ename)"
        created.text = "AirDate : \(airDateis)"
        episode.text = "\(episodeName)"
        characters.text = "Characters "
        self.stopLoader()
    }
}

extension CharactersViewController : UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension CharactersViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.Characters?.characters.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = viewModel?.Characters?.characters[indexPath.row]?.image
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  "charactersCell", for: indexPath) as! CharactersCell
        cell.characterImage.sd_setImage(with: URL(string: url ?? ""))
        cell.characterName.text = viewModel?.Characters?.characters[indexPath.row]?.name ?? ""
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CharacterDetailPage.loadnib(viewModel: viewModel,id : viewModel?.Characters?.characters[indexPath.row]?.id)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CharactersViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height )
    }
}

extension CharactersViewController : EpisodesResponce{
    func isLoading(_ request: Bool?) {
        DispatchQueue.main.async {
            self.setupUI()
            self.charactersArray.reloadData()
        }
    }
    
    func success() {
//        episodesCollections.reloadData()
    }
    
    func failure() {
        print("Error in fetching data")
    }
}



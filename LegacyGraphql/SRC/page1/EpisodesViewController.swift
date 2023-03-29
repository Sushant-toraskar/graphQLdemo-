//
//  EpisodesViewController.swift
//  LegacyGraphql
//
//  Created by Neosoft on 24/03/23.
//

import UIKit

class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var episodesCollections: UICollectionView!
    
    var viewModel : CommonViewModel?
    var isLoading = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = CommonViewModel(delegate: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        vc.delegate = self
        setup()
        viewModel?.getEpisodes(page: 1)
    }
    
    func setup(){
        episodesCollections.dataSource = self
        episodesCollections.delegate = self
        episodesCollections.register(UINib(nibName: "EpisodeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EpisodeCollectionViewCell")
        episodesCollections.register(UINib(nibName: "EpisodesFooter", bundle: nil), forSupplementaryViewOfKind: "UICollectionElementKindSectionFooter", withReuseIdentifier: "EpisodesFooter")
    }
}

extension EpisodesViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.allEpisodes?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EpisodeCollectionViewCell", for: indexPath) as! EpisodeCollectionViewCell
        cell.name.text = viewModel?.allEpisodes?[indexPath.row]?.name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let footerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "EpisodesFooter", for: indexPath)
//        footerCell.backgroundColor = .darkGray
        return footerCell
    }
}

extension EpisodesViewController :  UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        CharactersViewController
        let id = viewModel?.allEpisodes?[indexPath.row]?.id
        let nextViewController = CharactersViewController.loadNib(viewModel: viewModel,id: id)
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let allEpisode = viewModel?.allEpisodes?.count else { return }
        if indexPath.row == allEpisode - 1{
            viewModel?.getEpisodesIfAvailable()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        print("loader display")
    }
}

extension EpisodesViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: collectionView.frame.width/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return isLoading ? CGSize(width: collectionView.frame.width, height: 100) : CGSize.zero
    }
}

extension EpisodesViewController : EpisodesResponce{
    func isLoading(_ request: Bool?) {
        DispatchQueue.main.async { [self] in
            isLoading = request ?? false
            episodesCollections.reloadData()
        }
    }
    
    func success() {
        episodesCollections.reloadData()
    }
    
    func failure() {
        print("Error in fetching data")
    }
}


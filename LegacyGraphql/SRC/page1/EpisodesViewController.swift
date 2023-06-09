//
//  EpisodesViewController.swift
//  LegacyGraphql
//
//  Created by Neosoft on 24/03/23.
//

import UIKit
import Firebase

class EpisodesViewController: UIViewController {
    
    @IBOutlet weak var episodesCollections: UICollectionView!
    
    var viewModel : CommonViewModel?
    var isLoading = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Analytics.logEvent("Episode_screen_view", parameters: [
            AnalyticsParameterScreenName: "episodes",
             "episode_name": "allEpisodes"
        ])
        RCValues.sharedInstance.remoteConfig.configValue(forKey: "")
        viewModel = CommonViewModel(delegate: self)
    }
    
    
    func configSetup(){
//        remoteConfig = RemoteConfig.remoteConfig()
//        let settings = RemoteConfigSettings()
//        settings.minimumFetchInterval = 0
//        remoteConfig.configSettings = settings

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
        cell.date.text = viewModel?.allEpisodes?[indexPath.row]?.airDate
        cell.episodeNumber.text = viewModel?.allEpisodes?[indexPath.row]?.episode
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
        Analytics.logEvent("Episode_screen_view", parameters: [
            AnalyticsParameterScreenName: "episodes",
            "episode_name": viewModel?.allEpisodes?[indexPath.row]?.name ?? "Test"
        ])
        //Analytics
        
        //
        
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
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var totalHeight:CGFloat = 30
//        totalHeight = totalHeight + //
//        totalHeight = totalHeight + 20
//        totalHeight = totalHeight + 20
//        return CGSize(width: collectionView.frame.width - 10, height: totalHeight)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        
        return isLoading ? CGSize(width: collectionView.frame.width, height: 80) : CGSize.zero
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


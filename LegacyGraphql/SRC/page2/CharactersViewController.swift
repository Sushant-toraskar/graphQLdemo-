//
//  ViewController.swift
//  LegacyGraphql
//
//  Created by Neosoft on 23/03/23.
//

import UIKit
import Apollo

class CharactersViewController: UIViewController {
    

    @IBOutlet weak var episodesTable: UITableView!
    
    var result : GetAllEpisodesQuery.Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        Network.shared.apollo.fetch(query: GetAllEpisodesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async { [self] in
//                    debugPrint())
                    self.result = graphQLResult.data.map({ data in
                        return data
                    })
                    self.episodesTable.reloadData()
                }
//                print("Success! Result: \(graphQLResult)")
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
    
    func setup(){
        episodesTable.delegate = self
        episodesTable.dataSource = self
    }
}

extension CharactersViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result?.characters?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
//        cell.textLabel?.text = result?.characters?.results?[indexPath.row]?.name
        cell.setup(name: result?.characters?.results?[indexPath.row]?.name ?? "", id: result?.characters?.results?[indexPath.row]?.id ?? "", img: result?.characters?.results?[indexPath.row]?.image ?? "")
//        debugPrint("result",result?.episodes?.__typename)
        return cell
    }

}

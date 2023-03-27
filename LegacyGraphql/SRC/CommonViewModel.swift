import Foundation

class CommonViewModel {
    
    var pageCount : Int?
    
    var allEpisodes : Any?
    
    
    func getEpisodes(page : Int){
        Network.shared.apollo.fetch(query: GetAllEpisodesWithPageQuery(page: 2)) { result in
            switch result {
            case .success(let graphQLResult):
                DispatchQueue.main.async { [self] in
                    allEpisodes = graphQLResult.data.map({ data in
                        return data
                    })
                    print(allEpisode.)
                }
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }

    }
    
    func getCharacters(page : Int){
        
    }
    
    func getEpisodeDetails(Id : String){
        
    }
    
    
}

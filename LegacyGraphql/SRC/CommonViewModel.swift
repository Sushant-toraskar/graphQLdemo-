import Foundation

protocol EpisodesResponce {
    func success()
    func failure()
    func isLoading(_ request : Bool?)
}

class CommonViewModel : NSObject {
    var allEpisodes : [GetAllEpisodesWithPageQuery.Data.Episode.Result?]? = []
    
    var delegate : EpisodesResponce?
    var episodePage : Int? = 1
    var allepisodePages : Int?
    
    
    init(delegate: EpisodesResponce) {
        self.delegate = delegate
    }
    
    func getEpisodes(page : Int){
//        isLoading = true
        delegate?.isLoading(true)
        Network.shared.apollo.fetch(query: GetAllEpisodesWithPageQuery(page: page)) { [self] result in
            switch result {
            case .success(let graphQLResult):
                let episodes =  graphQLResult.data?.episodes.map({ data in
                    return data.results!
                    })
                allEpisodes! += episodes!
                print("count",allEpisodes?.count)
                self.episodePage = graphQLResult.data?.episodes?.info?.next
                self.allepisodePages = graphQLResult.data?.episodes?.info?.pages
                delegate?.isLoading(false)
                self.delegate?.success()
                
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
            }
    }
    
    func getEpisodesIfAvailable(){
        guard let page = episodePage,let allpage = allepisodePages else {return}
        if page <= allpage{
            getEpisodes(page: page)
        }
    }
    
    func getCharacters(page : Int){
        
    }
    
    func getEpisodeDetails(Id : String){
        
    }
    
    
}

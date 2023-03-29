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
    var inprogress = false
    var Characters : GetEpisodeByIdQuery.Data.EpisodesById?
    var characterDetails : GetCharacterByIdQuery.Data.CharactersById?
    
    init(delegate: EpisodesResponce) {
        self.delegate = delegate
    }
    
    func getEpisodes(page : Int){
        if !inprogress{
            delegate?.isLoading(true)
            inprogress = true
            Network.shared.apollo.fetch(query: GetAllEpisodesWithPageQuery(page: page)) { [self] result in
                inprogress = false
                switch result {
                case .success(let graphQLResult):
                    let episodes =  graphQLResult.data?.episodes.map({ data in
                        return data.results!
                    })
                    self.allEpisodes! += episodes!
                    //                            print("count",allEpisodes?.count)
                    self.episodePage = graphQLResult.data?.episodes?.info?.next
                    self.allepisodePages = graphQLResult.data?.episodes?.info?.pages
                    self.delegate?.isLoading(false)
                case .failure(let error):
                    delegate?.failure()
                    print("Failure! Error: \(error)")
                }
            }
        }
    }
    
    func getEpisodesIfAvailable(){
        guard let currentPage = episodePage,let allpage = allepisodePages else {return}
        if currentPage <= allpage{
            self.getEpisodes(page: currentPage)
        }
    }
    
    func getEpisodeDetailsById(id : String?){
        if !inprogress{
            //            delegate?.isLoading(true)
            inprogress = true
            Network.shared.apollo.fetch(query: GetEpisodeByIdQuery(id: [id!])) { [self] result in
                inprogress = false
                switch result {
                case .success(let graphQLResult):
                    let resul =  graphQLResult.data?.episodesByIds.map({ data in
                        return data
                    })
                    Characters = resul?[0]
                    if Characters?.characters.count ?? 0 > 0{
                        self.delegate?.isLoading(false)
                    }
                case .failure(let error):
                    //                    delegate?.failure()
                    print("Failure! Error: \(error)")
                }
            }
        }
    }
    
    func getCharacterDetailsById(id : String?){
        if !inprogress{
            inprogress = true
            Network.shared.apollo.fetch(query: GetCharacterByIdQuery(id: [id!])) { [self] result in
                inprogress = false
                switch result {
                case .success(let graphQLResult):
                    let resul =  graphQLResult.data?.charactersByIds.map({ data in
                        return data
                    })
                    characterDetails = resul?[0]
                    self.delegate?.isLoading(false)
                case .failure(let error):
                    //                    delegate?.failure()
                    print("Failure! Error: \(error)")
                }
            }
        }
    }
}

import Foundation
import Alamofire
import RxSwift

class ArticleServices {
    
    func fetchNews() -> Observable<[Article]> {
        return Observable.create { (observer) -> Disposable in
            
            self.fetchNews { (error, articles) in
                if let error = error {
                    observer.onError(error)
                }
                if let articles = articles {
                    observer.onNext(articles)
                }
            }
            return Disposables.create()
        }
    }
    
    private func fetchNews(completion: @escaping((Error?, [Article]?) -> Void)) {
        let urlString = "https://newsapi.org/v2/everything?q=tesla&from=2023-08-03&sortBy=publishedAt&apiKey=71bc227b2d6f4ba59d3658726c2aad84"
        
        guard let url = URL(string: urlString) else { return completion(NSError(domain: "junseopark0331", code: 404, userInfo: nil), nil)}
        
        let request = AF.request(
            url,
            method: .get,
            parameters: nil,
            encoding:JSONEncoding.default,
            headers: nil,
            interceptor: nil,
            requestModifier: nil
        ).responseDecodable(of: ArticleResponse.self) { response in
            if let error = response.error {
                return completion(error, nil)
            }
            if let articles = response.value?.articles {
                return completion(nil, articles )
            }
            
        }
    }
}

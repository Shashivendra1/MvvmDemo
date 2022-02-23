//
//  Service.swift
//  PhotoApp_MVVM
//
//  Created by shashivendra  on 03/02/22.
//

import Foundation
import UIKit


class Service: NSObject {

static let shareInstance = Service()


func getAllMovieData(completion: @escaping([Photomodel]?,[MetaModel]?, Error?) -> ()){
    let baseurl = URL(string:Constants.listPhotos)
    var request = URLRequest(url: baseurl!)
    request.allHTTPHeaderFields = [
        "Authorization":APIKEY]//"ApiKey jyoti:25137354d4e9388f8db940be3ec8733231f731af"]
    
  //  guard let url = URL(string: request) else { return }
    URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let err = error{
            completion(nil,nil,err)
            print("Loading data error: \(err.localizedDescription)")
        }else{
            guard let data = data else { return }
            do{
                var arrMovieData = [Photomodel]()
                var metadata = [MetaModel]()
                let results = try JSONDecoder().decode(ResultModel.self, from: data)
             //   print(results.meta)
                metadata.append(MetaModel(limit: results.meta.limit!, next: results.meta.next ?? "", offset: results.meta.offset!, previous: results.meta.previous ?? "", total_count: results.meta.total_count!))
                for movie in results.objects{

                    arrMovieData.append(Photomodel(full: movie.full ?? "", id: movie.id!, thumbnail: movie.thumbnail ?? "", resource_uri: movie.resource_uri!))
                }
                
         completion(arrMovieData,metadata,nil)
                
            }catch let jsonErr{
                print("json error : \(jsonErr.localizedDescription)")
            }
        }
    }.resume()
}

// ********************
    

}

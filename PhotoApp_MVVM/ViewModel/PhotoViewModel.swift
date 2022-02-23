//
//  PhotoViewModel.swift
//  PhotoApp_MVVM
//
//  Created by shashivendra  on 03/02/22.
//

import Foundation
import UIKit

class PhotoViewModel: NSObject {

    var thumbphoto:  Photomodel!
    
    
    init(data: Photomodel? = nil) {
        
        if data == nil {
            return
        }
      
        self.thumbphoto = data
    }
   
        
        var fullImage:String {
            if thumbphoto.full == "" || self.thumbphoto.full == nil {
                return "umbagog"
            }
        return  Constants.mediaURL + self.thumbphoto.full!
        }
        
        var thumbImage: String {
            if thumbphoto.thumbnail == "" || self.thumbphoto.thumbnail == nil {
                return "umbagog"
            }
            return Constants.mediaURL + self.thumbphoto.thumbnail!
        }
        
    
}




class MetaViewModel : NSObject {
    var limit : Int?
    var next : String?
    var offset : Int?
    var previous : String?
    var total_count : Int?
    
    init(data12: MetaModel? = nil) {
        print(data12?.limit as Any)
    }
}

/*
class PhotoViewModel:NSObject{
    
    var photoData: Photomodel!
    init(data: Photomodel? = nil){
        
        if data == nil{
          return
        }
        self.photoData = data!
    }
    var uid: Int {
        return  self.photoData.id!
    }
    
    var fullImage: String {
        if self.photoData.full == "" || self.photoData.full == nil{
            return  "umbagog"
        }
       return  Constants.mediaURL + self.photoData.full!
    }
    var thumbImage: String {
        if self.photoData.thumbnail == "" || self.photoData.thumbnail == nil{
            return  "umbagog"
        }
       return  Constants.mediaURL + self.photoData.thumbnail!
    }
    
}

*/


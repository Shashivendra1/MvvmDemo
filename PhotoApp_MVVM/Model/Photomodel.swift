//
//  Photomodel.swift
//  PhotoApp_MVVM
//
//  Created by shashivendra  on 03/02/22.
//

import Foundation

struct Photomodel: Decodable {
    var full:String?
    var id:Int?
    var resource_uri:String?
    var thumbnail:String?
    init(full:String,id:Int,thumbnail:String,resource_uri:String) {
        self.full = full
        self.id = id
        self.thumbnail = thumbnail
        self.resource_uri = resource_uri
        
    }

}

struct ResultModel:Decodable {
    var objects = [Photomodel]()
    var meta : MetaModel
    init(objects:[Photomodel],meta:MetaModel) {
        self.objects = objects
        self.meta = meta
    }
}


struct MetaModel: Decodable {
    var limit : Int?
    var next : String?
    var offset : Int?
    var previous : String?
    var total_count : Int?
    
    init(limit:Int,next:String,offset:Int,previous:String,total_count:Int) {
        self.limit = limit
        self.next = next
        self.offset = offset
        self.previous = previous
        self.total_count = total_count
    }
    
}

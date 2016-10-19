//
//  post.swift
//  CleanHood
//
//  Created by Arinjay on 18/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import Foundation

class Post {
    
    private var _imagePath: String
    private var _title: String
    private var _PostDesc: String
    
    var imagePath: String {
        return _imagePath
    }
    
    var title:String{
        return _title
    }
    
    var PostDesc:String{
        return _PostDesc
    }
    
    
    
    init(imagePath: String, title: String, decription: String){
        
        self._imagePath = imagePath
        self._title = title
        self._PostDesc = decription
        
    }
    
    
    
}
//
//  Video.swift
//  YoutubeEmbedApp
//
//  Created by Ömer Faruk Kılıçaslan on 3.05.2022.
//

import Foundation

class Video {
    
    var Key:String = ""
    var Title:String = ""
    
    init(){
        
    }
    
    init(Key:String,Title:String){
        self.Key = Key
        self.Title = Title
    }
}

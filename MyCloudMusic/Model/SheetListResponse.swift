//
//  SheetList.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/24.
//

import Foundation

import HandyJSON

class SheetListResponse:HandyJSON {
    var status: Int = 0
    var data: PageResponse!
    
    required init() {
        
    }
}

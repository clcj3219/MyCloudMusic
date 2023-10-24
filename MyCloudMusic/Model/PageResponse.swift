//
//  PageResponse.swift
//  MyCloudMusic
//
//  Created by yw.hao on 2023/10/24.
//

import Foundation
import HandyJSON

class PageResponse: HandyJSON {
    var total:Int = 0
    var pages:Int = 0
    var data:Array<Sheet>!
    
    required init() {}
}

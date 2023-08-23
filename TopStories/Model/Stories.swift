//
//  StoryModel.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import Foundation

struct Stories: Codable {
    var title : String?
    var item_type: String?
    var multimedia: [MultiMedia]?
    
}

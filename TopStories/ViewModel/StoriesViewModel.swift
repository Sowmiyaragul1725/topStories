//
//  StoriesViewModel.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import Foundation

class StoriesViewModel {
    var apiManager: APIManager?
    
    init(apiManager: APIManager) {
        self.apiManager = apiManager
    }
    
    func loadStoriesList(completion: @escaping (StoryListModel?,Error?) -> Void) {
        apiManager?.getStoriesList(completion: completion)
    }
}

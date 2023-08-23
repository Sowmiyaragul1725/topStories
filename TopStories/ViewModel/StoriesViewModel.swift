//
//  StoriesViewModel.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import Foundation

class StoriesViewModel {
    var story: StoriesModel
    
    init(story: StoriesModel) {
        self.story = story
    }
    
    var results : [Stories] {
        return story.results ?? []
    }
    
    func getStoriesList(completion: @escaping (StoriesModel?,Error?) -> Void) {
    let url = URL(string: storiesListUrl)
        if let url = url {
            let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                let data = self?.story.parseJson(jsonData: data ?? Data())
                completion(data,nil)
            }
            task.resume()
        }
    }
}

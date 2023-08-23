//
//  APIManager.swift
//  TopStories
//
//  Created by SowmiyaRagul on 23/08/23.
//

import Foundation

class APIManager {
    var stories = StoryListModel()
    func getStoriesList(completion: @escaping (StoryListModel?,Error?) -> Void) {
    let url = URL(string: storiesListUrl)
        if let url = url {
            let urlRequest = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                let data = self?.stories.parseJson(jsonData: data ?? Data())
                completion(data,nil)
            }
            task.resume()
        }
    }
}

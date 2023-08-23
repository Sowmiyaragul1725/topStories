//
//  StoriesModel.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import Foundation
class StoryListModel: Codable {
    var results: [Stories]?
    
    func parseJson(jsonData : Data) -> StoryListModel? {
        let decoder = JSONDecoder()
        do {
            let dataToModel = try decoder.decode(StoryListModel.self, from: jsonData)
            return dataToModel
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

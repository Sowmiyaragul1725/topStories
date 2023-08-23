//
//  StoriesModel.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import Foundation
struct StoriesModel: Codable {
    var results : [Stories]?
    
    func parseJson(jsonData : Data) -> StoriesModel? {
        let decoder = JSONDecoder()
        do {
            let dataToModel = try decoder.decode(StoriesModel.self, from: jsonData)
            return dataToModel
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
}

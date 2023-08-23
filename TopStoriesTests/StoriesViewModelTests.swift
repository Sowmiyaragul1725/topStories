//
//  StoriesViewModelTestcases.swift
//  TopStoriesTests
//
//  Created by SowmiyaRagul on 23/08/23.
//

import XCTest

final class StoriesViewModelTestcases: XCTestCase {
    var storiesViewModel = StoriesViewModel(apiManager: APIManager())

    func testLoadStoriesList() {
        let expectation = expectation(description: "download")
        storiesViewModel.loadStoriesList { data, error in
            XCTAssertNotNil(data)
            XCTAssertNil(error)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
}


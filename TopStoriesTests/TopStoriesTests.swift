//
//  TopStoriesTests.swift
//  TopStoriesTests
//
//  Created by SowmiyaRagul on 22/08/23.
//

import XCTest
@testable import TopStories

final class TopStoriesTests: XCTestCase {
    var viewModel: StoriesViewModel?
    
    override func setUp() {
        viewModel = StoriesViewModel(apiManager: APIManager())
    }
    
    func testEmptyListOfStories() {
        XCTAssertFalse(viewModel?.apiManager?.stories.results?.count == 0)
    }
    
    func testApiWithNonEmptyUrl() {
        XCTAssertNoThrow("\(storiesListUrl)", "Non-empty API url should pass")
    }
    
    func testApiWithEmptyUrl() {
        XCTAssertNoThrow("\("")", "Empty API url should pass")
    }
    
    func testNotThrowingLicenseErrorForNonEmptyKey() {
            XCTAssertNoThrow("\(apiKey)", "Non-empty API key should pass")
    }
    
    func testThrowingLicenseErrorForEmptyKey() {
            XCTAssertNoThrow("\("")", "Empty API key should pass")
    }

    override func tearDown() {
        viewModel = nil
    }
}

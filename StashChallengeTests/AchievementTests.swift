//
//  AchievementTests.swift
//  StashChallengeTests
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import XCTest
@testable import StashChallenge

class AchievementTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDecoding() {
        let singleAchivementJSONData = """
{
      "id": 4,
      "level": "1",
      "progress": 10,
      "total": 50,
      "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
      "accessible": true
    }
""".data(using: String.Encoding.utf8)!
        
        let decodedAchivement = try? JSONDecoder().decode(Achievement.self, from: singleAchivementJSONData)
        XCTAssertNotNil(decodedAchivement)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

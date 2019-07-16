//
//  EnterFrameTimerTests.swift
//  EnterFrameTimerTests
//
//  Created by shiuchi on 2019/07/17.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import XCTest
@testable import EnterFrameTimer

class EnterFrameTimerTests: XCTestCase {

    override func setUp() {
    }

    func testFps(){
        EnterFrameTimer.shared.fps = 12
        XCTAssertEqual(EnterFrameTimer.shared.fps, 12)
        
        EnterFrameTimer.shared.fps = 24
        XCTAssertEqual(EnterFrameTimer.shared.fps, 24)
    }
    
    func testregister() {
        let exp = expectation(description: "wait")
        let counter = Counter()
        EnterFrameTimer.shared.register(counter) {
            counter.count += 1
            if counter.count > 10 {
                EnterFrameTimer.shared.remove(counter)
                exp.fulfill()
            }
        }

        waitForExpectations(timeout: 1, handler: nil)
    }
    
    func testRemove(){
        let exp = expectation(description: "wait remove")
        let counter = Counter()
        EnterFrameTimer.shared.register(counter) {
            counter.count += 1
            if counter.count > 10 {
                EnterFrameTimer.shared.remove(counter)
                if EnterFrameTimer.shared.isValid == false {
                    exp.fulfill()
                }
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
    }

}

class Counter {
    var count: Int = 0
}

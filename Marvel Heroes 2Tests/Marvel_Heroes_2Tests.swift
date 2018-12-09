//
//  Marvel_Heroes_2Tests.swift
//  Marvel Heroes 2Tests
//
//  Created by Borja Gil Herrero on 04/12/2018.
//  Copyright © 2018 Borja Gil Herrero. All rights reserved.
//

import XCTest
@testable import Marvel_Heroes_2

class Marvel_Heroes_2Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRed(){
        
        var header: APIHeader = APIHeader()
        
        MarvelRed.callAPI(endPoint: "characters", completion: {data in
            header = data

            XCTAssertEqual(header.code, 200, "Error in call")
            
        })
    }
    
    func testData(){
        var characters: [APICharacter] = [APICharacter]()
        DataCall.giveCharacters(completion: {data in
         characters = data

            XCTAssertEqual(characters[0].name, "Deadpool", "Error Character name")
            
        })
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

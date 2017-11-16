//
//  UnitTestJSONParser.swift
//  UnitTestJSONParser
//
//  Created by Mrlee on 2017. 11. 13..
//  Copyright © 2017년 JK. All rights reserved.
//

import XCTest
@testable import JSONParser

class UnitTestJSONParser: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJSONParserArrayWithIntsCASE() {
        let parserTest = JSONParser()
        let testRawJSONData = "[ 10, 21, 4, 314, 99, 0, 72 ]"
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).intTypeCount, 7)
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).sumOfData, 7)
    }
    
    func testJSONParserArrayWithIntBoolStringCASE() {
        let parserTest = JSONParser()
        let testRawJSONData = "[ 10, \"jk\", 4, \"314\", 99, \"crong\", false ]"
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).stringTypeCount, 3)
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).intTypeCount, 3)
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).boolTypeCount, 1)
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData).sumOfData, 7)
    }
    
    func testJSONParserArrayInvaildStandardCASE() {
        let parserTest = JSONParser()
        let testRawJSONData1 = " 10, 21, 4, 314, 99, 0, 72 ]"
        let testRawJSONData2 = "123"
        XCTAssertThrowsError(try parserTest.check(testRawJSONData1))
        XCTAssertThrowsError(try parserTest.check(testRawJSONData2))
    }
    
    func testJSONParserObjectInArrayCASE1() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "[ { \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"married\" : true }, { \"name\" : \"YOON JISU\", \"alias\" : \"crong\", \"level\" : 4, \"married\" : true } ]"
        XCTAssertEqual(try! parserTest.makeJSONData(testRawJSONData1).objectTypeCount, 2)
    }
    
    func testJSONParserObjectInArrayCASE2() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "[ { \"name\" : \"Lee\" }, 123, \"Lee\", true, { \"name\" : \"JIN\" } ]"
        let parserTypeCount = try! parserTest.makeJSONData(testRawJSONData1)
        XCTAssertEqual(parserTypeCount.objectTypeCount, 2)
        XCTAssertEqual(parserTypeCount.boolTypeCount, 1)
        XCTAssertEqual(parserTypeCount.stringTypeCount, 1)
        XCTAssertEqual(parserTypeCount.intTypeCount, 1)
    }
    
    func testJSONParserObjectInArrayCASE3() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "[ 123, \"Lee\", true, { \"name\" : \"JIN\" }, { \"name\" : \"Lee\" } ]"
        let parserTypeCount = try! parserTest.makeJSONData(testRawJSONData1)
        XCTAssertEqual(parserTypeCount.objectTypeCount, 2)
        XCTAssertEqual(parserTypeCount.boolTypeCount, 1)
        XCTAssertEqual(parserTypeCount.stringTypeCount, 1)
        XCTAssertEqual(parserTypeCount.intTypeCount, 1)
    }
    
    func testJSONParserObjectInArrayCASE4() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "[ { \"name\" : \"Lee\" }, 123, \"Lee\", true, { \"name\" : \"JIN\" } ]"
        let parserTypeCount = try! parserTest.makeJSONData(testRawJSONData1)
        XCTAssertEqual(parserTypeCount.objectTypeCount, 2)
        XCTAssertEqual(parserTypeCount.boolTypeCount, 1)
        XCTAssertEqual(parserTypeCount.stringTypeCount, 1)
        XCTAssertEqual(parserTypeCount.intTypeCount, 1)
    }
    
    func testJSONParserObjectCase() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "{ \"name\" : \"KIM JUNG\", \"alias\" : \"JK\", \"level\" : 5, \"married\" : true }"
        let parserTypeCount = parserTest.makeObjectJSONData(testRawJSONData1)
        XCTAssertEqual(parserTypeCount.boolTypeCount, 1)
        XCTAssertEqual(parserTypeCount.stringTypeCount, 2)
        XCTAssertEqual(parserTypeCount.intTypeCount, 1)
    }
    
    func testJSONParserMethod() {
        let parserTest = JSONParser()
        let testRawJSONData1 = "[ 10, \"jk\", 4, \"314\", 99, \"crong\", false ]"
        let arrayParserCount = try! parserTest.makeArrayJSONData(testRawJSONData1)
        XCTAssertEqual(arrayParserCount.stringTypeCount, 3)
        XCTAssertEqual(arrayParserCount.intTypeCount, 3)
        XCTAssertEqual(arrayParserCount.boolTypeCount, 1)
        XCTAssertEqual(arrayParserCount.sumOfData, 7)
    }
}

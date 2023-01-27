//
//  ExtensionString.swift
//  CalculatorTests
//
//  Created by Jason on 2023/01/18.
//

import XCTest
@testable import Calculator

func test_StringExtension의_split에_String이_String배열로_나오는지() {
    // given
    var input = "StringTest"
    
    // when
    let expectation = ["StringTest"]
    
    // then
    let result = input.split(with: "a")
    XCTAssertEqual(result, expectation)
}

func test_StringExtension의_split에_String이_with에_입력된_파라미터값_기준으로_나눠지는지() {
    // given
    var input = "String+Test"
    
    // when
    let expectation = ["String","Test"]
    
    // then
    let result = input.split(with: "+")
    XCTAssertEqual(result, expectation)
}

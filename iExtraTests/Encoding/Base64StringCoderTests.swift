//
//  Base64StringEncoderTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2018-09-11.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Base64StringEncoderTests: QuickSpec {
    
    override func spec() {
        
        var coder: Base64StringCoder!
        
        beforeEach {
            coder = Base64StringCoder()
        }
        
        describe("encoding string") {
            
            it("results in base 64 encoded string") {
                let string = """
foo
bar
"""
                let encoded = coder.encode(string: string)
                expect(encoded).to(equal("Zm9vCmJhcg=="))
            }
        }
        
        describe("decoding encoded string") {
            
            it("fails for non-encoded string") {
                let string = "test"
                let decoded = coder.decode(string: string)
                expect(decoded).to(beNil())
            }
            
            it("results in base 64 encoded string") {
                let string = """
foo
bar
"""
                let encoded = coder.encode(string: string)!
                let decoded = coder.decode(string: encoded)
                expect(decoded).to(equal(string))
            }
        }
    }
}

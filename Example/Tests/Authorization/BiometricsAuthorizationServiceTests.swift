//
//  BiometricsAuthorizationServiceTests.swift
//  iExtra
//
//  Created by Saidi Daniel (BookBeat) on 2017-03-04.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class BiometricsAuthorizationServiceTests: QuickSpec {
    
    override func spec() {
        
        var service: AuthorizationService!
        
        beforeEach {
            service = BiometricsAuthorizationService()
        }
        
        
        context("when checking if user is authorized") {
            
            it("says no if no previous authorization is cached") {
                expect(service.isAuthorized(forAction: "foo")).to(equal(false))
            }
        }
        
        
        context("when resetting authorization") {
            
            it("considers user to not be previously authorized") {
                service.resetAuthorization(forAction: "foo")
                
                expect(service.isAuthorized(forAction: "foo")).to(equal(false))
            }
        }
    }
}

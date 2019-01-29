//
//  ParallellOperationCoordinatorTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class ParallellOperationCoordinatorTests: QuickSpec {
    
    override func spec() {
        
        var coordinator: TestCoordinator!
        var counter: TestCounter!
        
        beforeEach {
            coordinator = TestCoordinator()
            counter = TestCounter()
        }
        
        describe("when performing operations") {
            
            it("completes once for empty sequence") {
                var count = 0
                coordinator.performOperations([]) { _ in count += 1 }
                expect(count).to(equal(1))
            }
            
            it("completes once for non-empty sequence") {
                var count = 0
                let operation1 = TestOperation(counter: counter, performCompletion: true)
                let operation2 = TestOperation(counter: counter, performCompletion: true)
                let operations = [operation1, operation2]
                coordinator.performOperations(operations) { _ in count += 1 }
                expect(count).to(equal(1))
            }
            
            it("performs operation on each item") {
                let operation1 = TestOperation(counter: counter, performCompletion: true)
                let operation2 = TestOperation(counter: counter, performCompletion: true)
                let operations = [operation1, operation2]
                coordinator.performOperations(operations) { _ in }
                expect(counter.count).to(equal(2))
            }

            it("performs operation in parallell and is unaffected by halt") {
                let operation1 = TestOperation(counter: counter, performCompletion: true)
                let operation2 = TestOperation(counter: counter, performCompletion: false)
                let operations = [operation1, operation2]
                coordinator.performOperations(operations) { _ in }
                expect(counter.count).to(equal(2))
            }

            it("completes with resulting errors") {
//                let error = NSError(domain: "foo", code: 1, userInfo: nil )
//                let operation1 = TestOperation(counter: counter, performCompletion: true)
//                let operation2 = TestOperation(counter: counter, performCompletion: false)
//                operation2.error = error
//                let operations = [operation1, operation2]
//                var errors = [Error?]()
//                coordinator.performOperations(operations) { err in errors = err }
//                expect(errors.count).to(equal(2))
//                expect(errors[0]).to(beNil())
//                expect(errors[1]).to(be(error))
            }
        }
    }
}

private class TestCoordinator: ParallelOperationCoordinator {}

private class TestCounter {
    
    var count: Int = 0
}

private class TestOperation: iExtra.Operation {
    
    init(counter: TestCounter, performCompletion: Bool) {
        self.counter = counter
        self.performCompletion = performCompletion
    }
    
    var error: Error?
    private var counter: TestCounter
    private var performCompletion: Bool
    
    func perform(completion: @escaping Completion) {
        counter.count += 1
        guard performCompletion else { return }
        completion(error)
    }
}

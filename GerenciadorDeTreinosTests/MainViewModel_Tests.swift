//
//  MaingViewModel_Tests.swift
//  GerenciadorDeTreinosTests
//
//  Created by Luciano Puzer on 28/11/21.
//

import XCTest
@testable import GerenciadorDeTreinos

class MainViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_MainViewModel_addTraining() {
        let vm = MainViewModel()
        
        vm.addTraining(MainModel(name: "", description: "", suggestedTraining: false))
        XCTAssertEqual(vm.mainModel.count, 0)
        XCTAssertNotEqual(vm.mainModel.count, 1)
        XCTAssertGreaterThan(vm.mainModel.count, -1)
    }
}

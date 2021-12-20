//
//  WeekTrainingViewModel_Tests.swift
//  GerenciadorDeTreinosTests
//
//  Created by Luciano Puzer on 30/11/21.
//

import XCTest
@testable import GerenciadorDeTreinos

class WeekTrainingViewModel_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func test_WeekTraining_addTraining() {
        let weekVM = WeekTrainingViewModel()
        
        weekVM.addDayTraining(WeekTraining(trainingName: "", selectedDay: "", isSelectedDay: false))
        XCTAssertEqual(weekVM.weekTraining.count, 0)
        XCTAssertNotEqual(weekVM.weekTraining.count, 1)
        XCTAssertGreaterThan(weekVM.weekTraining.count, -1)
    }
    
}

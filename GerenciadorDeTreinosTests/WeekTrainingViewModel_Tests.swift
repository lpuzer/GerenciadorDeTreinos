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
        
        weekVM.addDayTraining(WeekTraining(userId: "", trainingName: "", trainingId: "", sunday: false, monday: false, twesday: false, wednesday: false, thursday: false, friday: false, saturday: false, sundayDay: "", mondayDay: "", twesdayDay: "", wednesdayDay: "", thursdayDay: "", fridayDay: "", saturdayDay: ""))
        
        XCTAssertTrue(!weekVM.filteredArray.isEmpty)
        XCTAssertFalse(weekVM.filteredArray.isEmpty)
        XCTAssertEqual(weekVM.filteredArray.count, 1)
        XCTAssertNotEqual(weekVM.filteredArray.count, 0)
        XCTAssertGreaterThan(weekVM.filteredArray.count, 0)
    }
    
}

//
//  File.swift
//  
//
//  Created by boyer on 2022/10/16.
//

import Foundation
@main struct Main {
    static func main() {
        QCKMain(
            [UnitDemoSpecs.self], // list of `QuickSpec` subclasses. to pass in.
            configuration: [], // Optional, list of QuickConfiguration subclasses to pass in. Defaults to empty array.
            testCases: [] // Optional, list of XCTestCase subclasses to pass in. Defaults to empty array.
        )
    }
}

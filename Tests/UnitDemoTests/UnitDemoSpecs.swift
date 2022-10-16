import XCTest
import Quick
@testable import UnitLib

class UnitDemoSpecs:QuickSpec {
    override func spec(){
        describe("linux支持"){
            it("Termux执行"){
                print("不支持Nimble")
            }
        }
        describe("库嵌套"){
            it("UnitLib"){
                hello()
            }
        }

    }
}

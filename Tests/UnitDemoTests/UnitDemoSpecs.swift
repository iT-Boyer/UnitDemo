import XCTest
import Quick
import Nimble
import SwiftShell
@testable import UnitLib

class UnitDemoSpecs:QuickSpec {
    override func spec(){
        describe("linux支持"){
            it("Termux执行"){
                print("不支持Nimble")
                expect(2 + 1).to(equal(2))
            }
        }
        describe("库嵌套"){
            it("UnitLib"){
                hello()
            }
        }

        describe("测试SwiftShell"){

            xit("在fastlane中不执行的操作"){
                let shell = """
                    pwd
                    ls
                    echo "hello"
                  """
                let out = SwiftShell.run(bash:shell).stdout
                print("打印：\(out)")
            }
        }
    }
}

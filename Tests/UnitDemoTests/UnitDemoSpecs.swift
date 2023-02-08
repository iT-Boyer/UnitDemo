import XCTest
import Quick
import Nimble
import SwiftShell
@testable import UnitLib
@testable import UnitDemo

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

            it("AF 测试"){
                let url = "https://httpbin.org/get"
                waitUntil(timeout: .seconds(5)) { done in
                    HelloUnit().testAF(url:url){str in
                        done()
                    }
                }
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

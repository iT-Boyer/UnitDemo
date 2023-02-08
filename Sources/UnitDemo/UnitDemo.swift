import Foundation
import ArgumentParser
import UnitLib
import Alamofire
import PMJSON
@main
//MARK: 定义自命令 struct结构体
struct HelloUnit:ParsableCommand {
    //MARK: 配置
    static var configuration = CommandConfiguration(abstract:"unit",
                                                    shouldDisplay: true)
    //新增入参数
    @Option(name:.customLong("a"),help:"测试参数说明")
    var arg:String?

    func validate() throws {
        guard let _ = arg else{
            throw ValidationError("错误")
        }
    }

    //MARK: 校验
    func run() throws {
        //MARK: 命令操作
        print("+++正在测试unit命令: \(arg!)")
       hello()
        print("--正在测试unit命令: \(arg!)")
        let url = "https://httpbin.org/get"

        let param = arg ?? ""
        if param == "1" {
            testSession(url: url)
        }
        if param == "2" {
            testAF(url: url){}
        }
    }


    func testSession(url:String) {
        let semaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(with: URL(string: url)!) {data, response, error in

            if error != nil{
                print(error!)
            }else{
                //解析
                print(response)
            }
            semaphore.signal()
        }.resume()
        _ = semaphore.wait(timeout: DispatchTime.distantFuture)

    }

    //af 阻塞同步执行无法使用信号量，导致卡住。
    //https://fix.moe/post/alamofire-synchronous
    // 使用callback 和 Quick 同步方法，实现AF 阻塞
    func testAF(url:String, callBack:@escaping(String)->Void) {
        //let semaphore = DispatchSemaphore(value: 0)
        print("---测试testAF----")
        AF.request(url).responseString { response in
            print(" 结果:\(response.value!)")
            callBack("")
            //semaphore.signal()
        }
        //_ = semaphore.wait(timeout: DispatchTime.distantFuture)
    }
}

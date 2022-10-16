import Fastlane

class UnitCli:LaneFile
{

    /** 支持带参数的lane 升级之后 使用空格 来拼接key:value
        调用语法：fastlane [lane] key value key2 value2
        终端调用：fastlane helloLane name hsg say hello
     */
    func helloLane(withOptions options:[String: String]?) {

        if let name = options?["name"], name == "hsg",
            let say:String = options?["say"], say.count > 0{
            // Only when submit is true
            echo(message: "：\(name)向你说：\(say)")
        }
    }
}

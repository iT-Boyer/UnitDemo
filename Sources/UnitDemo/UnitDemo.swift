import ArgumentParser

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
        print("正在测试unit命令: \(arg!)")
    }
}

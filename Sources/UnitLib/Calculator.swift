//面向对象编程的思想
//封装，继承，多态
//计算器的功能
//加减乘除的算法支持
//输入两个数字和运算符号，输出一个结果
//例如输入1 + 3 输出3的算法
//如何把这道题融入到设计模式里呢
//封装业务隔离UI用户交互层
//提供一个算法工具，输入两个数字和一个运算号等出结果值
//
class Calculator{
    func calculater(first:Double ,second:Double, opt:String) -> Double {
        var result:Double = 0.0
        if opt == "+" {
            result = first + second
        }
        return result
    }
}

@main
public struct UnitTest {
    public private(set) var text = "Hello, World!"

    public static func main() {
        print(UnitTest().text)
    }
}

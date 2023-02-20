import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 
 
class Codec {
    func rserialize(_ root: TreeNode?, _ str: inout String) -> String {
        if root == nil {
            str += "None,"
        } else {
            str += String(root!.val) + ","
            str = rserialize(root!.left, &str)
            str = rserialize(root!.right, &str)
        }

        return str
    }
    
    func serialize(_ root: TreeNode?) -> String {
        var str = ""
        
        return rserialize(root, &str)
    }
    
    func rdeserialize(_ l: inout [String]) -> TreeNode? {
        if l[0] == "None" {
            l.remove(at: 0)
            return nil
        }

        let v = Int(l[0])
        var root = TreeNode(v!)

        l.remove(at: 0)

        root.left = rdeserialize(&l)
        root.right = rdeserialize(&l)

        return root
    }

    
    func deserialize(_ data: String) -> TreeNode? {
        var dataList = data.components(separatedBy: ",")
        return rdeserialize(&dataList)
    }
}

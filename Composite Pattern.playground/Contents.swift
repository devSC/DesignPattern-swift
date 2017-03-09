//: Structural Pattern - Composite Pattern(组合模式)
/*:
 组合模式（Composite Pattern），又叫部分整体模式，是用于把一组相似的对象当作一个单一的对象。组合模式依据树形结构来组合对象，用来表示部分以及整体层次。这种类型的设计模式属于结构型模式，它创建了对象组的树形结构。
 这种模式创建了一个包含自己对象组的类。该类提供了修改相同对象组的方式。
 我们通过下面的实例来演示组合模式的用法。实例演示了一个组织中员工的层次结构。
 
 这里主要是  树型结构 -> 而且这个树型结构由简单的单一对象组成.
*/

import Foundation

class Employee: CustomStringConvertible {
    
    private let name: String
    private let dept: String
    private let salary: Int
    internal(set) var subordinates = [Employee]()
    
    init(name: String, dept: String, salary: Int) {
        self.name = name
        self.dept = dept
        self.salary = salary
    }
    
    func add(employee: Employee) -> Void {
        subordinates.append(employee)
    }
    
    var description: String {
        guard subordinates.isEmpty == false else {
            return "\nEmployee: [name: \(name), dept: \(dept), salary: \(salary)]"
        }
        return "\nEmployee: [name: \(name), dept: \(dept), salary: \(salary)] \(subordinates)"
    }
}


let ceo = Employee(name: "John", dept: "CEO", salary: 30000)

let headSales = Employee(name: "Rebert", dept: "Head Sales", salary: 20000)
let headMarking = Employee(name: "Michael", dept: "Head Marketing", salary: 20000)

let clerk1 = Employee(name: "Laura", dept: "Marketing", salary: 10000)
let clerk2 = Employee(name: "Bob", dept: "Marketing", salary: 10000)

let salesExecutive1 = Employee(name: "Richard", dept: "Sales", salary: 10000)
let salesExecutive2 = Employee(name: "Rob", dept: "Sales", salary: 10000)

ceo.add(employee: headSales)
ceo.add(employee: headMarking)

headSales.add(employee: salesExecutive1)
headSales.add(employee: salesExecutive2)

headMarking.add(employee: clerk1)
headMarking.add(employee: clerk2)

print("\(ceo)")








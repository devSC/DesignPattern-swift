//: Abstract Factory Pattern
/*: 抽象工厂模式（Abstract Factory Pattern）是围绕一个*超级工厂创建其他工厂*。该超级工厂又称为其他工厂的工厂。这种类型的设计模式属于创建型模式，它提供了一种创建对象的最佳方式。
 在抽象工厂模式中，接口是负责创建一个相关对象的工厂，不需要显式指定它们的类。每个生成的工厂都能按照工厂模式提供对象。
 
 意图：提供一个创建一系列相关或相互依赖对象的接口，而无需指定它们具体的类。
 主要解决：主要解决接口选择的问题。
 何时使用：系统的产品有多于一个的产品族，而系统只消费其中某一族的产品。
 如何解决：在一个产品族里面，定义多个产品。
 关键代码：在一个工厂里聚合多个同类产品。
 应用实例：工作了，为了参加一些聚会，肯定有两套或多套衣服吧，比如说有商务装（成套，一系列具体产品）、时尚装（成套，一系列具体产品），甚至对于一个家庭来说，可能有商务女装、商务男装、时尚女装、时尚男装，这些也都是成套的，即一系列具体产品。假设一种情况（现实中是不存在的，要不然，没法进入共产主义了，但有利于说明抽象工厂模式），在您的家中，某一个衣柜（具体工厂）只能存放某一种这样的衣服（成套，一系列具体产品），每次拿这种成套的衣服时也自然要从这个衣柜中取出了。用 OO 的思想去理解，所有的衣柜（具体工厂）都是衣柜类的（抽象工厂）某一个，而每一件成套的衣服又包括具体的上衣（某一具体产品），裤子（某一具体产品），这些具体的上衣其实也都是上衣（抽象产品），具体的裤子也都是裤子（另一个抽象产品）。
 优点：当一个产品族中的多个对象被设计成一起工作时，它能保证客户端始终只使用同一个产品族中的对象。
 缺点：产品族扩展非常困难，要增加一个系列的某一产品，既要在抽象的 Creator 里加代码，又要在具体的里面加代码。
 使用场景： 1、QQ 换皮肤，一整套一起换。 2、生成不同操作系统的程序。
 注意事项：产品族难扩展，产品等级易扩展。
*/

import Foundation


///MARK: Shape
protocol Shape {
    func draw()
}

class Reactangle: Shape {
    func draw() {
        print("Inside Rectangle: draw() method")
    }
}

class Square: Shape {
    func draw() {
        print("Inside Square: draw() method")
    }
}

class Circle: Shape {
    func draw() {
        print("Inside Circle: draw() method")
    }
}


///MARK: COLOR
protocol Color {
    func fill()
}

class Red: Color {
    func fill() {
        print("Inside Red: fill() methods")
    }
}

class Green: Color {
    func fill() {
        print("Inside Green: fill() methods")
    }
}

class Blue: Color {
    func fill() {
        print("Inside Blue: fill() methods")
    }
}

//protocol AbstractFactory {
//    func color(with color: String?) -> Color?
//    func shape(with shapeType: String?) -> Shape?
//}


class AbstractFactory {
    func color(with color: String?) -> Color? {
        return nil
    }
    
    func shape(with shapeType: String?) -> Shape? {
        return nil
    }
}

class ShapeFactory: AbstractFactory {
    
    override func shape(with shapeType: String?) -> Shape? {
        guard let shapeType = shapeType else { return nil }
        
        if shapeType == "CIRCLE" {
            return Circle()
        }
        else if shapeType == "RECTANGLE" {
            return Reactangle()
        }
        else if shapeType == "SQUARE" {
            return Square()
        }
        
        return nil
    }
}

class ColorFactory: AbstractFactory {
    override func color(with color: String?) -> Color? {
        guard let color = color else {
            return nil
        }
        
        if color == "RED" {
            return Red()
        }
        else if color == "GREEN" {
            return Green()
        }
        else if color == "BLUE" {
            return Blue()
        }
        return nil
    }
}

class FactoryProducer {
   class func factory(with choice: String?) -> AbstractFactory? {
        guard let choice = choice else {
            return nil
        }
        
        if choice == "SHAPE" {
            return ShapeFactory()
        }
        else if choice == "COLOR" {
            return ColorFactory()
        }
        return nil
    }
}


var factory = FactoryProducer.factory(with: "SHAPE")
var shape = factory?.shape(with: "CIRCLE")
shape?.draw()

shape = factory?.shape(with: "RECTANGLE")
shape?.draw()

shape = factory?.shape(with: "SQUARE")
shape?.draw()

factory = FactoryProducer.factory(with: "COLOR")
var color = factory?.color(with: "BLUE")
color?.fill()

color = factory?.color(with: "RED")
color?.fill()


color = factory?.color(with: "GREEN")
color?.fill()




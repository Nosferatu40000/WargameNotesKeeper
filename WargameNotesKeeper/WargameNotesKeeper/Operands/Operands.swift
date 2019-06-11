//
//  Operands.swift
//  Test_swift_project
//
//  Created by Nosferatu on 10.05.2019.
//  Copyright © 2019 Nosferatu. All rights reserved.
//

import Foundation

infix operator  <<+<
func <<+< <T>(array: inout Array<T>, item: T?) {
    
    guard let noNilItem : T = item else {
        return
    }
    array.append(noNilItem)
}

infix operator  >->>
func >->> <T>(array: inout Array<T>, item: Int) {
    
    if array.count <= item {
        return
    }
    
    array.remove(at: item)
}

infix operator  >>>
func >>> <T>(array: inout Array<T>, item: Int) -> T? {
    
    if array.count <= item {
        return nil
    }
    
    return array[item]
}

prefix operator ++
prefix func ++ (array: inout Array<String>) {
    
    var finalArray : Array<String> = []
    for str in array {
        let value = str.toInt + 1
        finalArray.append(String.fromInt(value))
    }
    
    array = finalArray
}

postfix operator <<*<
postfix func <<*< (int: inout Int) {
    
    var factorial = 1
    
    for i in 1...int {
        factorial = i * factorial
    }
    
    int = factorial
}

postfix func <<*< (array: inout Array<String>) {
    
    var finalArray : Array<String> = []
    for str in array {
        var value = str.toInt
        value<<*<
        finalArray.append(String.fromInt(value))
    }
    
    array = finalArray
}


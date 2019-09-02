import Foundation
class NumberAsserter {
    /**
     * - Note: In most cases you will want to write if(someNumber < 0)
     */
    static func negative<T: Comparable>(_ number: T, _ zero: T) -> Bool {
        return number < zero
    }
    /**
     * - Note: In most cases you will want to write if(someNumber >
     * - Fixme: ⚠️️ to avoid zero, we could pass zero to an internal private static method that then returns true or false
     */
    static func positive<T: Comparable>(_ number: T, _ zero: T) -> Bool {
        return number > zero
    }
}

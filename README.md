TypedKey
========

![Swift](https://img.shields.io/badge/Swift-2.1-orange.svg)
[![Build Status](https://travis-ci.org/devxoul/TypedKey.svg)](https://travis-ci.org/devxoul/TypedKey)
[![CocoaPods](http://img.shields.io/cocoapods/v/TypedKey.svg)](https://cocoapods.org/pods/TypedKey)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Statically-typed key for Swift.


Design Goal
-----------

A design goal of **TypedKey** is to provide statically typed key-value interface to Cocoa APIs.


At a Glance
-----------

##### Key Definition

```swift
let myKey = Key<String, Int>("myKey")
myKey.key // "myKey"
myKey.keyType // `String`
myKey.valueType // `Int`
```

##### NSUserDefaults

```swift
let userIDKey = StringKey<Int>("userID")
NSUserDefaults.standardUserDefaults().setObject(10, forKey: userIDKey)
NSUserDefaults.standardUserDefaults().objectForKey(userIDKey) // statically typed `Int?`
```

##### UITableView

```swift
let userCellIdentifier = StringKey<UserCell>("userCell")
tableView.registerCell(userCellIdentifier)
tableView.dequeueCell(userCellIdentifier) // statically typed `UserCell?`
```

##### UICollectionView

```swift
let photoCellIdentifier = StringKey<PhotoCell>("photoCell")
collection.registerCell(photoCellIdentifier)
collection.dequeueCell(photoCellIdentifier, forIndexPath: ...) // statically typed `PhotoCell?`
```

##### Anything Else?

Pull requests are welcomed 💖


Advanced Usage
--------------

#### Creating Custom Typed Key

To create your custom typed key, you should implement `TypedKey` protocol. For example, this is how `StringKey` is implemented:

```swift
public struct StringKey<Value>: TypedKey {
    public typealias KeyType = String
    public typealias ValueType = Value

    public let key: KeyType
    public init(_ key: KeyType) {
        self.key = key
    }
}
```

#### Creating Custom Interface

You can make static typing key-value interface with **TypedKey**. Functions should use generic with type constraint on `TypedKey`. A type of the value can be inferred from the generic by using `ValueType`.

```swift
func set<T: TypedKey>(key: T, value: T.ValueType) {
    // do something great
}
```

A protocol `TypedKey` has two type aliases: `KeyType` and `ValueType`. You can make generic constraints on it.

```swift
func set<T: TypedKey where T.KeyType == String, T.ValueType: AnyObject>(key: T, value: T.ValueType) {
    // do something great with String key and AnyObject value
}
```


Installation
------------

- **For iOS 8+ projects** with [CocoaPods](https://cocoapods.org):

    ```ruby
    pod 'TypedKey', '~> 0.1.0'
    ```

- **For iOS 8+ projects** with [Carthage](https://github.com/Carthage/Carthage):

    ```
    github "devxoul/TypedKey" ~> 0.1.0
    ```

- **For iOS 7 projects** with [CocoaSeeds](https://github.com/devxoul/CocoaSeeds):

    ```ruby
    github 'devxoul/TypedKey', '0.1.0', :files => 'Sources/*.swift'
    ```

- **Using [Swift Package Manager](https://swift.org/package-manager)**:

    ```swift
    import PackageDescription

    let package = Package(
        name: "MyAwesomeApp",
        dependencies: [
            .Package(url: "https://github.com/devxoul/TypedKey", "0.1.0"),
        ]
    )
    ```


License
-------

**TypedKey** is under MIT license. See the [LICENSE](LICENSE) file for more info.

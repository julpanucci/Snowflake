# Snowflake

[![CI Status](http://img.shields.io/travis/julp04/Snowflake.svg?style=flat)](https://travis-ci.org/julp04/Snowflake)
[![Version](https://img.shields.io/cocoapods/v/Snowflake.svg?style=flat)](http://cocoapods.org/pods/Snowflake)
[![License](https://img.shields.io/cocoapods/l/Snowflake.svg?style=flat)](http://cocoapods.org/pods/Snowflake)
[![Platform](https://img.shields.io/cocoapods/p/Snowflake.svg?style=flat)](http://cocoapods.org/pods/Snowflake)

## About
Make any image fall like a snowflake! ❄️ Add Snowflake to any view layer for a cool animated affect.


![Alt text](https://github.com/Julp04/Snowflake/blob/master/snowflake0.gif)

## Setup

```swift
view.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
let flake = #imageLiteral(resourceName: "flake")

let snowflake = Snowflake(view: view, particles: [flake: .white])
self.view.layer.addSublayer(snowflake)
```
## Start
```swift
snowflake.start()
```


## Stop
```swift
snowflake.stop()
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

Snowflake is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Snowflake"
```

## Author

julp04, julpanucci@gmail.com

## License

Snowflake is available under the MIT license. See the LICENSE file for more info.

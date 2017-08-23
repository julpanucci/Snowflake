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

## Add multiple particles
```swift
let flake = #imageLiteral(resourceName: "flake")
let snap = #imageLiteral(resourceName: "snap")

let redColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
let yellowColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)

let flurry = Snowflake(view: view, particles: [flake: redColor , snap:yellowColor ])
```

![Alt text](https://github.com/Julp04/Snowflake/blob/master/snowflake1.gif)


## Change Flake Size
Snowflake size is a scale from 0.0 to 1.0 (1.0 being the size of your original image) Changing the particlSize affects all snowflakes.
```swift
//Snowflake that is half its original size
snowflake.particleSizeRange = 0.5
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

import Foundation

var speedDict: [String: Int]

speedDict = [String: Int]()
speedDict = ["High Speed" : 255,
             "Mid Speed" : 170,
             "Low Speed" : 85,
             "Stopped" : 0,
             "Custom Speed" : 0]

var speedString: String
speedString = "High Speed"
var speedInt:Int
speedInt = 0
speedInt = speedDict[speedString]!

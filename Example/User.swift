import Foundation
import UIKit 
import ObjectMapper

final class User : NSObject, Mappable {

	var username : String?
	var age : Int?

	override init() { }

	public required init?(map : Map) {

	}

	func mapping(map : Map) {

		username <- map["username"]
		age <- map["age"]

	}

	func initWithRealm(realm : UserRealm) {

		username = realm.username
		age = realm.age

	}

	func mapToRealm() -> UserRealm {

		return RealmUser(value : [ "username" : self.username!,"age" : self.age! ])

	}
}

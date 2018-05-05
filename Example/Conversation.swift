import Foundation
import UIKit 
import ObjectMapper

final class Conversation : NSObject, Mappable {

	var conversationId : Int?
	var message : String?
	var sender : User?
	var receiver : User?

	override init() { }

	public required init?(map : Map) { }

	func mapping(map : Map) {

		conversationId <- map["conversationId"]
		message <- map["message"]
		sender <- map["sender"]
		receiver <- map["receiver"]
	}

	func initWithRealm(realm : ConversationRealm) {

		conversationId = realm.conversationId
		message = realm.message
		sender = realm.sender
		receiver = realm.receiver
	}

	func mapToRealm() -> ConversationRealm {

		return RealmConversation(value : [ "conversationId" : self.conversationId!,"message" : self.message!,"sender" : self.sender!,"receiver" : self.receiver! ])
	}
}
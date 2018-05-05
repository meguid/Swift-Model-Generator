import Foundation
import RealmSwift

class ConversationRealm : Object {

	dynamic var conversationId = Int()
	dynamic var message = String()
	dynamic var sender = User()
	dynamic var receiver = User()

}

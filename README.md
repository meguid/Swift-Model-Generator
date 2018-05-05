# Swift-Model-Generator
A Python script generates Swift Models + Object Mapper + Realm 

## Basic Usage

### Run the Python Scipt

```python
$ python ModelGenerator.py
```

### Set the model title

```bash
$ User
```

### Set the model parameters

```bash
$ username String
$ age Int
```

### Finish
```bash
$ finish X
```


BINGO! Now you've got your `User.Swift` and `UserRealm.swift` files.


```swift
final class User : NSObject, Mappable {

	var username : String?
	var age : Int?

	override init() { }

	public required init?(map : Map) { }

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
```


```swift
class UserRealm : Object {

	dynamic var username = String()
	dynamic var age = Int()
}
```

## Nested Models

### Generate new model
```bash
$ python ModelGenerator.py
$ Conversation
$ conversationId Int
$ message String
$ sender User
$ receiver User
$ finish X
```


```swift
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
```

```swift
class ConversationRealm : Object {

	dynamic var conversationId = Int()
	dynamic var message = String()
	dynamic var sender = User()
	dynamic var receiver = User()
}
```

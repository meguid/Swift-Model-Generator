# Swift-Model-Generator
A Python script generates Swift Models + Object Mapper + Realm 

## Usage

### Run the Python Scipt

```python
python ModelGenerator.py
```

### Set the model title

```python
User
```

### Set the model parameters

```python
username String
age Int
```

### Finish
```python
finish X
```


BINGO! Now you've got your `User.Swift` and `UserRealm.swift` files.


```swift
import Foundation
import UIKit 
import ObjectMapper

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
import Foundation
import RealmSwift

class UserRealm : Object {

	dynamic var username = String()
	dynamic var age = Int()
}
```

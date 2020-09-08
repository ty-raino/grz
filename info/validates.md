```
class Person < ActiveRecord::Base
    validates :name, presence: true
end

Person.create(name: "John Doe").valid? # => true
Person.create(name: nil).valid? # => false
```

Validations are used to ensure that only valid 
data is saved into your database.
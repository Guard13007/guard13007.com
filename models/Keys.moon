import Model, enum from require "lapis.db.model"

class Keys extends Model
    @timestamp: true

    @types: enum {
        steam: 1
        humblebundle: 2
        origin: 3
        uplay: 4
        other: 5
    }

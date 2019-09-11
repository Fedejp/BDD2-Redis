--Buildings
redis.call("sadd","buildings", "AL1")
redis.call("hset","buildings:AL1", "name","Alisa I","address", "Santa Fe 456")
redis.call("sadd","buildings", "SOG")
redis.call("hset","buildings:SOG", "name","Soho Garden","address", "Arevalo 602")
redis.call("sadd","buildings", "CAT")
redis.call("hset","buildings:CAT", "name","Caballito Tower","address", "Acoyte 700")
--redis.call("echo", "Buildings added")

--Owners
redis.call("sadd", "owners",963)
redis.call("hset","owners:963", "name", "Axel", "surname", "Roitman")
redis.call("sadd", "owners",987)
redis.call("hset","owners:987", "name", "Ale", "surname", "Armengol")
redis.call("sadd", "owners",123)
redis.call("hset","owners:123", "name", "Federico", "surname", "Parodi")
redis.call("sadd", "owners",456)
redis.call("hset","owners:456", "name", "Santiago", "surname", "Yanzon")
redis.call("sadd", "owners",789)
redis.call("hset","owners:789", "name", "Claudio", "surname", "Godio")
redis.call("sadd", "owners",147)
redis.call("hset","owners:147", "name", "Donald", "surname", "Trump")
redis.call("sadd", "owners",258)
redis.call("hset","owners:258", "name", "Bad", "surname", "Bunny")
redis.call("sadd", "owners",369)
redis.call("hset","owners:369", "name", "Morgan", "surname", "Freeman")
redis.call("sadd", "owners",741)
redis.call("hset","owners:741", "name", "Ricardo", "surname", "Arjona")
redis.call("sadd", "owners",852)
redis.call("hset","owners:852", "name", "Jennifer", "surname", "Lopez")
redis.call("sadd", "owners",321)
redis.call("hset","owners:321", "name", "Rosalia", "surname", "La")
--redis.call("echo", "Owners added")

--Units
redis.call("sadd","buildings:AL1:units", "1A")
redis.call("hset","buildings:AL1:units:1A", "status", "for sale","tenant", 0)
redis.call("sadd","buildings:AL1:units", "1B")
redis.call("hset","buildings:AL1:units:1B", "status", "for rent","tenant", 0)
redis.call("sadd","buildings:AL1:units", "2A")
redis.call("hset","buildings:AL1:units:2A", "status", "sold","tenant", 0)
redis.call("sadd","buildings:AL1:units", "2B")
redis.call("hset","buildings:AL1:units:2B", "status", "rented","tenant", 1)

redis.call("sadd","buildings:SOG:units", "1A")
redis.call("hset","buildings:SOG:units:1A", "status", "for sale","tenant", 0)
redis.call("sadd","buildings:SOG:units", "1B")
redis.call("hset","buildings:SOG:units:1B", "status", "rented","tenant", 1)
redis.call("sadd","buildings:SOG:units", "1C")
redis.call("hset","buildings:SOG:units:1C", "status", "rented","tenant", 1)
redis.call("sadd","buildings:SOG:units", "2A")
redis.call("hset","buildings:SOG:units:2A", "status", "sold","tenant", 0)
redis.call("sadd","buildings:SOG:units", "2B")
redis.call("hset","buildings:SOG:units:2B", "status", "rented","tenant", 1)
redis.call("sadd","buildings:SOG:units", "2C")
redis.call("hset","buildings:SOG:units:2C", "status", "for rent","tenant", 0)

redis.call("sadd","buildings:CAT:units", "1A")
redis.call("hset","buildings:CAT:units:1A", "status", "for sale","tenant", 0)
redis.call("sadd","buildings:CAT:units", "1B")
redis.call("hset","buildings:CAT:units:1B", "status", "for sale","tenant", 0)
redis.call("sadd","buildings:CAT:units", "2A")
redis.call("hset","buildings:CAT:units:2A", "status", "for rent","tenant", 0)
redis.call("sadd","buildings:CAT:units", "2B")
redis.call("hset","buildings:CAT:units:2B", "status", "sold","tenant", 0)
redis.call("sadd","buildings:CAT:units", "3A")
redis.call("hset","buildings:CAT:units:3A", "status", "sold","tenant", 0)
redis.call("sadd","buildings:CAT:units", "3B")
redis.call("hset","buildings:CAT:units:3B", "status", "for sale","tenant", 1)
--redis.call("echo", "All units per building added")

--Ownership
redis.call("sadd","buildings:AL1:units:1A:owners", "owners:963")
redis.call("sadd","buildings:AL1:units:1B:owners", "owners:987")
redis.call("sadd","buildings:AL1:units:2A:owners", "owners:123")
redis.call("sadd","buildings:AL1:units:2B:owners", "owners:456")

redis.call("sadd","owners:963:owns", "buildings:AL1:units:1A")
redis.call("sadd","owners:987:owns", "buildings:AL1:units:1B")
redis.call("sadd","owners:123:owns", "buildings:AL1:units:2A")
redis.call("sadd","owners:456:owns", "buildings:AL1:units:2B")

redis.call("sadd","buildings:SOG:units:1A:owners", "owners:789","owners:852")
redis.call("sadd","buildings:SOG:units:1B:owners", "owners:147")
redis.call("sadd","buildings:SOG:units:2A:owners", "owners:147")
redis.call("sadd","buildings:SOG:units:1C:owners", "owners:147")
redis.call("sadd","buildings:SOG:units:2A:owners", "owners:147")
redis.call("sadd","buildings:SOG:units:2B:owners", "owners:147")
redis.call("sadd","buildings:SOG:units:2C:owners", "owners:258")

redis.call("sadd","owners:456:owns", "buildings:SOG:units:1A")
redis.call("sadd","owners:852:owns", "buildings:SOG:units:1A")
redis.call("sadd","owners:147:owns", "buildings:SOG:units:1B")
redis.call("sadd","owners:147:owns", "buildings:SOG:units:2B")
redis.call("sadd","owners:147:owns", "buildings:SOG:units:1C")
redis.call("sadd","owners:147:owns", "buildings:SOG:units:2A")
redis.call("sadd","owners:147:owns", "buildings:SOG:units:2B")
redis.call("sadd","owners:258:owns", "buildings:SOG:units:2C")

redis.call("sadd","buildings:CAT:units:3A:owners", "owners:123","owners:321")
redis.call("sadd","buildings:CAT:units:3B:owners", "owners:369")
redis.call("sadd","buildings:CAT:units:2A:owners", "owners:741")
redis.call("sadd","buildings:CAT:units:2B:owners", "owners:456")

redis.call("sadd","owners:123:owns", "buildings:CAT:units:3A")
redis.call("sadd","owners:321:owns", "buildings:CAT:units:3A")
redis.call("sadd","owners:369:owns", "buildings:CAT:units:3B")
redis.call("sadd","owners:741:owns", "buildings:CAT:units:2A")
redis.call("sadd","owners:456:owns", "buildings:CAT:units:2B")
redis.call("sadd","owners:456:owns", "buildings:CAT:units:2B")
--redis.call("echo", "Ownership relations added")

--redis.call("echo", "Dataset ready")




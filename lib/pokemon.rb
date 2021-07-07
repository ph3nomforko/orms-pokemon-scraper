class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @name = name
        @type = type
        @db = db
        @id = id
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        pokemon = db.execute(sql, id).flatten
        pokemon = Pokemon.new(id: id, name: pokemon[1], type: pokemon[2], db: db)
        pokemon
    end
end

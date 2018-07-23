class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [name, type])
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", [id]).flatten
    Pokemon.new(id: data[0], name: data[1], type: data[2], hp: data[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", [new_hp, self.name])
  end
end

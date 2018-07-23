require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    ins = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    ins.execute(name, type)
  end

  def self.find(id, db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    # binding.pry
    new_pokemon = Pokemon.new(id: id, name: pokemon_from_db[0][1], type: pokemon_from_db[0][2], db: db, hp: pokemon_from_db[0][3])
  end
  # The find method should create a new Pokemon object with an id, type, name AND hp after selecting their row from the database by their id number.
  # remember to also update the initialize method to accept an argument of hp that defaults to nil if not set (so it still passes the non-bonus tests)
  def alter_hp(new_hp, db)
    #self is an instance (individual pokemon) of the Pokemon class
    #self.id is id number
    #need to find the right pokemon, then UPDATE hp column
    update = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    update.execute(new_hp, self.id)
  end

end

require 'pry'
require_relative './scraper.rb'
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
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db_pokemon = db.execute("SELECT*FROM Pokemon WHERE id = ?", id).flatten
    new_pokemon = Pokemon.new(id: db_pokemon[0], name: db_pokemon[1], type: db_pokemon[2], db: db, hp: db_pokemon[3])
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", new_hp, id)

  end
end

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp =  hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_number, db)
    p_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten
    Pokemon.new(id: p_info[0], name: p_info[1], type: p_info[2], hp: p_info[3], db: db)
  end

end

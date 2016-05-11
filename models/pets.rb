require( 'pg')
require( 'pry-byebug')
require_relative( '../db/sql_runner.rb')
require_relative( './store.rb')

class Pets

  attr_accessor :id, :name, :image, :store_id

  def initialize ( options)
    @id = options['id']
    @name = options['name']
    @image = options['image']
    @store_id = options['store_id']
  end

  def save
      sql = "INSERT INTO stores (name, image, store_id ) 
      VALUES ('#{@name}', '#{@image}' #{@store_id}') RETURNING *"
      pet = SqlRunner.run( sql ).first
      result = Store.new( store ) 
      return result
  end

  def self.find( )
      sql = "SELECT * FROM stores"
      store = SqlRunner.run( sql).first
      result = store.map { |store| Store.new( store)}
      return result
  end


  def self.all()
    sql = "SELECT * FROM pets"
    pets = SqlRunner.run(sql)
    result = pets.map {|pet| Pet.new (pet )}
    return result
  end


   def update()
       sql = "UPDATE pets 
         SET name = #{@name}
         address = #{@address}
         store_id = #{@store_id}
         WHERE id = #{@id}"
       SqlRunner.run( sql )
   end

   def delete()
       sql = "DELETE FROM pets WHERE id = #{@id}"
       SqlRunner.run( sql )
   end

   def store
    sql = "SELECT * FROM stores WHERE store_id  = #{@store_id}"
    store = SqlRunner.run( sql ).first
    result = Store.new( stores)
    return result
   end

end

binding.pry
nil
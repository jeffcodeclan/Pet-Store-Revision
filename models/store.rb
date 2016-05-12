require( 'pg')
require( 'pry-byebug')
require_relative( '../db/sql_runner.rb')
require_relative( './pets')


class Store

  attr_accessor :id, :name, :address, :stock_type

  def initialize ( options)
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
    @stock_type = options['stock_type']
  end

    def save
    sql = "INSERT INTO stores (name, address, stock_type ) 
    VALUES ('#{@name}', '#{@address}' #{@stock_type}') RETURNING *"
    store= SqlRunner.run( sql ).first
    result = Store.new( store ) 
    return result
  end

  def self.find( )
    sql = "SELECT * FROM stores"
    store = SqlRunner.run( sql).first
    result = store.map { |store| Store.new( store)}
    return result
  end

  def delete()
    sql = "DELETE FROM store WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def update()
    sql = "UPDATE store 
      SET name = '#{@name},'
      address = '#{@address},'
      stock_type = '#{@stock_type}'
      WHERE id = #{@id}"
    SqlRunner.run( sql )
  end

  def pets
    sql = "SELECT * FROM pets WHERE store_id = #{@id}"
    pets = SqlRunner.run(sql)
    result = pet.map { |pet| Pet.new(pet)}
    return result
   end 
end    

binding.pry
nil

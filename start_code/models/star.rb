require_relative("../db/sql_runner")

class Star

    attr_reader :id
    attr_accessor :first_name, :last_name

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
    end

    def save()
        sql = "insert into stars (first_name, last_name)
        values ($1, $2)
        returning id"
        values = [@first_name, @last_name]
        star = SqlRunner.run(sql, values).first
        @id = star['id'].to_i
    end

    def self.delete_all()
        sql = "DELETE FROM stars"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE * from stars where id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "select * from stars"
        stars = SqlRunner.run(sql)
        return results = self.map_items(stars)
    end

    def self.find(id)
        sql = "select * from stars where id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Star.new(results.first)
    end

    def update()
        sql = "update stars set
        (first_name, last_name)
        = ($1, $2)
        where id = $3"
        values = [@first_name, @last_name, @id]
        SqlRunner.run(sql, values)
    end


    def self.map_items(data)
        return data.map {|location| Star.new(location)}
    end
end

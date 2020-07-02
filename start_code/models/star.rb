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

end

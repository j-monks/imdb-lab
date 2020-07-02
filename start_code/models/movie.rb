require_relative("../db/sql_runner")

class Movie

    attr_reader :id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @title = options['title']
        @genre = options['genre']
    end

    def save()
        sql = "insert into movies (title, genre)
        values ($1, $2)
        returning id"
        values = [@title, @genre]
        movie = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
    end

    def self.delete_all()
        sql = 'delete from movies'
        SqlRunner.run(sql)
    end

end

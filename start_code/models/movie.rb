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

    def delete()
        sql = "DELETE * from movies where id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "select * from movies"
        movies = SqlRunner.run(sql)
        return results = self.map_items(movies)
    end

    def self.find(id)
        sql = "select * from movies where id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        return Movie.new(results.first)
    end
    
    def update()
        sql = "update movies set
        (title, genre)
        = ($1, $2)
        where id = $3"
        values = [@title, @genre, @id]
        SqlRunner.run(sql, values)
    end

    def self.map_items(data)
        return data.map {|location| Movies.new(location)}
    end

end

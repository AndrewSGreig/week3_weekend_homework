require_relative("../db/sql_runner")

class Screening
  attr_reader :id
  attr_accessor :film_id, :time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @time = options['time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, time)
      VALUES ($1, $2) RETURNING ID"
    values = [@film_id, @time]
    screening =SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end
end

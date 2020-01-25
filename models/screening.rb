require_relative("../db/sql_runner")

class Screening
  attr_reader :id
  attr_accessor :film_id, :screening_time

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @screening_time = options['screening_time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, screening_time)
      VALUES ($1, $2) RETURNING ID"
    values = [@film_id, @screening_time]
    screening =SqlRunner.run(sql, values).first
    @id = screening['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM screenings"
    results = SqlRunner.run(sql)
    return results.map{|screening| Screening.new(screening)}
  end


  # def count_tickets_sold_for_each_screening()
  #     number_of_screenings = screenings.count;
  #     tickets_sold_for_each_screening =[]
  #     for screenings = 1 to number_of_screenings
  #       Screening.new()
  #     end
  # end

  def tickets_sold_for_screening()
    #return the number of tickets for screening

    screening_id = @screening_id
    sql = "SELECT COUNT(screening_id) FROM tickets WHERE screening_id = $1;"

    values = [@screening_id]
    result = SqlRunner.run(sql, values)
    return result.count;
  end

  ### count the number of tickets sold for each screening
  ###### - done in def count_tickets_sold_for_each_screening()
### loop round each entry in the screenings table
### for each one count the number of tickets sold and add resuklt to an array


def count_tickets_sold_for_each_screening()
  # binding.pry
  # for screening in screenings.count
  #   @tickets_sold_for_each_screening << tickets_sold_for_screening
  # end
  # # tickets_sold_for_each_screening = {'screening_id' => $id, 'tickets sold' => screening1.tickets_sold_for_screening}
  # tickets_sold_for_each_screening[screening1.tickets_sold_for_screening
  # tickets_sold_for_screening3 =  screening3.how_many_tickets_sold_for_screening
  # p tickets_sold_for_screening3

  # def count_tickets_sold_for_each_screening()
  #     number_of_screenings = screenings.count;
  #     tickets_sold_for_each_screening =[]
  #     for screenings = 1 to number_of_screenings
  #       Screening.new()
  #     end
  # end

  # @current_guests << guest
  #     guest.available_cash -= @entrance_fee
  #     # p @song_list
  #     for song in @song_list
  #
  #       if song = guest.fav_song
  #         p "FAVOURITE SONG FOUND!!!!!!!!!!!!!!"
  #       end
  #     end
  #
end

end

require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()


customer1 = Customer.new({
  'name' => 'John Doe',
  'funds' => 10
})
customer1.save()

customer2 = Customer.new({
  'name' => 'Sylvia Blackstock',
  'funds' => 5
})
customer2.save()

customer3 = Customer.new({
  'name' => 'Paul Willis',
  'funds' => 50
})
customer3.save()

film1 = Film.new({
  'title' => 'Shawshank Redemption',
  'price' => 7
})
film1.save();

film2 = Film.new({
  'title' => 'Godfather',
  'price' => 9
  })
film2.save();

film3 = Film.new({
  'title' => 'Godfather III',
  'price' => 2
  })
film3.save();

film2.title = "Godfather II"
film2.update

film3.delete()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })
ticket1.save

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })
ticket2.save

ticket3 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film2.id
  })
ticket3.save

customer2.funds = 25
customer2.update

customer1.buy_tickets_remove_cash(film2)
customer1.update


customer_ticket_count = customer2.tickets_bought_by_customer
p customer_ticket_count

tickets_sold_for_film = film2.count_tickets_sold_for_film
p tickets_sold_for_film

# binding.pry
 customer3.delete()

binding.pry
nil

require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  erb(:elephant)
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  @rolls = []

  2.times do
    die_roll = rand(1..6)
    @rolls.push(die_roll)
  end
	
 erb(:two_six)
end

get("/dice/2/10") do
  @rolls = []

  2.times do
    die_roll = rand(1..10)
    @rolls.push(die_roll)
  end
  erb(:two_ten)
end

get("/dice/1/20") do
  @rolls = []

  1.times do
    die_roll = rand(1..20)
    @rolls.push(die_roll)
  end

  erb(:one_twenty)
end

get("/dice/5/4") do
  @rolls = []
  
  5.times do
    die_roll = rand(1..4)

    @rolls.push(die_roll)
  end

  erb(:five_four)
end

get("/dice/100/6") do
  @rolls = []

  100.times do
    die = rand(1..6)

    @rolls.push(die)
  end
  erb(:onehundred_six)
end

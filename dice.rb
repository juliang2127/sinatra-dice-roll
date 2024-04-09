require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"

use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "<h1>DICE ROLL</h1>
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice<a/></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided dice<a/></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice<a/></li>
  </ul>
    "
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die
	
  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."
	
  "<h1>2d6</h1>
   <p>#{outcome}</p>"
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}"

  "<h1>2d10</h1>
    <p>#{outcome}</p>"
end

get("/dice/1/20") do
  die_roll = rand(1..20)
  outcome = outcome = "You rolled a #{die_roll}"

  "<h1>1d20</h1>
  <p>#{outcome}</p>"
end

get("/dice/5/4") do
  dice_1 = rand(1..4)
  dice_2 = rand(1..4)
  dice_3 = rand(1..4)
  dice_4 = rand(1..4)
  dice_5 = rand(1..4)
  sum = dice_1 + dice_2 + dice_3 + dice_4 + dice_5

  outcome = "You rolled a #{dice_1}, a #{dice_2}, a #{dice_3}, a #{dice_4} and a #{dice_5} for a total of #{sum}"

"<h1>5d4</h1>
  <p>#{outcome}</p>"
end

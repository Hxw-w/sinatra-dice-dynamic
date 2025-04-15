require "sinatra"
require "sinatra/reloader"

# get("/") do
#   erb(:homepage)
# end

# get("/dice/2/6") do
#   @rolls = []

#   2.times do
#     die = rand(1..6)

#     @rolls.push(die)
#   end

#   erb(:two_six)
# end

# get("/dice/2/10") do
#   @rolls = []

#   2.times do
#     die = rand(1..10)

#     @rolls.push(die)
#   end

#   erb(:two_ten)
# end

# get("/dice/1/20") do
#   @rolls = []

#   1.times do
#     die = rand(1..20)

#     @rolls.push(die)
#   end

#   erb(:one_twenty)
# end

# get("/dice/5/4") do
#   @rolls = []

#   5.times do
#     die = rand(1..4)

#     @rolls.push(die)
#   end

#   erb(:five_four)
# end

# app.rb

get("/") do
  erb(:homepage)
end

# A dynamic route that captures :num_dice and :num_sides from the URL
# Example: /dice/2/6 => roll 2 six-sided dice
get("/dice/:num_dice/:num_sides") do
  @num_dice  = params[:num_dice].to_i
  @num_sides = params[:num_sides].to_i
  @rolls     = []

  @num_dice.times do
    die = rand(1..@num_sides)
    @rolls.push(die)
  end

  erb(:dice)
end

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <title>Dice Roller</title>
  <style>
    body {
      text-align: center;
      font-family: helvetica, arial;
      font-size: 22px;
      color: #888;
      margin: 20px;
    }
    #c {
      margin: 0 auto;
      width: 500px;
      text-align: left;
    }
  </style>
</head>
<body>
  <div id="c">
    <%= yield %>
  </div>
</body>
</html>

@@ homepage
<h1>Dice Roll</h1>
<p>
  Try going to one of these URLs (or any <em>dice/sides</em> combo):
</p>
<ul>
  <li><a href="/dice/2/6">/dice/2/6</a> (roll 2 six-sided dice)</li>
  <li><a href="/dice/2/10">/dice/2/10</a> (roll 2 ten-sided dice)</li>
  <li><a href="/dice/1/20">/dice/1/20</a> (roll 1 twenty-sided die)</li>
  <li><a href="/dice/5/4">/dice/5/4</a> (roll 5 four-sided dice)</li>
</ul>

@@ dice
<!-- Heading showing "[num_dice]d[num_sides]" -->
<h1><%= @num_dice %>d<%= @num_sides %></h1>

<!-- List the results of the dice rolls in <li> elements -->
<ul>
  <% @rolls.each do |roll| %>
    <li><%= roll %></li>
  <% end %>
</ul>

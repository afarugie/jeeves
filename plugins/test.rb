class Test
  include Cinch::Plugin
  match /test$/

  def execute(m)
    output = Format(:underline, "Hello %s!  Here is a color %s!" % [Format(:bold, "stranger"), Format(:red, "red")])
    m.reply output
  end
end

module PlayersHelper 

  def ftime(player)
    player.event_date.strftime("%b %d, %Y")
  end

  def average_stats(player)
    stats = {}
    @stat_fields.each do |field, abbr|
      avg = (player.send(field.to_sym).to_f / player.lines.count).to_f
      stats[abbr] = avg
    end
    stats
  end

end
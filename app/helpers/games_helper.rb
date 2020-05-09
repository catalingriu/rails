module GamesHelper
    def format_time(time)
        time.to_time.in_time_zone("Europe/Bucharest").strftime('%d %b %Y at %H:%M')
    end
end

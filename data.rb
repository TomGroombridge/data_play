require 'csv'

["FT 3","HT 4"].each do |n|
	half_time = CSV.foreach("../eng-england/2010s/2013-14/1-premierleague.csv").map{|row| row[n[-1, 1].to_i]}

	half_time.shift

	half_time_goals = half_time.map {|r| r.split("-")}

	draws = half_time_goals.map do |g|
		if g[0] == g[1]
			true
		else
			false
		end
	end

	data = draws.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }

	chance_of_draw_at_half_time = (data[true].to_f / draws.count.to_f)
	chance_of_not_a_draw_at_half_time = (data[false].to_f / draws.count.to_f)

	puts "#{n[0,2]} draw chances: #{chance_of_draw_at_half_time}"
	puts "Not #{n[0,2]} draw chances: #{chance_of_not_a_draw_at_half_time}"
	puts "-------------------------------------"

end
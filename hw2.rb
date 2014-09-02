# Siraphob Boonvanich 5631358821
# Viranpat Vongswasdi 5631332421

require 'csv'
#CSV.foreach("data.csv") do |row|
#File.open("data.csv").read.split("\n").each do |line| 
data = CSV.read('data.csv', headers:true) #=> <CSV::Table mode:col_or_row row_count:5>
#p data.to_a 
highestscore = ''
highestscoreStudent = ''
lowestscore = '999'
lowestscoreStudent = ''
allscore = 0
color = [0,0,0] # red blue yellow
def capandlow(a)
   name = a.split(" ")
   if name.length == 3	   	
	    name[0][name[0].length-1] = name[0][name[0].length-1].capitalize # last letter of firstname
	    name[2][name[2].length-1] = name[2][name[2].length-1].capitalize # last letter of Lastname
   		name[0][0] = name[0][0].downcase  # fist letter of firstname
   		name[2][0] = name[2][0].downcase # fist letter of Lastname   
   		fullname = name[0]+' '+name[1]+' '+name[2]
	else
	    name[0][name[0].length-1] = name[0][name[0].length-1].capitalize # last letter of firstname
	    name[1][name[1].length-1] = name[1][name[1].length-1].capitalize # last letter of Lastname
   		name[0][0] = name[0][0].downcase  # fist letter of firstname
   		name[1][0] = name[1][0].downcase # fist letter of Lastname   
   		fullname = name[0]+' '+name[1]
	end
   return fullname
end
p 'Student List: '
	for i in 0..data.length-1
		p capandlow(data[i][0])
		allscore += data[i][1].to_f
   		if data[i][1] > highestscore
   			highestscore = data[i][1]
   			highestscoreStudent = data[i][0]
		end
   		if data[i][1] < lowestscore
   			lowestscore = data[i][1]
   			lowestscoreStudent = data[i][0]
		end
		if data[i][2] == 'Blue'
			color[0]+=1
		elsif data[i][2] == 'Red'
			color[1]+=1
		elsif data[i][2] == 'Yellow'
			color[2]+=1
		end
							
	end
print 'Highest Score Student: '; puts highestscoreStudent+', '+highestscore
print 'Lowest Score Student: '; puts lowestscoreStudent+', '+lowestscore
print 'Mean score: '; puts allscore/data.length
print 'Most popular color is ';
if (color[0].to_i > color[1].to_i && color[0].to_i > color[2].to_i)
	p 'Blue'
elsif (color[1].to_i > color[0].to_i && color[1].to_i > color[2].to_i)
	p 'Red'
elsif (color[1].to_i > color[0].to_i && color[1].to_i == color[2].to_i)
	p 'Red and Yellow'
elsif (color[2].to_i > color[0].to_i && color[1].to_i == color[2].to_i)
	p 'Blue and Red'
elsif (color[0].to_i > color[1].to_i && color[0].to_i == color[2].to_i)
	p 'Blue and Yellow'
else
	p 'Yellow'
end
print 'Most least popular color is ';
if (color[0].to_i < color[1].to_i && color[0].to_i < color[2].to_i)
	p 'Blue'
elsif (color[1].to_i < color[0].to_i && color[1].to_i < color[2].to_i)
	p 'Red'
elsif (color[1].to_i < color[0].to_i && color[1].to_i == color[2].to_i)
	p 'Red and Yellow'
elsif (color[2].to_i < color[0].to_i && color[1].to_i == color[2].to_i)
	p 'Blue and Red'
elsif (color[0].to_i < color[1].to_i && color[0].to_i == color[2].to_i)
	p 'Blue and Yellow'
else
	p 'Yellow'
end
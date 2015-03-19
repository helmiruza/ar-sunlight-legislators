
require_relative 'app/models/congressmember'

def by_state(state)

	puts "Senators:"
	Congressmember.where(title:'Sen', state: state).order('lastname').each do |cm|
		puts "#{cm.firstname} #{cm.middlename} #{cm.lastname} (#{cm.party})"
	end

	puts ""
	puts "Representatives:"
	Congressmember.where(title:'Rep', state: state).order('lastname').each do |cm|
		puts "#{cm.firstname} #{cm.middlename} #{cm.lastname} (#{cm.party})"
	end
end

def percentage_of_gender(gender)
	case gender
	when "M" then
	malesen = Congressmember.where(gender:'M', title:'Sen', in_office:'1').count
	in_off = Congressmember.where(title:'Sen',in_office:'1').count
	malerep = Congressmember.where(gender:'M', title:'Rep', in_office:'1').count

		puts "Male Senators: #{malesen} (#{((malesen/in_off.to_f)*100).round}%)"
		puts "Male Representatives: #{malerep} (#{((malesen/in_off.to_f)*100).round}%)"
	when "F" then
	femalesen = Congressmember.where(gender:'F', title:'Sen', in_office:'1').count
	femalerep = Congressmember.where(gender:'F', title:'Rep', in_office:'1').count
	
		puts "Male Senators: #{femalesen} (#{((femalesen/in_off.to_f)*100).round}%)"
		puts "Male Representatives: #{femalerep} (#{((femalesen/in_off.to_f)*100).round}%)"
	end
end

def active_by_state
	# cong_by_state = Congressmember.where(in_office: '1').group(:state).order('state DESC').count
	states = []
	cong_by_state = Congressmember.where(in_office: '1').group(:state).order('count(*) DESC').count
	cong_by_state.each do |key,value|
		states << key
	end
	states.each do |x|
		puts "#{x}: #{Congressmember.where(in_office: '1',state: x,title: 'Sen').count} Senators, #{Congressmember.where(in_office: '1',state: x,title: 'Rep').count} Representatives(s)"
	end
end

def total_sen_rep
	puts "Senators :#{Congressmember.where(title: 'Sen').count}"
	puts "Representatives :#{Congressmember.where(title: 'Rep').count}" 
end

def delete_inactive
	Congressmember.where(in_office: '0').destroy_all
	total_sen_rep
end
cm = Congressmember.new
by_state('NY')
percentage_of_gender('M')
active_by_state
total_sen_rep
delete_inactive

dbrenew:
	rake db:drop && rake db:create && rake db:migrate && rake db:seed

spill:
	rake queues:spill

points:
	rake queues:points

commissions:
	rake commissions:payment

reset:
	make dbrenew && make spill && make points && make commissions

deploy:
	bundle exec cap production deploy

up:
	RAILS_ENV=development bash ./server.sh

dbsetup:
	rake db:setup && rake db:migrate && rake db:seed

guard:
	bundle exec guard

test:
	bundle exec rspec
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   Mayor.create(name: 'Emanuel', city: cities.first)

org = Organization.create(name:"flatiron school",subdomain:"flatiron")
u0 = User.create(name:"Avi Flombaum", email:"student0@flatironschool.com", password:"password",organization:org)

u18 = User.create(name:"Aaron Streiter", email:"student1@gmail.com", password:"password",organization:org)
u8 = User.create(name:"Adam Jonas", email:"student2@flatironschool.com", password:"password",organization:org)
u9 = User.create(name:"Akiva Leeder", email:"student3@gmail.com", password:"password",organization:org)
u20 = User.create(name:"Brad Wheel", email:"student4@flatironschool.com", password:"password",organization:org)
u3 = User.create(name:"Corinna Brock", email:"student5@gmail.com", password:"password",organization:org)
u1 = User.create(name:"David Baker", email:"student6@davidbaker.tv", password:"password",organization:org)
u17 = User.create(name:"Ericka Ward", email:"student7@gmail.com", password:"password",organization:org)
u13 = User.create(name:"Jack Nolan", email:"student8@jacknolan.com", password:"password",organization:org)
u2 = User.create(name:"James Vanneman", email:"student9@flatironschool.com", password:"password",organization:org)
u16 = User.create(name:"Jenya Zueva", email:"student10@gmail.com", password:"password",organization:org)
u4 = User.create(name:"Stephen Chen", email:"student11@gmail.com", password:"password",organization:org)
u5 = User.create(name:"Rex Feng", email:"student12@gmail.com", password:"password",organization:org)
u6 = User.create(name:"Joseph DeVenuta", email:"student13@venator.vc", password:"password",organization:org)
u7 = User.create(name:"Kevin Curtin", email:"student14@gmail.com", password:"password",organization:org)
u10 = User.create(name:"Kevin McNamee", email:"student15@gmail.com", password:"password",organization:org)
u11 = User.create(name:"Josh Rowley", email:"student16@gmail.com", password:"password",organization:org)
u12 = User.create(name:"Li Ouyang", email:"student17@gmail.com", password:"password",organization:org)
u14 = User.create(name:"Matt Salerno", email:"student18@gmail.com", password:"password",organization:org)
u19 = User.create(name:"Nikhil Thomas", email:"student19@flatironschool.com", password:"password",organization:org)

#### groups #####


flatironschool = Group.create(name:"flatironschool")

assignmentio = Group.create(name:"assignmentio")
teamline = Group.create(name:"teamline")
quizbo = Group.create(name:"quizbo")
handraise = Group.create(name:"handraise")
gitbo = Group.create(name:"gitbo")

flatironschool.created_by = u0

assignmentio.created_by = u0
teamline.created_by = u0
quizbo.created_by = u0
handraise.created_by = u0
gitbo.created_by = u0



flatironschool.user_names= ((User.all - [u0]).collect(&:name).join(","))
assignmentio.user_names = [u13.name,u2.name,u3.name,u18.name].join(",")
teamline.user_names = [u1.name,u17.name,u14.name,u7.name].join(",")
quizbo.user_names = [u4.name,u5.name,u9.name,u19.name].join(",")
handraise.user_names = [u12.name,u6.name,u20.name].join(",")
gitbo.user_names = [u8.name,u16.name,u11.name,u10.name].join(",")

flatironschool.save

assignmentio.save
teamline.save
quizbo.save
handraise.save
gitbo.save

#### assignments ####

sqlQuiz = Assignment.create(name:"SQL quiz",content:"Go to guizbo and take the quiz",due_date:"21/1/2012")

fileIO = Assignment.create(name:"File IO",content:"Make a rails app that supports file IO",due_date:"21/12/2012")
javascript = Assignment.create(name:"Javascript Timeline",content:"Make a rails app that has a killer front end",due_date:"12/12/2012")
subdomaions = Assignment.create(name:"Subdomains",content:"Let me Subdomain your site",due_date:"8/12/2012")
statemachine = Assignment.create(name:"Statemachine",content:"Have issues change status with time",due_date:"16/12/2012")
payment = Assignment.create(name:"Payment Processing",content:"Allow users to process payments",due_date:"2/12/2012")

sqlQuiz.author = u0

fileIO.author = u0
javascript.author = u0
subdomaions.author = u0
statemachine.author = u0
payment.author = u0

sqlQuiz.user_names= ((User.all - [u0]).collect(&:name).join(","))
fileIO.user_names = [u13.name,u2.name,u3.name,u18.name].join(",")
javascript.user_names = [u1.name,u17.name,u14.name,u7.name].join(",")
subdomaions.user_names = [u4.name,u5.name,u9.name,u19.name].join(",")
statemachine.user_names = [u12.name,u6.name,u20.name].join(",")
payment.user_names = [u8.name,u16.name,u11.name,u10.name].join(",")

sqlQuiz.save

fileIO.save
javascript.save
subdomaions.save
statemachine.save
payment.save

####


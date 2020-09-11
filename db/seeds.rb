t1 = Topic.create(name: "Scrapbooking")
t2 = Topic.create(name: "Gardening")
t3 = Topic.create(name: "Reading")
t4 = Topic.create(name: "Quilting")
t5 = Topic.create(name: "Bingo")

pp1 = Penpal.create(name: "Mabel Addington", age: 83, frequency: "Monthly")
pp1.topics << t1
pp1.topics << t2
pp1.topics << t5

pp2 = Penpal.create(name: "Myrtle Garfield", age: 79, frequency: "Monthly")
pp2.topics << t4

pp3 = Penpal.create(name: "Rosalie Hartford", age: 80, frequency: "Weekly")
pp3.topics << t3
pp3.topics << t5

pp4 = Penpal.create(name: "Oliver Martin", age: 92, frequency: "Yearly")
pp4.topics << t2
pp4.topics << t3
pp4.topics << t5

pp5 = Penpal.create(name: "Arthur Crawford", age: 86, frequency: "Weekly")
pp5.topics << t1

pp6 = Penpal.create(name: "Fred Durham", age: 65, frequency: "Monthly")
pp6.topics << t2

pp7 = Penpal.create(name: "Chester Boothe", age: 90, frequency: "Monthly")
pp7.topics << t2
pp7.topics << t4
pp7.topics << t5

pp8 = Penpal.create(name: "Agatha Burton", age: 83, frequency: "Weekly")
pp8.topics << t1

pp9 = Penpal.create(name: "Geraldine Smith", age: 77, frequency: "Yearly")
pp9.topics << t3
pp9.topics << t4

pp10 = Penpal.create(name: "Edna Kent", age: 86, frequency: "Weekly")
pp10.topics << t1
pp10.topics << t3
pp10.topics << t5
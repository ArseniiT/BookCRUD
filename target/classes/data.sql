
USE test;

DROP TABLE IF EXISTS book;

CREATE TABLE book(
	id INT(11) NOT NULL AUTO_INCREMENT,
	title 	VARCHAR(100) NOT NULL,
	description VARCHAR(255),
	author VARCHAR(100)NOT NULL,
	isbn VARCHAR(20)NOT NULL UNIQUE,
	printYear INT(4) NOT NULL,
	readAlready  BOOLEAN NOT NULL DEFAULT FALSE,
	PRIMARY KEY (id)
)
	DEFAULT CHARACTER SET = utf8;
	
INSERT INTO book(title, description, author, isbn, printYear) VALUES
	("Murach's Java Programming (5th Edition)", 
	"This is the 5th edition of Murach's classic Java book that's trained thousands
	of developers in the last 15 years. Now fully updated to Java 9, this book helps
	any programmer learn Java faster and better than ever before", "Joel Murach", 1943872074, 2017),
		
	("Mastering Spring5.0: Master reactive programming, microservices, Cloud Native applications, and more", 
	"Spring 5 is due to arrive with a myriad of new and exciting features 
	that will change the way we've used the framework so far. This book will show you this
	evolution-from solving the problems of testable applications to building 
	applications on cloud", "Ranga Rao Karanam", 1787123170, 2017),
		
	("Coding: Raspberry Pi & Python: Step By Step Guide From Beginner To Advanced: Two Manuscripts In One", 
	"Raspberry & Python 2 books in 1 PYTHON PROGRAMMING, STEP BY STEP GUIDE Updated Version
	Python and programming in general may seem like very complicated subjects, but there is nothing to worry
	about because it is actually very easy.", "Leonard Eddison", 1979333939, 2017),
		
	("On Language: Chomsky's Classic Works Language and Responsibility and Reflections on Language in 1vol", 
	"Described by the New York Times as arguably the most important intellectual alive, 
	Noam Chomsky is known throughout the world for his highly influential writings on
	language and politics. ", "Noam Chomsky", 1565844750, 1998),
		
	("Manufacturing Consent: The Political Economy of the Mass Media", 
	"In this pathbreaking work, now with a new introduction, Edward S. Herman and Noam Chomsky show that,
	contrary to the usual image of the news media as cantankerous, obstinate, and ubiquitous in their
	search for truth and defense of justice", "Edward S. Herman", 0375714499, 2002),
	
	("The Proud Tower: A Portrait of the World Before the War, 1890-1914", 
	"THE PROUD TOWER by Barbara Tuchman examines the Western World of approximately 100 years ago. 
	Technologically the world was a very different from today, but the strifes between economic groups
	and among nations bears many similarities to our own time. ", " Barbara W. Tuchman", 0345405013, 1996),
	
	("The Very Hungry Caterpillar", "Including a special feature, dye cuts, this beautiful board book edition,
	perfect for teaching the days of the week, offers readers an interactive experience. ", "Eric Carle", 0399226907, 1994),
	
	("The Giving Tree", "The Giving Tree, a story of unforgettable perception, beautifully written and illustrated by the gifted 
	and versatile Shel Silverstein, has been a classic favorite for generations.", "Shel Silverstein", 0060256656, 1964),
	
	("Catnip: A Love Story", "With the imagination of a writer and the eye of an artist, Michael Korda doodled on the backs 
	of old manuscripts in his tackroom while his wife, Margaret, was out riding. They loved and acquired cats―a habit written
	about previously in their book.", "Michael Korda", 1682681572, 2018),
	
	("The Great Gatsby", "The Great Gatsby is a 1925 novel written by American author F. Scott Fitzgerald that follows
	a cast of characters living in the fictional town of West Egg on prosperous Long Island in the summer of 1922.", 
	"F. Scott Fitzgerald", "B00HJBFRQK", 1905),
	
	("Fluid Power with Applications", "Fluid Power with Applications, presents broad coverage of fluid power technology 
	in a readable and understandable fashion. An extensive array of industrial applications is provided to motivate and 
	stimulate students' interest in the field.","Anthony Esposito", 0135136903, 2008),
	
	("Belief and history", "Belief and history (Richard lectures for 1974-75, University of Virginia) by 
	Wilfred Cantwell Smith (1977-05-03)","Cantwell Smith", "B01FEOQT1A", 1890),
	
	("Oh, the Thinks You Can Think!", "The book is about the many amazing 'thinks' one can think and the endless 
	possibilities and dreams that imagination can create.","Dr. Seuss", 0394831292, 1975),
	
	("Mrs Dalloway (Vintage Classics Woolf Series)", "The book is a novel by Virginia Woolf that details a day 
	in the life of Clarissa Dalloway in post-World War I England.","Virginia Woolf", 1784870862, 1925),
	
	("The Hours: A Novel", "widely praised as one of the most gifted writers of his generation, draws inventively on the life
	and work of Virginia Woolf to tell the story of a group of contemporary characters struggling with the conflicting claims 
	of love and inheritance.","Michael Cunningham", 0312243022, 2000),
	
	("Ben Hogan Five Lessons: The Modern Fundamentals of Golf", "widely praised as one of the most gifted writers of his generation,
	draws inventively on the life and work of Virginia Woolf to tell the story of a group of contemporary characters struggling with 
	the conflicting claims of love and inheritance.","Ben Hogan", 9780671612979, 1985),
	
	("Franklin's Valentines", "In this book, it's Valentine Day and Franklin can't wait to give his friends the cards he has made. 
	But when he gets to school, he discovers that they're missing. Franklin is heartbroken and worried that now his friends won't want
	to give him any cards.", "Ben Hogan", 1771380063, 2013),
	
	("Saint Valentine", "How did Valentine's Day, one of our most popular holidays, begin? It started in ancient Rome when
	a kind physician named Valentine took an interest in a young blind girl.", "Robert Sabuda", 0689824297, 1999),
	
	("Madeline's Rescue", "The lively adventures of the twelve famous little girls and Genevieve, the dog, take us once more to
	Bemelmans' unique and delightful Paris.", "Ludwig Bemelmans",  0142414441, 1953),
	
	("Guess How Much I Love You", "Guess how much I love you, says Little Nutbrown Hare. Little Nutbrown Hare shows his daddy
	how much he loves him: as wide as he can reach and as far as he can hop.", "Sam McBratney", 0763642649, 2008),
	
	("The Snowy Day", " is the simple tale of a boy waking up to discover that snow has fallen during the night. 
	Keats's illustrations, using cut-outs, watercolors, and collage, are strikingly beautiful in their understated color 
	and composition. ", "Ezra Jack Keats",  0140501827, 1976);
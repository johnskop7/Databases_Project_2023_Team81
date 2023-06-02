USE library;

-- DELETE data
DELETE FROM administrator;
DELETE FROM school_unit;
DELETE FROM book;
DELETE FROM book_thematic_categories;
DELETE FROM book_authors ;
DELETE FROM operator;
DELETE FROM book_borrowing;
DELETE FROM student_professor;
DELETE FROM reservations;
DELETE FROM reviews;
ALTER TABLE `administrator` auto_increment = 1;
ALTER TABLE `school_unit` auto_increment =1; 
ALTER TABLE `book` auto_increment = 1;
ALTER TABLE `book_thematic_categories` auto_increment =1;
ALTER TABLE `book_authors` auto_increment = 1;
ALTER TABLE `operator` auto_increment = 1;
ALTER TABLE `book_borrowing` auto_increment = 1;
ALTER TABLE `student_professor` auto_increment = 1;
ALTER TABLE `reservations` auto_increment = 1;
ALTER TABLE `reviews` auto_increment = 1;

--
-- Insert 8 school_units
--
INSERT INTO school_unit(school_name, address, city , school_director_full_name , library_operator_full_name, email , phone_number,administrator_id ) VALUES
    ('Peparithio','Doulidou 3','Skopelos','Philipos Lemonis','Dora Panteli','apro56@otenet.gr' ,'2424022172',1 ),                       	#1
    ('Dimokrito' , 'Ermou 2', 'Drama' , 'Samaras Giorgos','Panagiotis Giadikiaroglou','aktel@gmail.com', '2421023567' ,1),	       		#2
    ('Krifo Sxolio' , 'Georgiou 25', 'Kastoria' ,'Efthimiou Nikos','Alexandros Emmanouilidis' ,'atp@yahoo.gr','2467086595' ,1),    		#3
    ('Mantoulidi','Chrisipou 20','Zografou', 'Askounis Vaggelis','Thomas Walkup','awq@hotmail.gr','2356056793',1),	            		#4
    ('Saint-Joseph','Egnatia 34', 'Thessaloniki','Kostas Sloukas','George Pappas','larentzakis@kobra.gr','2421045678',1),			#5
    ('MIT' , 'Omonoias 45' ,'Kamatero','Giorgos Papagiannis','Kaiti Provia','bochou@gmail.com','2356089725',1 ),				#6
    ('UCLA','Filis 21','Tinos','Pipis Remoundos','Michael Velalopoulos','pip@otenet.gr','2423028953',1),					#7
    ('Princeton','Papagou 7','Ioannina','Charitos Giorgos','Beril Mckissic','ntats@gmail.com','2521057430',1);					#8	
    

-- 
-- Insert 8 school_operators
--
INSERT INTO operator(fullname,username,password,email,phone_number,school_id,administrator_id) VALUES
        ('Dora Panteli', 'kristin60', 'e8MKFdow%E', 'romerolance@example.org','(870)747-9717','1','1'),
	('Panagiotis Giadikiaroglou', 'jhill', '(4f!Rxc+Ff', 'dennisrusso@example.com','9671127828','2','1'),
	('Alexandros Emmanouilidis', 'eatonjonathan', '@0_I%ywv7T', 'kristiadams@example.net','342-283-3779x424','3','1'),
	('Thomas Walkup', 'qfernandez', 'r+QKo2wP*0', 'msanders@example.com','349-301-8402x47751','4','1'),
	('George Pappas', 'patelbrad', 'J$$kD1WBDp', 'bennettreginald@example.org','(327)763-2867x2635','5','1'),
	('Kaiti Provia', 'kristin93', '$A9eYCi@r9', 'danielgregory@example.org','948.817.1472','6','1'),
	('Michael Velalopoulos', 'brendan21', 'L8rZU*Gz_d', 'tinawong@example.com','(459)206-5360x5928','7','1'),
	('Beril Mckissic', 'jclark', '!@VaDTqC2z', 'danielruiz@example.org','077.982.3338','8','1');

--
-- Insert 24 professors and 64 students 
--

INSERT INTO student_professor(fullname,username,password,email,phone_number,date_of_birth,role,approval_status, operator_id) VALUES
	('Brian Maldonado', 'manderson', 'DD6NEYXoS*', 'ashleyharrison@example.org','167.215.9976x955','1972-08-07','professor','approved','1'),            #1
	('Sherry Ford', 'danielle21', ')BE5+uLs4A', 'sanchezjohn@example.net','001-032-001-9715x93734','1969-11-09','professor','approved','1'),            #2
	('Jaime Riley', 'jesse15', ')d9+LU*s3c', 'vbrown@example.org','696.293.3561x297','1987-02-28','professor','approved','1'),                          #3
	('Valerie Owens', 'kvalentine', 'b&x0#Tp9(*', 'jeffreysnyder@example.com','(184)822-9465','1975-03-05','professor','approved','2'),                 #4
	('Katie Henson', 'powersbrandon', '#fb%3LXsdX', 'xjacobs@example.net','+1-705-426-3712x40040','1969-03-28','professor','approved','2'),             #5
	('Michelle Weaver', 'timothy71', '^o1L^CuqBq', 'kthompson@example.com','869.682.5686x44129','1986-09-15','professor','approved','2'),               #6
	('Amanda Thomas', 'whiteandre', '#3HVg)+QVI', 'ferrellsara@example.com','001-323-261-0858x7648','1977-09-04','professor','approved','3'),           #7
	('Christopher Holmes', 'crystaljones', '&y42QUo3e^', 'ruizanthony@example.org','057.862.8822x556','1982-04-05','professor','approved','3'),         #8
	('Jacqueline Williams', 'taramorris', 'q@d82Vc&r0', 'joshuajacobs@example.net','564-666-9529x7096','1983-11-29','professor','approved','3'),        #9
	('Michael Warner', 'vickiebarnett', ')*$BPzm+R8', 'natalie43@example.org','216-395-0491','1988-06-25','professor','approved','4'),                  #10
	('Robert Dean', 'dylan64', 'K55Oem&@i&', 'kmcfarland@example.com','001-301-160-5381x45628','1970-09-13','professor','approved','4'),                #11
	('Jimmy Mccormick', 'michaeladuke', 'x^G4TtBA&y', 'smithjames@example.com','(746)304-6507','1979-06-17','professor','approved','4'),                #12
	('Christopher Dixon', 'benjamin12', '5Pt5Mt7&X(', 'stephaniegrant@example.org','447.047.9804x820','1979-12-31','professor','approved','5'),         #13
	('Sabrina Stevens', 'robin13', '1d8hEog)*K', 'brianpowell@example.org','(068)596-0878x755','1989-01-11','professor','approved','5'),                #14
	('Benjamin Bridges', 'jerryedwards', '$b*R1S8ri7', 'hweber@example.net','310-187-5084','1970-04-10','professor','approved','5'),                    #15
	('Jennifer Wood', 'solisrobert', '*PhANEBrZ2', 'kramervanessa@example.org','001-454-520-0714x340','1970-08-06','professor','approved','6'),         #16
	('Rebecca Terrell DVM', 'sosatimothy', 'h@DSL9Dx!0', 'ellismary@example.net','3871779967','1984-02-05','professor','approved','6'),                 #17
	('Mikayla Thomas', 'mackenziewoods', 'eF*$v9GiAx', 'englishrichard@example.net','571-593-5531','1977-03-18','professor','approved','6'),            #18
	('Lucas Pittman', 'jonathanjames', '3PFp1W5k_(', 'kevinsmith@example.net','549-425-3446x89555','1988-03-16','professor','approved','7'),            #19
	('Joshua Jones', 'danielleburns', '3ke42BKp4*', 'masoneugene@example.net','337-179-6723','1995-08-08','professor','approved','7'),                  #20
	('Sean Mccall', 'kpeters', '%1O&5lJ)u#', 'dennismichael@example.org','581-317-2609x27161','1980-05-14','professor','approved','7'),                 #21
	('Hannah Allen', 'marc82', 'pPR@1EUhC7', 'marissa49@example.org','001-317-727-1690x15922','1991-10-14','professor','approved','8'),                 #22
	('Brian Bryant', 'andersonroger', '72L6*D#z@v', 'ramirezmark@example.net','587-257-4439','1983-03-29','professor','approved','8'),                  #23
	('Lori Duffy', 'annette69', 'a+3DY6Tk(n', 'sparker@example.net','(229)249-8552x061','1979-08-25','professor','approved','8'),                       #24
	('Anita Williams', 'fphillips', '$aSJ#7Fr@1', 'nsmith@example.com','+1-371-296-3621','2016-01-08','student','approved','1'),                        #25
	('Barbara James', 'nicholsamanda', 'K)R9Txr$4)', 'dylanking@example.com','044-369-4340x291','2014-04-15','student','approved','1'),                 #26
	('Mark Wood', 'rmoore', '+^S1OP@O_w', 'jenniferfrench@example.net','7653140008','2016-09-15','student','approved','1'),                             #27
	('Vanessa Brown', 'penningtonmorgan', '^)45Lc9b5E', 'michaelanderson@example.org','600-272-9245','2014-06-24','student','approved','1'),            #28
	('Melissa Barton', 'nancybaker', 'mW9Moqoa$R', 'dianafuller@example.org','140-114-5452','2015-03-31','student','approved','1'),                     #29
	('Linda Hernandez', 'hernandezmegan', ')%iWMicT82', 'fjohnson@example.com','619-859-4614x6454','2013-05-19','student','approved','1'),              #30
	('Susan Bond', 'daniel80', 'Z0GjQz1_@e', 'bishopdawn@example.net','+1-269-051-3596x03160','2012-01-27','student','approved','1'),                   #31
	('Sarah Hooper', 'danielnelson', '##I0BqGecI', 'bakeremily@example.net','799.961.4646x1495','2011-04-20','student','approved','1'),                 #32
        ('Crystal Johnson', 'kristinedean', 'G!gn4E%gnu', 'kellybrian@example.com','743-900-6043x20173','2012-05-01','student','approved','2'),             #33
	('Mark Johnston', 'sosadylan', 'sT0YnuXti+', 'ocarter@example.com','287-572-6522','2011-07-23','student','approved','2'),                           #34
	('Matthew Page', 'joshuaabbott', 'Wxmm2EFh7^', 'erinwright@example.net','(686)959-1346x23631','2017-03-22','student','approved','2'),               #35
	('Stacy Wright', 'birdnicholas', '1yAUZoYI)p', 'ctownsend@example.com','143.948.6112x3457','2013-08-07','student','approved','2'),                  #36
	('Elizabeth Palmer', 'gjones', 'Bx!6TH&fX0', 'tcole@example.org','+1-064-327-9420x8335','2011-12-10','student','approved','2'),                     #37
	('Wendy Spence', 'victorwalker', 'uu45ID54p!', 'tammy90@example.org','+1-722-578-4375x04436','2015-08-12','student','approved','2'),                #38
	('Monica Reyes', 'lorilewis', '&lQ5WpJb9p', 'kennedyadam@example.org','513-893-7197','2015-02-14','student','approved','2'),                        #39
	('Linda Morales', 'cruzashley', '2_Y7hPd+Y@', 'savannah29@example.net','224.206.5675x4917','2015-01-19','student','approved','2'),                  #40
        ('Theresa Armstrong', 'montoyamichele', '$m80CDGtrt', 'kelly28@example.com','201-783-5672','2008-09-16','student','approved','3'),                  #41
	('Kayla Webster', 'mccarthypatricia', '$(4LNvNzgN', 'nfarrell@example.org','(321)304-1185','2009-09-16','student','approved','3'),                  #42
	('Douglas Daniel', 'wrightalexander', 'Ba0HFaTFG^', 'qnewman@example.org','(716)849-7102x4073','2008-06-10','student','approved','3'),              #43
	('Tracey Zimmerman', 'mcneillawrence', 'i4&UTW4f+C', 'imiller@example.org','104-930-5618x977','2010-03-31','student','approved','3'),               #44
	('Glen Dudley', 'zjackson', 'nqL8Xyd2h^', 'aacosta@example.com','+1-401-119-7551x224','2010-10-23','student','approved','3'),                       #45
	('Timothy Hawkins', 'amanda81', '0E7PahpAY)', 'pamela49@example.org','835-555-9173x50430','2009-07-03','student','approved','3'),                   #46
	('Teresa Parsons', 'allison61', '4u+96Bs!_!', 'fbarron@example.com','001-222-833-0805','2010-03-22','student','approved','3'),                      #47
	('Kevin Nichols', 'philipharris', 'G3tlC&zW)R', 'cheryldelgado@example.com','(393)313-2683x79017','2008-09-19','student','approved','3'),           #48
        ('Stacey Irwin', 'emilycook', 'U9*8W(rq4Z', 'walterevans@example.org','(808)954-2991x49534','2008-06-04','student','approved','4'),                 #49
	('Mary Brooks', 'codychung', 'u)D7^PEdpW', 'ewingaustin@example.com','001-497-930-6689x4840','2009-08-20','student','approved','4'),                #50
	('Karen Smith', 'christopher13', '#5IFtoQq)&', 'warrenmariah@example.net','(507)112-4786','2009-11-18','student','approved','4'),                   #51
	('Christian Stevens', 'jonathan95', 'y)6GXIpl@x', 'fishermichael@example.net','(284)615-1468x542','2009-11-11','student','approved','4'),           #52
	('Krystal Sharp', 'zrodriguez', 'v98f2EXr%#', 'dsimon@example.org','394.283.8903','2008-04-16','student','approved','4'),                           #53
	('Sarah Watson', 'robert26', '&PJm)hGj$4', 'hperkins@example.org','542-691-1571','2008-10-26','student','approved','4'),                            #54
	('Carolyn Collins', 'millsalexander', 'q^_L9G+fDQ', 'melissasmith@example.net','3603695599','2010-07-26','student','approved','4'),                 #55
	('Cristina Gonzalez', 'dhoover', 't7AR+zbr!l', 'carolyn67@example.net','1677101589','2008-08-30','student','approved','4'),                         #56
	('Leslie Bennett', 'laura47', 'Km8%WvOJ#F', 'bakeremily@example.net','001-133-575-2118','2008-08-30','student','approved','5'),                     #57
	('Charles Oneal', 'shannon42', '+t65)GHDs^', 'xharrison@example.com','422-596-5680x5195','2008-04-11','student','approved','5'),                    #58
	('Christine Armstrong', 'rojastheresa', 'UI&l1HAt8b', 'christinebecker@example.net','993-857-4428x768','2010-05-31','student','approved','5'),      #59
	('Robert Hartman', 'usloan', 'ih2HDqI8*k', 'umiller@example.net','(703)428-2904x1899','2008-06-01','student','approved','5'),                       #60
	('Lacey Torres', 'jeffrey59', '2mMM&6Sy^1', 'sfrederick@example.org','001-619-766-9756','2010-05-15','student','approved','5'),                     #61
	('Anna Jackson', 'pamelabennett', '+2LC0jnd4y', 'uweaver@example.org','968-303-8363x616','2008-11-04','student','approved','5'),                    #62  
	('Katie Phillips', 'belinda57', '(!2g5!Dol&', 'vsoto@example.com','214.695.8441','2010-07-07','student','approved','5'),                            #63
	('Kelly Sawyer', 'edwardsbrian', '*ux9Zy7s!0', 'willisjohn@example.com','(415)299-0931','2008-08-29','student','approved','5'),                     #64
        ('Matthew Gray', 'buckleydonna', '_%7dVQigpj', 'andreablake@example.com','249-474-5298','2010-12-19','student','approved','6'),                     #65
	('Veronica Jennings', 'alexmarquez', '5XNmas&6*9', 'jgregory@example.net','001-476-644-8036x71531','2010-04-15','student','approved','6'),          #66
	('Bruce Thompson', 'martinyolanda', 'o0*23NIjP_', 'reginaldryan@example.org','+1-125-094-8417x749','2008-07-06','student','approved','6'),          #67
	('Stephen Ferguson', 'etaylor', 'x7%WTG_4)w', 'timothy58@example.org','948.836.5899','2010-06-25','student','approved','6'),                        #68
	('Jacqueline Atkins', 'gedwards', 'h)2Zdo^xps', 'davidphillips@example.com','001-200-254-3629x3328','2009-08-09','student','approved','6'),         #69
	('Dean Soto', 'apatterson', '7LkF8Fev^t', 'benjamin14@example.org','+1-288-291-1086x38489','2009-10-31','student','approved','6'),                  #70
	('Tiffany Allen', 'zbradley', '(p3fJrU1$o', 'jenniferthompson@example.net','+1-905-771-3851','2010-11-01','student','approved','6'),                #71
	('Shelby Robles', 'michaelhendricks', '+L36SYsp%8', 'richardsonmichelle@example.net','413-214-5295x8586','2010-04-23','student','approved','6'),    #72
        ('Sabrina Dennis', 'robert63', '#6bH8bYLzB', 'anthonygoodman@example.com','080.771.3789x56299','2005-11-12','student','approved','7'),              #73
	('Brandon Richardson', 'garciamark', '%)7Dqo8sFK', 'romanjennifer@example.org','(394)565-9084','2005-07-21','student','approved','7'),              #74
	('Barry Pollard', 'dmiller', 'jj$Y@3FpEF', 'watersdavid@example.com','104-528-1502x49506','2005-12-29','student','approved','7'),                   #75
	('Joel Noble', 'petersbradley', '%_ekd8RabZ', 'cmunoz@example.org','361-935-4078x657','2006-08-12','student','approved','7'),                       #76
	('Crystal Moore', 'esims', '*1tR5Pl+F7', 'christywilson@example.net','+1-265-984-2725x21377','2007-04-09','student','approved','7'),                #77
	('Andrea Crosby', 'anthony29', '%Gl0EpEmu#', 'burkeedward@example.org','(655)639-9795x766','2007-09-23','student','approved','7'),                  #78
	('Edward Archer', 'torreskimberly', '^W8RZo*jSw', 'olsonsheila@example.com','315.703.8815x866','2007-07-10','student','approved','7'),              #79
	('Timothy Vaughan', 'watersmatthew', '$5Xc8Lcs#6', 'jonesjustin@example.net','805-731-0139','2007-10-01','student','approved','7'),                 #80
        ('Jackie Carr', 'guerrerowilliam', ')4Xa0F0vRQ', 'aramos@example.com','001-117-485-8034x88814','2005-07-19','student','approved','8'),              #81
	('Kirk Bean', 'rubenleon', '#0TPq@ebcW', 'jparker@example.org','+1-834-671-1604x4571','2006-01-03','student','approved','8'),                       #82
	('Donald Klein', 'lisaramirez', '*_8QtTmqBF', 'solissandra@example.org','+1-762-024-9888','2006-09-14','student','approved','8'),                   #83
	('Joseph Friedman', 'whiterichard', '+Y#b2YHa%1', 'lambertmark@example.net','235-333-8248x8419','2007-06-29','student','approved','8'),             #84
	('Theodore Gibson', 'knappsarah', 'N*at2vI0qs', 'wilsonwilliam@example.net','+1-065-547-5999x87842','2006-10-23','student','approved','8'),         #85
	('Bryan Anthony', 'kjohnson', 'W5$GMU@p+c', 'robyndixon@example.net','001-799-844-7776x6014','2007-05-21','student','approved','8'),                #86
	('Anthony Stephenson', 'michaelreyes', 'Q&h5Uv4!zl', 'jonathanpatrick@example.org','126-952-6552x27945','2005-08-02','student','approved','8'),     #87
	('Debra Williams', 'annahicks', '$19I!vphV_', 'james32@example.com','337-208-4511','2006-04-27','student','approved','8');                          #88
    
    
    
--
-- Insert 150 Book Data:  16 books(school_id = 1) + 18 (school_id = 2) + 18 (<<) + 19 (<<) + 19 (<<) + 20 (<<) + 20 (<<) + 20 (<<) = 150 books
--

	INSERT INTO book(title,publisher,ISBN,number_of_pages,image,language,available_copies,summary,key_words,school_id) VALUES								
	('The Enigmatic Conquest', 'Jessica Gray', '978-0-06-907517-1', '249','https://dummyimage.com/977x500','Basque','0','Summary 1','[language, whose, leader]','1'),                       #1   
	('Echoes of Destiny', 'Emily Bush', '978-0-347-91921-0', '250','https://picsum.photos/386/141','Chechen','2','Summary 2','[traditional, mother, choose]','1'),			        #2	
	('The Whispers of Serendipity', 'Nicholas Wright', '978-1-210-19235-8', '409','https://placekitten.com/11/948','Esperanto','4','Summary 3','[usually, team, line]','1'),        	#3
	('Shadows of Redemption', 'Harry Ramos', '978-0-6488537-8-7', '561','https://placekitten.com/766/866','Tswana','1','Summary 4','[develop, civil, pretty]','1'),				#4	
	('The Forgotten Prophecy', 'Savannah Wallace', '978-0-444-60556-6', '499','https://picsum.photos/401/6','Church Slavic','5','Summary 5','[goal, force, about]','1'),			#5
	('Fragments of Eternity', 'Jerry Ortiz', '978-0-9964128-0-3', '346','https://picsum.photos/164/432','Bihari languages','0','Summary 6','[future, question, much]','1'),			#6	
	('The Labyrinth of Secrets', 'Vincent James', '978-0-483-55770-3', '352','https://picsum.photos/676/175','Walloon','0','Summary 7','[cold, local, PM]','1'),				#7	
	('Journey to the Unknown', 'Andrea Glover', '978-0-13-591299-7', '404','https://placekitten.com/679/251','Shona','0','Summary 8','[year, not, play]','1'),                              #8
	('Beneath the Starlit Sky', 'Scott Morris', '978-0-86907-875-4', '415','https://dummyimage.com/330x1011','Dzongkha','3','Summary 9','[want, suggest, with]','1'),                       #9
	('The Silent Legacy', 'Carol Howard', '978-0-14-142329-6', '392','https://dummyimage.com/964x620','Lithuanian','0','Summary 10','[contain, focus, board]','1'),                         #10
	('Chronicles of the Lost Realm', 'Amanda Wang', '978-0-16-823702-9', '371','https://dummyimage.com/984x1008','Uzbek','4','Summary 11','[situation, analysis, stop]','1'),               #11
	('A Song in the Wind', 'Michelle Bell', '978-0-942043-42-6', '485','https://dummyimage.com/977x762','Dzongkha','0','Summary 12','[memory, compare, value]','1'),                        #12
	('The Captives Dilemma', 'Courtney Roberts', '978-0-267-25793-5', '348','https://placekitten.com/879/844','North Ndebele','5','Summary 13','[travel, energy, our]','1'),                #13
	('Mysteries of the Unseen', 'Dawn Scott', '978-0-565-71777-3', '498','https://dummyimage.com/131x512','Kirghiz','0','Summary 14','[arrive, fund, among]','1'),                          #14
	('The Last Voyage', 'John Rivers', '978-1-75588-762-7', '243','https://placekitten.com/510/965','French','4','Summary 15','[evidence, general, policy]','1'),                           #15
	('The Crimson Crown', 'Kimberly Martin', '978-0-9596228-3-6', '395','https://placekitten.com/196/822','Sotho, Southern','4','Summary 16','[the, wait, fire]','1'),                      #16
	('Whispers in the Dark', 'Gwendolyn King', '978-0-927030-95-3', '302','https://placekitten.com/547/442','Kurdish','0','Summary 17','[wide, surface, evidence]','2'),                    #17
	('Sands of Time', 'Omar Bowman', '978-1-329-09305-8', '515','https://dummyimage.com/771x23','Tsonga','3','Summary 18','[close, into, food]','2'),                                       #18
	('The Cursed Talisman', 'Renee Miller', '978-1-370-65788-9', '536','https://dummyimage.com/493x33','Czech','0','Summary 19','[everything, series, consider]','2'),                      #19
	('Echoes from the Abyss', 'Angela Gonzales', '978-0-413-83026-5', '203','https://placekitten.com/467/769','Kongo','3','Summary 20','[that, term, box]','2'),                            #20
	('The Enchanted Forest', 'Deanna Hood', '978-1-60375-783-6', '282','https://picsum.photos/271/932','Bihari languages','2','Summary 21','[change, condition, into]','2'),                #21
	('The Crystal Key', 'Mary Baker', '978-1-284-24911-8', '221','https://picsum.photos/246/486','Korean','0','Summary 22','[task, worry, continue]','2'),                                  #22
	('The Midnight Chronicles', 'Tracy Stark', '978-0-8303-2913-7', '506','https://placekitten.com/1004/690','Corsican','4','Summary 23','[future, commercial, trouble]','2'),              #23
	('Secrets of the Forbidden City', 'Pamela Herrera', '978-0-275-57482-6', '231','https://picsum.photos/898/414','South Ndebele','4','Summary 24','[to, fish, their]','2'),               #24
	('Legends of the Moonstone', 'Lisa French', '978-1-56313-725-9', '153','https://picsum.photos/777/963','Kurdish','5','Summary 25','[number, site, detail]','2'),                        #25
	('The Stolen Heirloom', 'Andrew Chavez', '978-1-912138-63-0', '324','https://picsum.photos/615/91','Romansh','0','Summary 26','[method, heart, experience]','2'),                       #26
	('Echoes of the Forgotten', 'Jessica Moore', '978-1-06-085903-6', '594','https://placekitten.com/753/860','Kongo','4','Summary 27','[magazine, evidence, generation]','2'),             #27
	('The Lost Kingdom', 'Jason Murphy', '978-1-69421-685-4', '323','https://placekitten.com/451/513','Afar','3','Summary 28','[according, computer, time]','2'),                           #28
	('Whispers of Betrayal', 'Hailey Cook', '978-0-930961-73-2', '187','https://placekitten.com/574/40','Ido','0','Summary 29','[score, recognize, must]','2'),                             #29
	('The Ruby Amulet', 'Daniel Powers', '978-1-193-67551-0', '365','https://picsum.photos/936/461','Sango','4','Summary 30','[move, check, news]','2'),                                    #30
	('The Vanishing', 'Heather Patterson', '978-0-532-32904-6', '125','https://picsum.photos/849/621','Kikuyu','4','Summary 31','[dark, probably, break]','2'),                             #31
	('The Hidden Path', 'Jason Mueller', '978-0-943794-64-8', '123','https://dummyimage.com/43x157','Swahili','4','Summary 32','[care, old, require]','2'),                                 #32
	('Sins of the Past', 'Travis Wilson', '978-0-15-903002-8', '122','https://placekitten.com/145/273','Nauru','0','Summary 33','[number, important, stand]','2'),                          #33
	('The Shattered Mirror', 'Kimberly Sparks', '978-1-02-533213-0', '251','https://dummyimage.com/914x810','Armenian','5','Summary 34','[public, world, can]','2'),                        #34
	('The Dark Prophecy', 'Michael Anderson', '978-1-64207-421-5', '318','https://dummyimage.com/809x255','Kirghiz','3','Summary 35','[end, open, capital]','3'),                           #35
	('The Secret Society', 'Carla Price', '978-0-589-05008-5', '329','https://picsum.photos/196/487','Persian','0','Summary 36','[majority, brother, bring]','3'),                          #36
	('The Isle of Whispers', 'Selena Williams', '978-1-4058-8810-3', '450','https://dummyimage.com/634x434','Northern Sami','5','Summary 37','[clearly, film, figure]','3'),                #37
	('The Forsaken Tower', 'Matthew Wong', '978-0-15-373721-3', '314','https://picsum.photos/453/622','Maori','0','Summary 38','[surface, same, type]','3'),                                #38
	('Echoes of the Past', 'Melinda Torres', '978-0-642-10758-9', '457','https://dummyimage.com/667x204','Ukrainian','0','Summary 39','[seek, second, where]','3'),                         #39
	('The Cursed Relic', 'Lynn Hicks', '978-0-87157-993-5', '366','https://dummyimage.com/636x134','Pali','1','Summary 40','[technology, movie, guy]','3'),                                 #40
	('Whispers in the Mist', 'Mark Ray', '978-1-993507-70-7', '146','https://placekitten.com/468/571','Arabic','2','Summary 41','[magazine, class, hospital]','3'),                         #41
	('The Shadows Embrace', 'Olivia Hughes', '978-1-5106-7905-4', '226','https://dummyimage.com/90x0','Norwegian','4','Summary 42','[business, develop, car]','3'),                         #42
	('The Emerald Crown', 'Alexander Wright', '978-0-9622937-9-5', '467','https://placekitten.com/861/565','Ndonga','4','Summary 43','[gun, born, could]','3'),                             #43
	('The Enigma of Time', 'Crystal Dickerson', '978-0-269-70812-1', '483','https://dummyimage.com/795x600','Kuanyama','0','Summary 44','[human, art, as]','3'),                            #44
	('The Silent Sentinel', 'Kaitlyn Salinas', '978-0-87884-792-1', '401','https://placekitten.com/639/617','Guarani','3','Summary 45','[save, vote, deep]','3'),                           #45
	('Secrets of the Crystal Cave', 'John Jones', '978-0-09-329820-1', '586','https://dummyimage.com/51x131','Ndonga','4','Summary 46','[cut, explain, little]','3'),                       #46
	('The Chosen One', 'Nicole Wolf', '978-0-442-23609-0', '379','https://placekitten.com/899/739','Italian','5','Summary 47','[save, view, could]','3'),                                   #47
	('The Forgotten City', 'Marcus Carrillo', '978-0-633-65851-9', '424','https://picsum.photos/735/594','Malay','0','Summary 48','[west, three, entire]','3'),                             #48
	('The Veil of Secrets', 'Hayley Hernandez', '978-0-9895823-4-6', '207','https://placekitten.com/268/688','Maori','3','Summary 49','[cause, compare, as]','3'),                          #49
	('The Hidden Scroll', 'Rebecca Smith', '978-1-4061-4742-1', '229','https://picsum.photos/863/985','North Ndebele','0','Summary 50','[change, raise, hard]','3'),                        #50
	('The Lost Chronicles', 'Bonnie Aguilar', '978-1-107-05031-0', '501','https://picsum.photos/112/272','Inupiaq','2','Summary 51','[point, personal, enter]','3'),                        #51
	('Echoes from Beyond', 'Michael Acevedo', '978-1-294-97686-8', '111','https://placekitten.com/857/272','Western Frisian','5','Summary 52','[job, protect, something]','3'),             #52
	('The Phantoms Curse', 'Franklin Henry', '978-1-948906-39-5', '206','https://picsum.photos/903/95','Nauru','0','Summary 53','[discuss, industry, commercial]','4'),                     #53
	('The Enchanted Manuscript', 'Belinda Spencer', '978-0-8041-4171-0', '322','https://dummyimage.com/686x115','Norwegian Nynorsk','5','Summary 54','[system, name, trade]','4'),          #54
	('Whispers of the Heart', 'David Brooks', '978-1-933024-97-4', '339','https://placekitten.com/406/85','Gujarati','0','Summary 55','[boy, choose, within]','4'),                         #55
	('The Timekeepers Legacy', 'John Taylor', '978-0-17-926641-4', '493','https://dummyimage.com/461x512','Ojibwa','5','Summary 56','[reason, stuff, since]','4'),                          #56
	('The Forgotten Land', 'Brianna Williams', '978-1-4954-1113-7', '565','https://picsum.photos/212/217','Russian','3','Summary 57','[heavy, catch, after]','4'),                          #57
	('The Crystal Labyrinth', 'Jeremy Evans', '978-1-4542-9742-0', '523','https://dummyimage.com/725x20','Fijian','5','Summary 58','[point, action, course]','4'),                          #58
	('The Crimson Rose', 'James Anderson', '978-1-4717-8771-3', '543','https://picsum.photos/270/537','Sardinian','3','Summary 59','[need, think, event]','4'),                             #59
	('The Ghost of Avalon', 'Anna Anderson', '978-0-680-46309-8', '146','https://placekitten.com/157/76','Gujarati','0','Summary 60','[crime, blue, more]','4'),                            #60
	('The Guardians Quest', 'Jeremy Hurley', '978-1-214-72869-0', '426','https://dummyimage.com/383x623','Slovak','0','Summary 61','[rest, small, draw]','4'),                              #61
	('The Lost Prophecies', 'Sarah Guerrero', '978-1-77507-417-5', '535','https://placekitten.com/408/956','Norwegian','2','Summary 62','[lot, day, either]','4'),                          #62
	('Echoes of the Enchanter', 'Colleen Garcia', '978-0-9802512-2-7', '281','https://picsum.photos/328/278','Hausa','0','Summary 63','[wait, star, sign]','4'),                            #63
	('The Whispering Woods', 'Michelle Fry', '978-1-367-37527-7', '492','https://picsum.photos/879/906','Serbian','5','Summary 64','[action, develop, mind]','4'),                          #64
	('The Oracles Secret', 'Paul Harris', '978-0-9702698-4-3', '394','https://picsum.photos/373/330','Malay','4','Summary 65','[should, go, game]','4'),                                    #65
	('The Haunting of Blackstone Manor', 'Anthony Smith', '978-0-01-567910-1', '181','https://placekitten.com/905/244','Tonga','2','Summary 66','[choice, happy, south]','4'),              #66
	('The Mystics Tale', 'Keith Clarke', '978-1-69195-844-3', '376','https://dummyimage.com/11x667','Gaelic','5','Summary 67','[market, role, source]','4'),                                #67
	('The Enchanted Kingdom', 'Mary Mcdowell', '978-0-440-16839-3', '368','https://placekitten.com/255/27','Navajo','0','Summary 68','[alone, make, future]','4'),                          #68
	('The Cursed Forest', 'Karen Berry', '978-0-405-76269-7', '216','https://dummyimage.com/49x509','Thai','5','Summary 69','[action, eye, agent]','4'),                                    #69
	('The Forgotten Tome', 'Kenneth Morgan', '978-1-85344-164-6', '153','https://picsum.photos/244/692','Fulah','1','Summary 70','[form, allow, lot]','4'),                                 #70
	('The Silent Scribe', 'Krystal Hunt', '978-1-903896-87-7', '304','https://picsum.photos/180/225','Japanese','0','Summary 71','[maintain, which, board]','4'),                           #71
	('Whispers in the Shadows', 'Joshua Martinez', '978-1-136-08604-5', '350','https://dummyimage.com/681x546','Belarusian','1','Summary 72','[resource, nothing, foreign]','5'),           #72
	('The Serpents Kiss', 'Colton Green', '978-1-83458-019-7', '377','https://placekitten.com/637/586','Albanian','0','Summary 73','[create, kitchen, police]','5'),                        #73
	('The Elixir of Life', 'Linda Middleton', '978-1-100-50591-6', '547','https://placekitten.com/999/825','Greek','2','Summary 74','[available, floor, including]','5'),                   #74
	('The Lost Relic', 'Gary Weber', '978-0-00-324603-2', '356','https://placekitten.com/938/446','Serbian','5','Summary 75','[Mrs, change, small]','5'),                                   #75
	('The Secret Alchemy', 'Deborah Hopkins', '978-0-354-82915-1', '584','https://dummyimage.com/797x644','Gaelic','5','Summary 76','[class, occur, enough]','5'),                          #76
	('The Crimson Eye', 'Alex Elliott', '978-0-7696-1483-0', '193','https://dummyimage.com/390x616','Estonian','2','Summary 77','[individual, meet, enter]','5'),                           #77
	('The Enigmas Riddle', 'Arthur Ryan', '978-1-62440-238-8', '295','https://picsum.photos/476/620','Walloon','0','Summary 78','[law, both, simply]','5'),                                 #78
	('The Vanished Heiress', 'Jody Scott', '978-0-655-13545-6', '561','https://picsum.photos/16/701','Belarusian','4','Summary 79','[discuss, spring, member]','5'),                        #79
	('The Forgotten Spell', 'Kim Alexander', '978-0-547-96884-1', '181','https://placekitten.com/841/157','Fijian','4','Summary 80','[fish, fund, majority]','5'),                          #80
	('Echoes of Desolation', 'Angela Mccann', '978-0-9891930-0-9', '560','https://placekitten.com/612/655','Xhosa','0','Summary 81','[send, degree, another]','5'),                         #81
	('The Ivory Tower', 'James Ramsey', '978-1-5309-8156-4', '523','https://picsum.photos/78/371','Malagasy','1','Summary 82','[simple, until, station]','5'),                              #82
	('The Hidden Chamber', 'Francisco Hendrix', '978-0-393-79576-9', '159','https://dummyimage.com/515x560','Fijian','5','Summary 83','[truth, thus, phone]','5'),                          #83
	('The Forbidden Tome', 'Anna Lee', '978-0-911388-30-5', '291','https://placekitten.com/622/706','Maltese','0','Summary 84','[item, party, girl]','5'),                                  #84
	('The Lost Symphony', 'Mark Cooley', '978-1-4648-0993-4', '583','https://dummyimage.com/455x190','Catalan','1','Summary 85','[hit, hospital, which]','5'),                              #85
	('Whispers of Wisdom', 'Jordan Perez', '978-1-927831-41-0', '424','https://placekitten.com/947/583','Samoan','0','Summary 86','[ten, in, phone]','5'),                                  #86
	('The Haunted Manor', 'Johnny Walsh', '978-0-17-841274-4', '457','https://placekitten.com/806/733','Portuguese','5','Summary 87','[data, room, pretty]','5'),                           #87
	('The Chalice of Secrets', 'Matthew Thomas', '978-1-72460-134-6', '140','https://picsum.photos/609/935','Esperanto','5','Summary 88','[responsibility, less, alone]','5'),              #88
	('The Mirrors Edge', 'Matthew Stephens', '978-0-216-21360-9', '211','https://picsum.photos/114/918','Inupiaq','0','Summary 89','[federal, pattern, anything]','5'),                     #89
	('The Silent Cavern', 'Judy Clark', '978-0-04-072377-0', '185','https://placekitten.com/392/103','Tatar','5','Summary 90','[strong, better, any]','5'),                                 #90
	('The Shrouded Enigma', 'Adrienne Hernandez', '978-1-4733-0435-2', '289','https://dummyimage.com/127x95','Sanskrit','4','Summary 91','[cold, religious, somebody]','6'),                #91
	('The Enchanted Isle', 'Sharon Nelson', '978-1-128-23077-7', '212','https://picsum.photos/126/113','Ossetian','0','Summary 92','[property, five, conference]','6'),                     #92
	('The Phantoms Embrace', 'Katherine Caldwell', '978-0-325-89250-4', '385','https://placekitten.com/48/1000','Central Khmer','5','Summary 93','[wind, modern, analysis]','6'),           #93
	('The Forgotten Empire', 'Jennifer Campbell', '978-1-69655-493-0', '405','https://dummyimage.com/643x534','Urdu','3','Summary 94','[above, spend, left]','6'),                          #94
	('The Cursed Curse', 'Denise Moore', '978-1-5040-4043-3', '358','https://picsum.photos/709/147','Oromo','0','Summary 95','[painting, forward, member]','6'),                            #95
	('Whispers in the Moonlight', 'Ricky Watson', '978-0-581-28105-0', '154','https://picsum.photos/640/397','Lingala','0','Summary 96','[peace, people, discussion]','6'),                 #96
	('The Shadowed Legacy', 'Corey Kim', '978-1-05-379185-5', '121','https://placekitten.com/47/501','Uzbek','0','Summary 97','[likely, look, finally]','6'),                               #97
	('The Mystics Prophecy', 'Justin Smith', '978-1-232-27397-4', '306','https://placekitten.com/830/296','Slovenian','0','Summary 98','[just, no, program]','6'),                          #98
	('The Vanishing Spell', 'Jason Espinoza', '978-1-00-787817-5', '211','https://placekitten.com/605/535','Bosnian','4','Summary 99','[consider, role, news]','6'),                        #99
	('The Forbidden Scroll', 'Deborah Sanchez', '978-0-7628-7347-0', '460','https://picsum.photos/296/298','Italian','4','Summary 100','[last, all, western]','6'),                         #100
        ('The Iliad', 'Danielle Montgomery', '978-1-86116-860-3', '579','https://placekitten.com/595/311','Italian','1','Summary 101','[only, health, take]','6'),                              #101
	('The Great Gatsby', 'Hannah Smith', '978-0-526-87127-8', '225','https://placekitten.com/20/463','Slovenian','4','Summary 102','[recent, child, raise]','6'),                           #102
	('To Kill a Mockingbird', 'Kevin Cannon', '978-0-448-56096-0', '324','https://picsum.photos/359/641','Twi','3','Summary 103','[daughter, player, raise]','6'),                          #103
	('1984', 'Veronica Pitts', '978-0-457-14463-2', '104','https://placekitten.com/979/904','Latvian','5','Summary 104','[popular, ahead, book]','6'),                                      #104
	('Pride and Prejudice', 'Roger Adams', '978-0-284-49466-5', '564','https://placekitten.com/779/918','Yoruba','4','Summary 105','[allow, opportunity, call]','6'),                       #105
	('The Catcher in the Rye', 'Erik Guerra', '978-0-596-10233-3', '403','https://placekitten.com/208/433','Croatian','3','Summary 106','[particular, crime, design]','6'),                 #106
	('The Lord of the Rings', 'Jeffrey Suarez', '978-0-591-47926-3', '227','https://picsum.photos/332/692','Luxembourgish','0','Summary 107','[morning, the, follow]','6'),                 #107
	('Harry Potter and the Sorcerers Stone', 'Kristy Thomas', '978-1-61944-159-0', '339','https://picsum.photos/909/492','Gujarati','5','Summary 108','[material, during, give]','6'),      #108
	('The Chronicles of Narnia', 'Diana Sweeney', '978-0-8089-7801-5', '112','https://picsum.photos/895/255','Sinhala','3','Summary 109','[around, million, all]','6'),                     #109
	('Moby-Dick', 'Eric Baker', '978-1-9831-5247-4', '104','https://dummyimage.com/83x480','Telugu','5','Summary 110','[all, scene, consumer]','6'),                                        #110
	('The Hobbit', 'Valerie Smith', '978-1-61195-657-3', '307','https://picsum.photos/510/455','Shona','2','Summary 111','[ok, kitchen, step]','7'),                                        #111
	('The Great Gatsby', 'Joseph Hernandez', '978-1-78471-752-0', '158','https://placekitten.com/122/773','Icelandic','4','Summary 112','[rate, write, never]','7'),                        #112
	('The Alchemist', 'Joshua Wright', '978-1-58571-342-4', '399','https://placekitten.com/414/156','Urdu','4','Summary 113','[team, six, question]','7'),                                  #113
	('Brave New World', 'Stephanie Gibson', '978-0-405-57558-7', '493','https://placekitten.com/799/1019','Marathi','4','Summary 114','[human, two, dark]','7'),                            #114
	('Animal Farm', 'Elizabeth Holt', '978-1-75838-466-6', '193','https://dummyimage.com/851x487','Tamil','2','Summary 115','[fear, themselves, every]','7'),                               #115
	('Gone with the Wind', 'Natasha Griffin', '978-0-8319-2975-6', '488','https://picsum.photos/414/464','Armenian','4','Summary 116','[beyond, Mrs, color]','7'),                          #116
	('The Hunger Games', 'Miss Jennifer Sanchez', '978-0-18-558257-7', '325','https://placekitten.com/593/874','Maori','0','Summary 117','[huge, goal, certainly]','7'),                    #117
	('The Da Vinci Code', 'David Lawson', '978-0-9766801-9-2', '428','https://dummyimage.com/780x516','Croatian','2','Summary 118','[what, evening, experience]','7'),                      #118
	('The Hitchhikers Guide to the Galaxy', 'Stephanie Chang', '978-0-679-56923-7', '531','https://dummyimage.com/422x608','Azerbaijani','4','Summary 119','[I, easy, among]','7'),         #119
	('The Shining', 'Kimberly Vaughn', '978-0-7212-8432-3', '140','https://dummyimage.com/232x776','Javanese','0','Summary 120','[democratic, guy, move]','7'),                             #120
	('The Picture of Dorian Gray', 'Kathleen Nguyen', '978-0-237-34038-4', '170','https://placekitten.com/543/466','Aragonese','0','Summary 121','[project, fund, set]','7'),               #121
	('Fahrenheit 451', 'Sara Gibson', '978-0-384-08996-9', '451','https://picsum.photos/559/167','Yiddish','5','Summary 122','[style, choice, nature]','7'),                                #122
	('Jane Eyre', 'Dr. Briana Love', '978-0-269-44981-9', '587','https://dummyimage.com/888x15','Amharic','3','Summary 123','[peace, might, lot]','7'),                                     #123
	('The Odyssey', 'Alicia Ball', '978-1-313-08987-6', '212','https://placekitten.com/623/880','Kikuyu','2','Summary 124','[always, technology, fire]','7'),                               #124
	('The Divine Comedy', 'Michael Fisher', '978-1-158-90730-4', '245','https://placekitten.com/349/270','Tsonga','0','Summary 125','[money, carry, near]','7'),                            #125
	('The Girl with the Dragon Tattoo', 'Tracy Warren', '978-0-7036-9928-2', '242','https://placekitten.com/679/968','Kuanyama','5','Summary 126','[lot, today, way]','7'),                 #126
	('The Kite Runner', 'John Dixon', '978-0-926850-14-9', '229','https://picsum.photos/628/36','Kinyarwanda','3','Summary 127','[rule, appear, manage]','7'),                              #127
	('The Handmaids Tale', 'Kelly Sharp', '978-1-946517-33-3', '571','https://placekitten.com/912/939','Albanian','3','Summary 128','[result, anything, middle]','7'),                      #128
	('The Book Thief', 'Robert Bell', '978-1-5041-3274-9', '385','https://placekitten.com/583/977','Croatian','3','Summary 129','[despite, vote, for]','7'),                                #129
	('The Color Purple', 'Anthony Lawson', '978-0-86530-743-8', '104','https://placekitten.com/286/67','Afar','5','Summary 130','[their, key, certain]','7'),                               #130
	('The Sun Also Rises', 'Thomas Nelson', '978-1-82429-852-1', '208','https://dummyimage.com/830x48','Tswana','2','Summary 131','[matter, nation, food]','8'),                            #131
	('Catch-22', 'Dustin Castillo', '978-0-535-02311-8', '240','https://placekitten.com/607/323','Breton','0','Summary 132','[notice, I, walk]','8'),                                       #132
	('The Adventures of Huckleberry Finn', 'Jeff Cruz', '978-1-09-161877-0', '241','https://placekitten.com/988/689','Avaric','0','Summary 133','[doctor, than, bag]','8'),                 #133
	('One Hundred Years of Solitude', 'Joseph Merritt', '978-1-268-21158-2', '275','https://placekitten.com/107/455','Wolof','0','Summary 134','[surface, article, church]','8'),           #134
	('Beloved', 'Michael Mccormick', '978-0-8112-5953-8', '102','https://picsum.photos/813/654','Ganda','4','Summary 135','[chance, conference, instead]','8'),                             #135
	('Frankenstein', 'Susan Martin', '978-1-03-751378-7', '429','https://placekitten.com/814/301','Galician','1','Summary 136','[tend, possible, economy]','8'),                            #136
	('The Scarlet Letter', 'Angel Cross', '978-1-86683-146-5', '222','https://picsum.photos/886/149','Bislama','0','Summary 137','[after, response, institution]','8'),                     #137
	('The Grapes of Wrath', 'Derek Snow', '978-1-208-38579-3', '474','https://placekitten.com/1013/92','Cree','4','Summary 138','[education, organization, without]','8'),                  #138
	('War and Peace', 'Lucas Nicholson', '978-0-624-60307-8', '382','https://placekitten.com/207/465','Pushto','2','Summary 139','[entire, scientist, structure]','8'),                     #139
	('The Count of Monte Cristo', 'Haley Chavez', '978-1-05-092821-6', '145','https://dummyimage.com/102x70','Korean','0','Summary 140','[scene, PM, sign]','8'),                           #140
	('Pride and Prejudice', 'Patricia Harris', '978-1-04-383414-2', '298','https://placekitten.com/846/742','Indonesian','4','Summary 141','[story, idea, south]','8'),                     #141
	('Don Quixote', 'Douglas Parsons', '978-1-195-03759-0', '299','https://placekitten.com/289/530','Pali','4','Summary 142','[itself, conference, I]','8'),                                #142
	('Wuthering Heights', 'Monique Fernandez', '978-1-5422-0689-1', '371','https://placekitten.com/584/622','North Ndebele','0','Summary 143','[full, various, write]','8'),                #143
	('The Lord of the Flies', 'Richard Jackson', '978-1-7339787-0-5', '595','https://picsum.photos/18/751','Afrikaans','1','Summary 144','[ball, something, carry]','8'),                   #144
	('The Outsiders', 'Tonya Walton', '978-1-205-20605-3', '273','https://dummyimage.com/702x86','Haitian','5','Summary 145','[simply, memory, let]','8'),                                  #145
	('A Tale of Two Cities', 'Larry House', '978-1-69524-770-3', '535','https://picsum.photos/251/725','Norwegian','0','Summary 146','[heavy, realize, dinner]','8'),                       #146
	('The Secret Garden', 'Nicholas Turner', '978-0-219-06219-8', '578','https://placekitten.com/294/5','Basque','0','Summary 147','[tough, media, entire]','8'),                           #147
	('The Little Prince', 'Martin Chang', '978-0-291-44742-5', '140','https://dummyimage.com/534x919','Ndonga','4','Summary 148','[race, special, music]','8'),                             #148
	('Les Misérables', 'Robert Durham', '978-1-334-82090-8', '350','https://placekitten.com/998/831','Fulah','0','Summary 149','[accept, throughout, own]','8'),                            #149
	('The Iliad', 'Benjamin Ramirez', '978-0-15-159300-2', '119','https://dummyimage.com/837x647','Persian','3','Summary 150','[condition, car, sport]','8');                               #150



--
-- Insert 15 Book's Thematic Categories to the books
--

INSERT INTO book_thematic_categories(thematic_category,book_id) VALUES								
('Crime', 1),
('Drama', 1),
('Action', 1),
('Science Fiction', 2),
('Graphic Novel', 2),
('Thriller', 2),
('Crime', 3),
('Comedy', 3),
('Drama', 3),
('Action', 4),
('Crime', 4),
('Horror', 4),
('Comedy', 5),
('Drama', 5),
('Graphic Novel', 6),
('Thriller', 6),
('Self-Help', 6),
('Poetry', 7),
('Horror', 7),
('Action', 8),
('Biography', 8),
('Crime', 9),
('Mystery', 9),
('Self-Help', 9),
('Crime', 10),
('Graphic Novel', 10),
('Romance', 11),
('Graphic Novel', 12),
('Science Fiction', 12),
('Mystery', 12),
('Biography', 13),
('Fantasy', 13),
('Action', 14),
('Action', 15),
('Graphic Novel', 16),
('Action', 17),
('Horror', 17),
('Thriller', 17),
('Drama', 18),
('Action', 18),
('Horror', 18),
('Crime', 19),
('Romance', 20),
('Self-Help', 20),
('Action', 20),
('Action', 21),
('Poetry', 21),
('Romance', 21),
('Poetry', 22),
('Thriller', 23),
('Poetry', 23),
('Fantasy', 24),
('Fantasy', 25),
('Horror', 25),
('Action', 25),
('Self-Help', 26),
('Drama', 26),
('Science Fiction', 26),
('Crime', 27),
('Fantasy', 27),
('Comedy', 28),
('Horror', 29),
('Comedy', 29),
('Drama', 30),
('Science Fiction', 30),
('Fantasy', 30),
('Graphic Novel', 31),
('Crime', 31),
('Self-Help', 31),
('Biography', 32),
('Graphic Novel', 33),
('Adventure', 33),
('Comedy', 34),
('Adventure', 34),
('Romance', 34),
('Mystery', 35),
('Crime', 36),
('Drama', 36),
('Drama', 37),
('Biography', 37),
('Science Fiction', 38),
('Self-Help', 39),
('Crime', 40),
('Adventure', 41),
('Science Fiction', 41),
('Graphic Novel', 41),
('Romance', 42),
('Comedy', 43),
('Graphic Novel', 43),
('Adventure', 43),
('Adventure', 44),
('Biography', 45),
('Romance', 46),
('Comedy', 46),
('Crime', 47),
('Science Fiction', 47),
('Romance', 47),
('Thriller', 48),
('Action', 49),
('Science Fiction', 50),
('Fantasy', 50),
('Romance', 51),
('Action', 51),
('Crime', 51),
('Drama', 52),
('Romance', 52),
('Poetry', 52),
('Adventure', 53),
('Graphic Novel', 53),
('Mystery', 54),
('Crime', 55),
('Mystery', 55),
('Action', 55),
('Crime', 56),
('Action', 56),
('Horror', 56),
('Romance', 57),
('Mystery', 58),
('Action', 59),
('Thriller', 59),
('Biography', 60),
('Mystery', 61),
('Thriller', 61),
('Self-Help', 61),
('Crime', 62),
('Crime', 63),
('Poetry', 63),
('Thriller', 63),
('Mystery', 64),
('Poetry', 65),
('Drama', 65),
('Self-Help', 66),
('Mystery', 67),
('Adventure', 68),
('Horror', 69),
('Crime', 69),
('Poetry', 69),
('Poetry', 70),
('Thriller', 70),
('Drama', 70),
('Thriller', 71),
('Self-Help', 71),
('Adventure', 72),
('Science Fiction', 72),
('Graphic Novel', 72),
('Drama', 73),
('Self-Help', 73),
('Science Fiction', 73),
('Horror', 74),
('Fantasy', 74),
('Science Fiction', 75),
('Self-Help', 75),
('Drama', 76),
('Romance', 76),
('Romance', 77),
('Adventure', 78),
('Self-Help', 79),
('Adventure', 79),
('Action', 79),
('Drama', 80),
('Thriller', 81),
('Fantasy', 81),
('Romance', 82),
('Self-Help', 82),
('Crime', 82),
('Comedy', 83),
('Fantasy', 83),
('Graphic Novel', 84),
('Thriller', 85),
('Graphic Novel', 86),
('Horror', 86),
('Drama', 86),
('Adventure', 87),
('Romance', 88),
('Horror', 89),
('Comedy', 89),
('Action', 89),
('Graphic Novel', 90),
('Romance', 91),
('Thriller', 91),
('Horror', 92),
('Drama', 92),
('Graphic Novel', 93),
('Crime', 93),
('Fantasy', 94),
('Self-Help', 95),
('Thriller', 95),
('Poetry', 96),
('Horror', 96),
('Biography', 96),
('Fantasy', 97),
('Drama', 97),
('Horror', 98),
('Comedy', 98),
('Graphic Novel', 98),
('Romance', 99),
('Comedy', 99),
('Graphic Novel', 100),
('Comedy', 100),
('Self-Help', 101),
('Thriller', 101),
('Romance', 101),
('Thriller', 102),
('Comedy', 103),
('Graphic Novel', 104),
('Horror', 104),
('Science Fiction', 105),
('Fantasy', 105),
('Science Fiction', 106),
('Poetry', 106),
('Romance', 106),
('Action', 107),
('Poetry', 108),
('Thriller', 109),
('Comedy', 110),
('Poetry', 110),
('Graphic Novel', 111),
('Poetry', 111),
('Self-Help', 112),
('Graphic Novel', 112),
('Adventure', 113),
('Crime', 114),
('Thriller', 114),
('Self-Help', 115),
('Biography', 115),
('Fantasy', 115),
('Horror', 116),
('Biography', 117),
('Mystery', 117),
('Fantasy', 118),
('Biography', 119),
('Fantasy', 120),
('Thriller', 121),
('Graphic Novel', 121),
('Self-Help', 122),
('Science Fiction', 122),
('Crime', 123),
('Drama', 123),
('Poetry', 123),
('Thriller', 124),
('Horror', 124),
('Graphic Novel', 125),
('Poetry', 126),
('Horror', 127),
('Comedy', 128),
('Thriller', 129),
('Poetry', 130),
('Self-Help', 130),
('Action', 131),
('Crime', 131),
('Comedy', 132),
('Horror', 133),
('Biography', 134),
('Poetry', 134),
('Horror', 135),
('Fantasy', 136),
('Adventure', 137),
('Action', 138),
('Romance', 138),
('Comedy', 139),
('Romance', 139),
('Science Fiction', 139),
('Poetry', 140),
('Romance', 140),
('Mystery', 140),
('Horror', 141),
('Self-Help', 141),
('Comedy', 142),
('Mystery', 143),
('Biography', 144),
('Graphic Novel', 145),
('Horror', 145),
('Self-Help', 146),
('Crime', 146),
('Self-Help', 147),
('Science Fiction', 148),
('Romance', 149),
('Comedy', 149),
('Horror', 150),
('Fantasy', 150),
('Comedy', 150);


--
-- Insert an administrator
--
INSERT INTO administrator(username, password) VALUES 
('Spanoulis', 'SKOPELOS2001');  #1


--
-- Insert authors
--
INSERT INTO book_authors(author , book_id) VALUES
('Lucas Mitchell', 1),
('Michael Lee', 1),
('Angela Khan', 2),
('Todd Wolfe', 2),
('Brenda Ferguson', 3),
('Brenda Ferguson', 4),
('David Bender', 5),
('Charles Warren', 6),
('Brent Gomez', 6),
('Jessica Gonzalez', 7),
('Gwendolyn Wood', 7),
('Mrs. Teresa Gonzalez DDS', 8),
('Frank Gray', 9),
('Elizabeth Hansen', 9),
('Frank Gray', 10),
('Gwendolyn Wood', 10),
('Gwendolyn Wood', 11),
('Angela Williams', 11),
('Joseph Santos', 11),
('Michael Lee', 12),
('Paul Kelly', 12),
('Barbara Jones', 12),
('Elizabeth Hansen', 13),
('Sarah Moore', 14),
('Jennifer Smith', 14),
('Michael Lee', 14),
('Christopher Smith', 15),
('Janet Marks', 15),
('Robin Ramirez', 15),
('Cindy Nelson', 16),
('Felicia Smith', 16),
('Matthew Walker', 17),
('Andrew Macdonald', 18),
('Kimberly Bailey', 18),
('Chad Mcdaniel', 18),
('Lucas Mitchell', 19),
('Andrew Macdonald', 19),
('Sarah Moore', 19),
('Michael Lee', 20),
('Paul Kelly', 20),
('Janet Marks', 21),
('Amy Harris', 21),
('Angela Khan', 21),
('Deanna Green', 22),
('Taylor Johnson', 22),
('Felicia Smith', 22),
('Nicholas Mendez', 23),
('Frank Gray', 23),
('Angela Williams', 23),
('Steven Smith', 24),
('Barbara Jones', 25),
('Frank Gray', 25),
('Cindy Nelson', 26),
('Christopher Smith', 26),
('Lucas Mitchell', 27),
('Brenda Ferguson', 27),
('Sarah Moore', 28),
('Robert Foley', 28),
('Jeffrey Ross', 28),
('Chad Mcdaniel', 29),
('Jennifer Smith', 29),
('Barbara Jones', 29),
('Felicia Smith', 30),
('Chad Mcdaniel', 30),
('Elizabeth Hansen', 30),
('Amy Juarez', 31),
('Tracy Smith', 31),
('Christopher Smith', 31),
('Steven Smith', 32),
('Jessica Gonzalez', 33),
('Dana Mcdonald', 34),
('Janet Marks', 35),
('Emily Robinson', 36),
('Cindy Nelson', 36),
('Jeffrey Ross', 36),
('Brenda Ferguson', 37),
('Richard Rivas', 38),
('Michael Lee', 38),
('Elizabeth Hansen', 38),
('Brooke Adams', 39),
('Jamie Cooley', 40),
('Jordan Curry', 40),
('Felicia Smith', 40),
('Sarah Moore', 41),
('Jeffrey Garcia', 41),
('Frank Gray', 41),
('Elizabeth Hansen', 42),
('Jessica Gonzalez', 42),
('Christopher Smith', 43),
('Janet Marks', 43),
('Brent Gomez', 43),
('Emily Robinson', 44),
('Felicia Smith', 44),
('Jordan Curry', 45),
('Robin Ramirez', 45),
('Mrs. Teresa Gonzalez DDS', 45),
('Steven Smith', 46),
('Michael Lee', 47),
('Tracy Smith', 47),
('Richard Rivas', 47),
('Amy Harris', 48),
('Jennifer Smith', 49),
('Felicia Smith', 49),
('Janet Marks', 50),
('Brooke Adams', 50),
('Elizabeth Hansen', 51),
('Taylor Johnson', 51),
('Dana Mcdonald', 52),
('Jeffrey Ross', 53),
('Jessica Gonzalez', 53),
('Donald Gutierrez', 54),
('Jamie Cooley', 54),
('Michael Lee', 54),
('Brenda Ferguson', 55),
('Gwendolyn Wood', 55),
('Robin Ramirez', 55),
('Gwendolyn Wood', 56),
('Robin Ramirez', 56),
('Janet Marks', 57),
('Donna Craig', 57),
('Chad Mcdaniel', 58),
('Matthew Walker', 58),
('Felicia Smith', 59),
('Brooke Adams', 60),
('Michael Lee', 61),
('Paul Kelly', 61),
('Michael Lee', 62),
('Michael Lee', 63),
('Robin Ramirez', 63),
('Richard Rivas', 64),
('Matthew Walker', 64),
('Angela Khan', 65),
('Brent Gomez', 65),
('Amy Harris', 65),
('Kimberly Bailey', 66),
('Todd Wolfe', 66),
('Emily Robinson', 67),
('Tracy Smith', 67),
('Jennifer Smith', 68),
('Cindy Nelson', 68),
('Amy Juarez', 68),
('Mrs. Teresa Gonzalez DDS', 69),
('Robin Ramirez', 69),
('Paul Kelly', 70),
('Jordan Curry', 70),
('David Bender', 70),
('Paul Kelly', 71),
('Sarah Moore', 71),
('Gwendolyn Wood', 71),
('Tracy Smith', 72),
('Andrew Macdonald', 72),
('Dana Mcdonald', 73),
('Frank Gray', 73),
('Amy Harris', 74),
('Michael Lee', 75),
('David Bender', 75),
('Gwendolyn Wood', 75),
('Robert Foley', 76),
('Richard Rivas', 76),
('Tracy Smith', 76),
('Angela Williams', 77),
('Tracy Smith', 77),
('Janet Marks', 78),
('Nicholas Mendez', 78),
('Jennifer Smith', 78),
('Emily Robinson', 79),
('Brent Gomez', 79),
('Taylor Johnson', 80),
('Jeffrey Ross', 80),
('Matthew Simmons', 80),
('Jordan Curry', 81),
('Donna Craig', 82),
('Jordan Curry', 82),
('Cindy Nelson', 82),
('Deanna Green', 83),
('Dana Mcdonald', 83),
('Amy Juarez', 84),
('David Bender', 84),
('Michael Parker', 85),
('Dana Mcdonald', 85),
('Michael Lee', 86),
('Felicia Smith', 86),
('Frank Gray', 87),
('Felicia Smith', 87),
('Steven Smith', 87),
('Amy Harris', 88),
('Barbara Jones', 88),
('Amy Harris', 89),
('Gwendolyn Wood', 89),
('Brent Gomez', 89),
('Tracy Smith', 90),
('Jeffrey Garcia', 90),
('Robin Ramirez', 90),
('Felicia Smith', 91),
('Brent Gomez', 91),
('Steven Smith', 91),
('Michael Parker', 92),
('Emily Robinson', 93),
('Mrs. Teresa Gonzalez DDS', 93),
('Paul Kelly', 93),
('Elizabeth Hansen', 94),
('Donald Gutierrez', 95),
('Jamie Cooley', 95),
('Paul Kelly', 96),
('Christopher Smith', 96),
('Nicholas Mendez', 97),
('Brenda Ferguson', 97),
('Michael Parker', 98),
('Kimberly Bailey', 99),
('Cindy Nelson', 100),
('Gwendolyn Wood', 100),
('Amy Juarez', 100),
('Sophia Turner', 101),
('Oliver Mitchell', 101),
('Ella Thompson', 102),
('Emma Martinez', 103),
('Benjamin Turner', 103),
('Daniel Thompson', 103),
('Ava Adams', 104),
('Charlotte Carter', 105),
('Emily Lewis', 105),
('Ava Mitchell', 106),
('Jacob Scott', 106),
('Emily Walker', 107),
('Sophia Martinez', 107),
('Olivia Wright', 108),
('Alexander Roberts', 108),
('Liam Anderson', 108),
('Isabella Clark', 109),
('Oliver Lewis', 110),
('Emma Turner', 110),
('Alexander Johnson', 111),
('Ethan Anderson', 112),
('Jacob Scott', 113),
('Mia Johnson', 113),
('Emily Roberts', 113),
('Oliver Phillips', 114),
('Sophia Harris', 114),
('Liam Mitchell', 115),
('Emma Green', 116),
('Sophia Wilson', 116),
('James Turner', 117),
('Charlotte Harris', 117),
('Ethan Martinez', 118),
('Daniel Green', 118),
('Olivia Thompson', 118),
('Emily Baker', 119),
('Alexander Adams', 129),
('Olivia Davis', 120),
('James Thompson', 121),
('William Phillips', 122),
('Emma Anderson', 122),
('Elijah Young', 123),
('Ava Carter', 123),
('Isabella Wilson', 124),
('Emily Walker', 124),
('Olivia Hall', 124),
('James Clark', 125),
('Emily Anderson', 126),
('Oliver Mitchell', 127),
('Sophia Turner', 128),
('Jacob Harris', 129),
('Mia Turner', 130),
('Ethan Baker', 130),
('Charlotte Green', 131),
('Alexander Johnson', 132),
('Olivia Wilson', 133),
('James Thompson', 134),
('Emma Martinez', 134),
('Sophia Roberts', 135),
('Liam Scott', 135),
('Ava Walker', 135),
('Emily Adams', 136),
('Oliver Clark', 137),
('Isabella Turner', 138),
('Ella Wilson', 138),
('Jacob Phillips', 139),
('Mia Harris', 140),
('Olivia Anderson', 140),
('Daniel Martinez', 140),
('Sophia Baker', 141),
('Emily Wright', 141),
('Charlotte Turner', 142),
('Sophia Turner', 143),
('Olivia Collins', 144),
('Emma Martinez', 145),
('Daniel Thompson', 145),
('Charlotte Carter', 146),
('Ava Mitchell', 146),
('Emily Walker', 147),
('Oliver Wilson', 148),
('Liam Anderson', 148),
('Oliver Lewis', 148),
('Isabella Johnson', 149),
('Mia Davis', 150);





--
-- INSERT 240 BOOK BORROWINGS 
--
INSERT INTO book_borrowing(borrowing_date,return_date,actual_return_date,book_id,stud_prof_id) VALUES

('2023-01-09', '2023-01-16', '2023-01-12', 9, 25),
('2023-01-20', '2023-01-27', '2023-01-24', 2, 27),
('2023-02-20', '2023-02-27', '2023-02-25', 9, 29),
('2022-05-10', '2022-05-17', '2022-05-15', 1, 26),
('2023-02-10', '2023-02-17', '2023-02-14', 9, 30),
('2023-04-20', '2023-04-27', '2023-04-23', 5, 1),
('2020-03-01', '2020-03-08', '2020-03-03', 3, 28),
('2023-04-01', '2023-04-08', '2023-04-05', 15, 3),
('2022-02-02', '2022-02-09', '2022-02-06', 6, 28),
('2023-04-20', '2023-04-27', '2023-04-22', 2, 29),

('2023-05-20', '2023-05-27', NULL, 10, 3),
('2023-04-10', '2023-04-17', NULL, 12, 27),
('2023-05-24', '2023-05-31', NULL, 1, 30),
('2023-05-10', '2023-05-17', NULL, 6, 28),
('2023-02-12', '2023-02-19', NULL, 7, 31),
('2023-04-03', '2023-04-10', NULL, 8, 2),
('2023-01-26', '2023-02-02', NULL, 13, 3),
('2023-04-05', '2023-04-12', NULL, 4, 32),
('2023-03-09', '2023-03-16', NULL, 14, 26),
('2023-02-10', '2023-02-17', NULL, 11, 25),

('2021-11-14', '2021-11-21', '2021-12-24', 5, 2),
('2020-06-18', '2020-06-25', '2020-12-25', 10, 25),
('2023-02-11', '2023-02-18', '2023-02-28', 1, 27),
('2020-06-25', '2020-07-02', '2020-10-28', 10, 3),
('2022-10-10', '2022-10-17', '2022-12-16', 9, 28),
('2021-05-19', '2021-05-26', '2021-09-29', 15, 3),
('2020-12-07', '2020-12-14', '2020-12-20', 11, 3),
('2023-01-10', '2023-01-17', '2023-02-26', 1, 32),
('2023-01-18', '2023-01-25', '2023-01-28', 15, 1),
('2023-04-17', '2023-04-24', '2023-11-28', 16, 26),

('2023-01-09', '2023-01-16', '2023-01-10', 29, 33),
('2023-01-10', '2023-01-17', '2023-01-15', 32, 35),
('2023-02-27', '2023-03-06', '2023-02-27', 33, 37),
('2023-01-28', '2023-02-04', '2023-01-28', 23, 34),
('2023-02-25', '2023-03-03', '2023-02-26', 17, 4),
('2023-01-23', '2023-01-30', '2023-01-27', 29, 6),
('2023-03-01', '2023-03-08', '2023-03-01', 21, 36),
('2023-04-02', '2023-04-09', '2023-04-05', 19, 38),
('2023-02-02', '2023-02-09', '2023-02-06', 24, 36),
('2023-01-10', '2023-01-17', '2023-01-15', 32, 5),

('2023-05-24', '2023-05-31', NULL, 26, 39),
('2023-03-13', '2023-03-20', NULL, 19, 6),
('2023-05-24', '2023-05-31', NULL, 23, 38),
('2023-05-10', '2023-05-17', NULL, 17, 36),
('2023-02-12', '2023-02-19', NULL, 21, 5),
('2023-04-03', '2023-04-10', NULL, 29, 4),
('2023-01-26', '2023-02-02', NULL, 33, 35),
('2023-04-05', '2023-04-12', NULL, 24, 40),
('2023-03-09', '2023-03-16', NULL, 22, 34),
('2023-02-10', '2023-02-17', NULL, 32, 33),

('2021-11-14', '2021-11-21', '2021-11-22', 33, 5),
('2022-06-18', '2022-06-25', '2022-06-26', 28, 33),
('2023-01-11', '2023-01-18', '2023-01-19', 31, 37),
('2020-06-25', '2020-07-02', '2020-07-03', 18, 6),
('2022-10-10', '2022-10-17', '2022-10-18', 17, 36),
('2021-05-19', '2021-05-26', '2021-05-27', 29, 6),
('2020-12-07', '2020-12-14', '2020-12-15', 17, 40),
('2022-04-24', '2022-05-01', '2022-05-02', 27, 5),
('2021-12-18', '2021-12-25', '2021-12-26', 17, 4),
('2021-04-17', '2021-04-24', '2021-04-25', 26, 34),

('2023-01-09', '2023-01-16', '2023-01-16', 47, 41),
('2021-01-20', '2021-01-27', '2021-01-27', 50, 43),
('2021-02-27', '2021-03-06', '2021-03-06', 51, 45),
('2022-01-28', '2022-02-04', '2022-02-04', 41, 42),
('2020-02-25', '2020-03-03', '2020-03-03', 35, 7),
('2022-04-23', '2022-04-30', '2022-04-30', 47, 46),
('2020-03-01', '2020-03-08', '2020-03-08', 39, 44),
('2023-04-02', '2023-04-09', '2023-04-09', 37, 9),
('2022-02-02', '2022-02-09', '2022-02-09', 42, 47),
('2022-04-26', '2022-05-03', '2022-05-03', 50, 8),

('2023-05-24', '2023-05-31', NULL, 49, 46),
('2023-03-13', '2023-03-20', NULL, 35, 9),
('2023-05-24', '2023-05-31', NULL, 51, 7),
('2023-05-10', '2023-05-17', NULL, 36, 44),
('2023-02-12', '2023-02-19', NULL, 37, 43),
('2023-04-03', '2023-04-10', NULL, 38, 8),
('2023-01-26', '2023-02-02', NULL, 39, 45),
('2023-04-05', '2023-04-12', NULL, 44, 48),
('2023-03-09', '2023-03-16', NULL, 48, 42),
('2023-02-10', '2023-02-17', NULL, 50, 41),

('2021-11-14', '2021-11-21', '2021-11-22', 51, 8),
('2022-06-18', '2022-06-25', '2022-06-26', 46, 41),
('2022-06-11', '2022-06-18', '2022-06-19', 49, 43),
('2020-06-25', '2020-07-02', '2020-07-03', 36, 9),
('2022-10-10', '2022-10-17', '2022-10-18', 35, 44),
('2021-05-19', '2021-05-26', '2021-05-27', 47, 47),
('2020-12-07', '2020-12-14', '2020-12-15', 35, 9),
('2022-04-24', '2022-05-01', '2022-05-02', 45, 48),
('2021-12-18', '2021-12-25', '2021-12-26', 35, 7),
('2021-04-17', '2021-04-24', '2021-04-25', 44, 42),

('2023-01-09', '2023-01-16', '2023-01-16', 68, 49),
('2021-01-20', '2021-01-27', '2021-01-27', 60, 51),
('2021-02-27', '2021-03-06', '2021-03-06', 57, 49),
('2022-01-28', '2022-02-04', '2022-02-04', 61, 50),
('2020-02-25', '2020-03-03', '2020-03-03', 55, 10),
('2022-04-23', '2022-04-30', '2022-04-30', 64, 12),
('2020-03-01', '2020-03-08', '2020-03-08', 61, 52),
('2023-04-02', '2023-04-09', '2023-04-09', 55, 20),
('2022-02-02', '2022-02-09', '2022-02-09', 57, 52),
('2022-04-26', '2022-05-03', '2022-05-03', 69, 11),

('2023-05-24', '2023-05-31', NULL, 60, 54),
('2023-03-13', '2023-03-20', NULL, 56, 12),
('2023-05-24', '2023-05-31', NULL, 53, 53),
('2023-05-10', '2023-05-17', NULL, 70, 52),
('2023-02-12', '2023-02-19', NULL, 68, 10),
('2023-04-03', '2023-04-10', NULL, 71, 11),
('2023-01-26', '2023-02-02', NULL, 63, 51),
('2023-04-05', '2023-04-12', NULL, 61, 56),
('2023-03-09', '2023-03-16', NULL, 55, 50),
('2023-02-10', '2023-02-17', NULL, 68, 49),

('2021-11-14', '2021-11-21', '2021-11-22', 61, 11),
('2022-06-18', '2022-06-25', '2022-06-26', 63, 49),
('2022-06-11', '2022-06-18', '2022-06-19', 71, 51),
('2020-06-25', '2020-07-02', '2020-07-03', 55, 12),
('2022-10-10', '2022-10-17', '2022-10-18', 64, 52),
('2021-05-19', '2021-05-26', '2021-05-27', 70, 12),
('2020-12-07', '2020-12-14', '2020-12-15', 54, 12),
('2022-04-24', '2022-05-01', '2022-05-02', 61, 11),
('2021-12-18', '2021-12-25', '2021-12-26', 69, 10),
('2021-04-17', '2021-04-24', '2021-04-25', 69, 50),

('2023-01-09', '2023-01-16', '2023-01-10', 87, 57),
('2021-01-20', '2021-01-27', '2021-01-27', 79, 59),
('2021-02-27', '2021-03-06', '2021-03-06', 76, 57),
('2022-01-28', '2022-02-04', '2022-02-04', 80, 58),
('2020-02-25', '2020-03-03', '2020-03-03', 74, 13),
('2022-04-23', '2022-04-30', '2022-04-30', 83, 15),
('2020-03-01', '2020-03-08', '2020-03-08', 80, 60),
('2023-04-02', '2023-04-09', '2023-04-09', 74, 15),
('2022-02-02', '2022-02-09', '2022-02-09', 76, 60),
('2022-04-26', '2022-05-03', '2022-05-03', 88, 14),

('2023-05-24', '2023-05-31', NULL, 79, 61),
('2023-03-13', '2023-03-20', NULL, 86, 13),
('2023-05-24', '2023-05-31', NULL, 72, 62),
('2023-05-10', '2023-05-17', NULL, 89, 60),
('2023-02-12', '2023-02-19', NULL, 87, 63),
('2023-04-03', '2023-04-10', NULL, 81, 14),
('2023-01-26', '2023-02-02', NULL, 78, 15),
('2023-04-05', '2023-04-12', NULL, 73, 64),
('2023-03-09', '2023-03-16', NULL, 75, 58),
('2023-02-10', '2023-02-17', NULL, 84, 57),

('2021-11-14', '2021-11-21', '2021-11-24', 80, 14),
('2022-06-18', '2022-06-25', '2022-06-26', 82, 57),
('2022-06-11', '2022-06-18', '2022-06-19', 90, 59),
('2020-06-25', '2020-07-02', '2020-07-03', 74, 15),
('2022-10-10', '2022-10-17', '2022-10-18', 83, 60),
('2021-05-19', '2021-05-26', '2021-05-29', 89, 15),
('2020-12-07', '2020-12-14', '2020-12-20', 73, 15),
('2022-04-24', '2022-05-01', '2022-05-03', 80, 14),
('2021-12-18', '2021-12-25', '2021-12-28', 88, 13),
('2021-04-17', '2021-04-24', '2021-04-26', 88, 58),

('2023-01-09', '2023-01-16', '2023-01-10', 107, 65),
('2021-01-20', '2021-01-27', '2021-01-24', 108, 67),
('2021-02-27', '2021-03-06', '2021-02-27', 103, 65),
('2022-01-28', '2022-02-04', '2022-01-28', 95, 66),
('2020-02-25', '2020-03-03', '2020-03-01', 95, 16),
('2022-04-23', '2022-04-30', '2022-04-27', 99, 18),
('2020-03-01', '2020-03-08', '2020-03-02', 105, 68),
('2023-04-02', '2023-04-09', '2023-04-05', 101, 18),
('2022-02-02', '2022-02-09', '2022-02-06', 92, 68),
('2022-04-26', '2022-05-03', '2022-04-27', 104, 17),

('2023-05-24', '2023-05-31', NULL, 95, 70),
('2023-03-13', '2023-03-20', NULL, 92, 18),
('2023-05-24', '2023-05-31', NULL, 97, 67),
('2023-05-10', '2023-05-17', NULL, 96, 68),
('2023-02-12', '2023-02-19', NULL, 101, 16),
('2023-04-03', '2023-04-10', NULL, 105, 17),
('2023-01-26', '2023-02-02', NULL, 99, 71),
('2023-04-05', '2023-04-12', NULL, 98, 72),
('2023-03-09', '2023-03-16', NULL, 107, 66),
('2023-02-10', '2023-02-17', NULL, 103, 65),

('2021-11-14', '2021-11-21', '2021-11-22', 95, 17),
('2022-06-18', '2022-06-25', '2022-06-26', 96, 65),
('2022-06-11', '2022-06-18', '2022-06-25', 95, 67),
('2020-06-25', '2020-07-02', '2020-07-05', 108, 18),
('2022-10-10', '2022-10-17', '2022-10-19', 107, 68),
('2021-05-19', '2021-05-26', '2021-05-29', 93, 18),
('2020-12-07', '2020-12-14', '2020-12-20', 93, 18),
('2022-04-24', '2022-05-01', '2022-05-03', 91, 17),
('2021-12-18', '2021-12-25', '2021-12-29', 101, 16),
('2021-04-17', '2021-04-24', '2021-04-28', 102, 66),

('2023-01-09', '2023-01-16', '2023-01-10', 127, 73),
('2021-01-20', '2021-01-27', '2021-01-24', 128, 75),
('2021-02-27', '2021-03-06', '2021-02-27', 123, 73),
('2022-01-28', '2022-02-04', '2022-01-28', 115, 74),
('2020-02-25', '2020-03-03', '2020-03-02', 115, 19),
('2022-04-23', '2022-04-30', '2022-04-27', 119, 21),
('2020-03-01', '2020-03-08', '2020-03-05', 125, 76),
('2023-04-02', '2023-04-09', '2023-04-06', 121, 21),
('2022-02-02', '2022-02-09', '2022-02-06', 112, 76),
('2022-04-26', '2022-05-03', '2022-04-26', 124, 20),

('2023-05-24', '2023-05-31', NULL, 114, 19),
('2023-03-13', '2023-03-20', NULL, 119, 21),
('2023-05-24', '2023-05-31', NULL, 120, 78),
('2023-05-10', '2023-05-17', NULL, 116, 76),
('2023-02-12', '2023-02-19', NULL, 121, 75),
('2023-04-03', '2023-04-10', NULL, 125, 20),
('2023-01-26', '2023-02-02', NULL, 119, 79),
('2023-04-05', '2023-04-12', NULL, 118, 80),
('2023-03-09', '2023-03-16', NULL, 117, 74),
('2023-02-10', '2023-02-17', NULL, 123, 73),

('2021-11-14', '2021-11-21', '2021-11-24', 115, 20),
('2022-06-18', '2022-06-25', '2022-06-28', 116, 73),
('2022-06-11', '2022-06-18', '2022-06-20', 115, 75),
('2020-06-25', '2020-07-02', '2020-07-05', 128, 21),
('2022-10-10', '2022-10-17', '2022-10-19', 127, 76),
('2021-05-19', '2021-05-26', '2021-05-29', 113, 21),
('2020-12-07', '2020-12-14', '2020-12-20', 113, 21),
('2022-04-24', '2022-05-01', '2022-05-05', 111, 20),
('2021-12-18', '2021-12-25', '2021-12-28', 121, 19),
('2021-04-17', '2021-04-24', '2021-04-28', 122, 74),

('2023-01-09', '2023-01-16', '2023-01-10', 147, 81),
('2021-01-20', '2021-01-27', '2021-01-24', 148, 83),
('2021-02-27', '2021-03-06', '2021-02-27', 143, 81),
('2022-01-28', '2022-02-04', '2022-01-28', 135, 82),
('2020-02-25', '2020-03-03', '2020-03-01', 135, 22),
('2022-04-23', '2022-04-30', '2022-04-27', 139, 24),
('2020-03-01', '2020-03-08', '2020-03-01', 145, 84),
('2023-04-02', '2023-04-09', '2023-04-05', 141, 24),
('2022-02-02', '2022-02-09', '2022-02-06', 132, 84),
('2022-04-26', '2022-05-03', '2022-04-26', 144, 23),

('2023-05-24', '2023-05-31', NULL, 134, 83),
('2023-03-13', '2023-03-20', NULL, 132, 84),
('2023-05-24', '2023-05-31', NULL, 137, 86),
('2023-05-10', '2023-05-17', NULL, 133, 85),
('2023-02-12', '2023-02-19', NULL, 140, 22),
('2023-04-03', '2023-04-10', NULL, 143, 23),
('2023-01-26', '2023-02-02', NULL, 146, 24),
('2023-04-05', '2023-04-12', NULL, 138, 88),
('2023-03-09', '2023-03-16', NULL, 147, 82),
('2023-02-10', '2023-02-17', NULL, 149, 81),

('2021-11-14', '2021-11-21', '2021-11-24', 135, 23),
('2022-06-18', '2022-06-25', '2022-06-29', 136, 81),
('2022-06-11', '2022-06-18', '2022-06-23', 135, 83),
('2020-06-25', '2020-07-02', '2020-07-04', 148, 24),
('2022-10-10', '2022-10-17', '2022-10-19', 147, 84),
('2021-05-19', '2021-05-26', '2021-05-30', 133, 24),
('2020-12-07', '2020-12-14', '2020-12-20', 133, 24),
('2022-04-24', '2022-05-01', '2022-05-04', 131, 23),
('2021-12-18', '2021-12-25', '2021-12-30', 141, 22),
('2021-04-17', '2021-04-24', '2021-04-30', 142, 82);


--
-- Insert 50 reservation data 
--

INSERT INTO reservations(book_id, stud_prof_id, reservation_date, expiry_date, status) VALUES
(1, 27, '2023-05-31', '2023-06-07', 'active'), 
(6, 29, '2023-05-31', '2023-06-07', 'active'),
(7, 30, '2023-05-31', '2023-06-07', 'active'),
(8, 28, '2023-05-31', '2023-06-07', 'active'),
(10, 25, '2023-05-31', '2023-06-07', 'active'),
(12, 26, '2023-05-31', '2023-06-07', 'active'),
(14, 31, '2023-05-31', '2023-06-07', 'active'),
(17, 33, '2023-05-31', '2023-06-07', 'active'),
(19, 34, '2023-05-31', '2023-06-07', 'active'),
(22, 35, '2023-05-31', '2023-06-07', 'active'),
(26, 36, '2023-05-31', '2023-06-07', 'active'),
(29, 37, '2023-05-31', '2023-06-07', 'active'),
(33, 38, '2023-05-31', '2023-06-07', 'active'),
(36, 41, '2023-05-31', '2023-06-07', 'active'),
(38, 42, '2023-05-31', '2023-06-07', 'active'),
(39, 43, '2023-05-31', '2023-06-07', 'active'),
(44, 44, '2023-05-31', '2023-06-07', 'active'),
(48, 45, '2023-05-31', '2023-06-07', 'active'),
(50, 46, '2023-05-31', '2023-06-07', 'active'),
(53, 49, '2023-05-31', '2023-06-07', 'active'),
(55, 51, '2023-05-31', '2023-06-07', 'active'),
(60, 50, '2023-05-31', '2023-06-07', 'active'),
(61, 52, '2023-05-31', '2023-06-07', 'active'),
(63, 53, '2023-05-31', '2023-06-07', 'active'),
(68, 54, '2023-05-31', '2023-06-07', 'active'),
(71, 55, '2023-05-31', '2023-06-07', 'active'),
(73, 57, '2023-05-31', '2023-06-07', 'active'),
(78, 58, '2023-05-31', '2023-06-07', 'active'),
(81, 59, '2023-05-31', '2023-06-07', 'active'),
(84, 60, '2023-05-31', '2023-06-07', 'active'),
(86, 61, '2023-05-31', '2023-06-07', 'active'),
(89, 62, '2023-05-31', '2023-06-07', 'active'),
(92, 65, '2023-05-31', '2023-06-07', 'active'),
(95, 66, '2023-05-31', '2023-06-07', 'active'),
(96, 67, '2023-05-31', '2023-06-07', 'active'),
(97, 68, '2023-05-31', '2023-06-07', 'active'),
(98, 69, '2023-05-31', '2023-06-07', 'active'),
(107, 70, '2023-05-31', '2023-06-07', 'active'),
(117, 73, '2023-05-31', '2023-06-07', 'active'),
(120, 74, '2023-05-31', '2023-06-07', 'active'),
(121, 76, '2023-05-31', '2023-06-07', 'active'),
(125, 75, '2023-05-31', '2023-06-07', 'active'),
(132, 81, '2023-05-31', '2023-06-07', 'active'),
(133, 82, '2023-05-31', '2023-06-07', 'active'),
(134, 84, '2023-05-31', '2023-06-07', 'active'),
(137, 83, '2023-05-31', '2023-06-07', 'active'),
(140, 85, '2023-05-31', '2023-06-07', 'active'),
(143, 86, '2023-05-31', '2023-06-07', 'active'),
(146, 87, '2023-05-31', '2023-06-07', 'active'),
(147, 88, '2023-05-31', '2023-06-07', 'active'),
(149, 24, '2023-05-31', '2023-06-07', 'active');






INSERT INTO reviews(stud_prof_id, rating,review_date, review_text, status, book_id) VALUES
(1,5,'2022-04-28','review 1','approved',5),               #1
(2,4,'2022-04-28','review 2','approved',2),               #2
(2,1,'2023-04-09','review 3','not yet approved',5),      #3
(3,5,'2021-11-22','review 4','denied',15),                #4
(25,4,'2022-01-13','review 5','approved',9),              #5
(28,1,'2022-12-17','review 6','approved',9),               #6
(28,2,'2020-03-18','review 7','approved',3),              #7
(31,4,'2023-04-09','review 8','approved',7),               #8
(32,3,'2023-04-09','review 9','approved',4),               #9
(5,3,'2022-05-04','review 10','approved',32),              #10
(5,2,'2021-12-09','review 11','approved',33),              #11
(37,1,'2021-03-05','review 12','approved',33),              #12
(37,5,'2023-06-15','review 13','approved',31),              #13
(38,3,'2023-04-08','review 14','approved',19),              #14
(3,4,'2021-05-25','review 15','approved',15),             #15
(8,4,'2022-05-02','review 16','not yet approved',50),     #16
(9,3,'2023-04-10','review 17','approved',37),             #17
(41,5,'2023-01-15','review 18','denied',47),               #18
(41,1,'2022-06-20','review 19','approved',46),            #19
(44,2,'2020-03-07','review 20','approved',39),             #20
(47,3,'2022-02-08','review 21','approved',42),            #21
(48,4,'2023-05-09','review 22','denied',45),              #22
(11,2,'2022-05-02','review 23','approved',69),            #23
(12,3,'2022-04-29','review 24','denied',64),              #24
(53,5,'2023-05-31','review 25','approved',53),            #25
(51,3,'2021-02-01','review 26','approved',60),             #26
(49,2,'2023-01-14','review 27','approved',68),             #27
(56,3,'2023-04-09','review 28','approved',61),             #28
(15,4,'2023-04-09','review 29','approved',74),             #29
(14,2,'2021-12-09','review 30','approved',80),             #30
(15,4,'2022-04-29','review 31','denied',83),              #31
(58,1,'2022-02-03','review 32','not yet approved',80),    #32
(58,5,'2023-04-09','review 33','approved',75),            #33
(60,2,'2020-03-09','review 34','denied',80),              #34
(61,3,'2023-05-30','review 35','approved',79),            #35
(62,2,'2023-05-29','review 36','denied',72),              #36
(18,5,'2023-04-29','review 37','not yet approved',99),    #37
(18,4,'2023-04-09','review 38','denied',101),              #38
(68, 3, '2020-03-07', 'review 39', 'approved', 105),       #39
(18, 1, '2020-12-14', 'review 40', 'approved', 93),       #40
(18, 2, '2023-04-09', 'review 41', 'approved', 92),        #41
(21, 3, '2022-04-25', 'review 42', 'approved', 119),        #42
(80, 4, '2023-04-09', 'review 43', 'approved', 118),        #43
(79, 1, '2023-04-09', 'review 44', 'approved', 119),        #44
(23, 5, '2021-12-01', 'review 45', 'approved', 135),        #45
(24,4,'2020-07-15','review 46','not yet approved',148),    #46
(84, 5, '2020-03-09', 'review 47', 'approved', 145),       #47
(86, 2, '2023-05-30', 'review 48', 'denied', 137),         #48
(82, 1, '2020-03-07', 'review 49', 'approved', 135);       #49


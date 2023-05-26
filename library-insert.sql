USE library;

-- DELETE data
DELETE FROM administrator;
DELETE FROM user;
DELETE FROM school_unit;
DELETE FROM book;
DELETE FROM book_thematic_categories;
DELETE FROM book_authors ;
ALTER TABLE `user` auto_increment = 1 ;
ALTER TABLE `administrator` auto_increment = 1;
ALTER TABLE `school_unit` auto_increment =1; 
ALTER TABLE `book` auto_increment = 1;
ALTER TABLE `book_thematic_categories` auto_increment =1;
ALTER TABLE `book_authors` auto_increment = 1;


--
-- Insert 60 users
--

INSERT INTO user(username, full_name, PASSWORD, date_of_birth,phone_number,email) VALUES
   
   
   ('johnli7','Giannis Litsos','12345','2001-06-27','690-555-4012','pystunka@creahobby.it'),                                 #1           
   ('pipis', 'Thanasis Remoundos','12345678','2001-11-29','690-555-6827','bailey.benton@hackett.com'),                       #2
   ('chrikran', 'Xristos Kranias', '1T5@9OqS$Q#D', '2001-10-11','694-555-1206','ara75@gmail.com'),                   		 #3
   ('eMengaLI', 'Vasilis Spanoulis', '7HWKe*9y0fY9', '1981-04-12','693-555-6281','mhansen@gmail.com'),                       #4
   ('sWescoLK', 'Giorgos Printzis', 'Mw%94Lj6UWEq', '1959-06-26','695-555-4249','jerel09@cruickshank.com'),                  #5
   ('chessknight', 'Tasos Bougas', '0E*RcJ31aKfd', '1950-08-30','699-555-3794','ephraim.kunze@gutmann.com'),                 #6
   ('1a2a3a', 'Gianoulis Laretzakis', '1%&ZI2CREf1u', '1951-08-04','690-555-0774','schmitt.otha@lebsack.biz'),               #7
   ('tipaki1908', 'Antonis Remos', '6crQ7xJQ!g1N', '1950-11-19','690-555-0208','whitney.crooks@bartoletti.net'),             #8
   ('GoToHell', 'Sasha Vezenkov', 'tP4d34yz##x0', '1970-08-30','690-555-2450','walsh.helmer@hotmail.com'),                   #9
   ('Repainer', 'Thodoris Kolokotronis', 'gJ0w18@93J*k', '1948-11-19','694-555-7247','pink82@marquardt.com'),                #10
   ('Mantroskylo', 'Giorgos Karaiskakis', 'ucDmT68@1C2j', '1990-11-19','693-555-4518','rippin.mireya@hotmail.com'),          #11
   ('BlackLand', 'Nikos Matsoblokos', 'IRbs4*qV7j0$', '1989-10-10','690-555-8707','xhammes@stracke.info'),                   #12
   ('sofiaada', 'Xristos Fysalidas', '88KR8s@8vK$K', '1968-11-19','693-555-9624','zena.haley@gmail.com'),                    #13
   ('filologos', 'Bob Marley', '!3d$YEU3T725', '1987-11-19','695-555-8152','tberge@bartell.com'),                            #14
   ('epitafios', 'Xristoforos Kolomvos', 'CF7Th^Gz06dR', '1960-01-01','693-278-6670','rafael.carter@stracke.org'),           #15
   ('killer4', 'Petros Maggelanos', '79&yLL#WQ9nQ', '1974-10-10','696-251-8964','jesse.hickle@nader.org'),                   #16
   ('alekao46', 'Giannis Ioustinianos', 'fIQ^1366$b6q', '1970-11-19','698-475-5888','remington.bauch@lang.com'),             #17
   ('imicraision.', 'Lena Zevgara', '88KWM7dk@X7^', '1968-11-19','691-208-5311','sframi@wintheiser.com'),                    #18
   ('Noobakos eimai', 'Despoina Vandi', '^2w66f@!JWee', '1993-09-07','690-951-6873','lockman.fatima@hotmail.com'),           #19
   ('ARRION', 'Jennifer Lawrence', 'woU^6ne^@r43', '1989-09-14','697-644-1682','trenton.braun@trantow.net'),                 #20
   ('bekos', 'Stavroula Paparouna', '35iw#f!pVtJ2', '2008-09-07','696-497-6356','einar.von@cartwright.org'),                 #21
   ('TOP10', 'Evi Koutsomitrou', '3#2DXmh!tir9', '2010-05-30','698-481-3224','tyler44@durgan.biz'),                          #22
   ('topg', 'Maria Labrogianni', 'jY9#g33z4TWd', '2009-01-30','693-441-2040','ryley.zulauf@doyle.com'),                      #23
   ('st-thea', 'Evi Stamatolamprou', '1sL8#369', '2015-12-06','699-651-2714','heller.erna@hotmail.com'),                     #24
   ('Τhe Κing','Natasha Papadopoulou','74mn%3B2','2012-04-21','690-113-4165','uriah22@yahoo.com'),                  		 #25
   ('jtboss', 'Vasiliki Eustathiou', 'sW4!3ru4', '2012-12-02','692-716-9366','lamar.quigley@yahoo.com'),                     #26
   ('pretty woman', 'Alexandra Apergi', '$KHgh666', '2012-02-25','692-429-5064','orin.gorczany@gmail.com'),                  #27
   ('BAKER1', 'Katia Dandoulaki', '52895427', '2011-05-29','699-909-3288','kasandra.murray@grimes.net'),                     #28
   ('Eisvoleas85', 'Lebron James', '73522954', '2013-05-27','697-886-8899','stiedemann.ariane@spinka.biz'),                  #29
   ('petros888', 'Nikos Fousekis', '36569!5!', '2006-02-22','698-017-6620','ohodkiewicz@hotmail.com'),                       #30
   ('poisonman', 'Mixalis Kenteris', '^&5%4276', '2008-05-02','696-317-5781','darren.quigley@gmail.com'),                    #31
   ('minaras11', 'Nikos Evaggelatos', '@$659!76', '2012-04-21','694-946-4877','xbernhard@jaskolski.com'),                    #32
   ('ALEKOS PAOKI', 'Andreas Papandreou', '49&89$6#', '2007-03-23','692-626-6401','krista.strosin@connelly.com'),            #33
   ('pantelis 22', 'Pantelis Pantelidis', '$7!3*829', '2009-06-30','694-240-3697','ibrahim.bradtke@hotmail.com'),            #34
   ('Mix74', 'Mixalis Loutzis', '2*7@9&&%', '2006-04-27','696-181-2993','praynor@gmail.com'),                          		 #35
   ('mikeous', 'Eleni Poulimenou', '55!5#5^!', '2007-01-19','697-023-7048','ruecker.selmer@gmail.com'),                      #36
   ('Giota47', 'Giota Kalavrou', '7&926^63', '2006-05-23','699-070-3729','cmorar@yahoo.com'),                                #37
   ('wolf-woman', 'Anastasia Papadopoulou', '%$26934*', '2008-05-02','691-991-7682','oreilly.chloe@hotmail.com'),            #38
   ('NIKOS5777', 'Nikos Oikonomopoulos', '7#&^@2@2', '2009-01-30','691-427-6146','anastasia.wolff@hotmail.com'),             #39
   ('kwstas007', 'Konstantinos Karamanlis', '3&96^3@#', '2005-01-21','692-223-6648','ydenesik@hotmail.com'),              	 #40
   ('orani', 'Ourania Kalapothaki', 'z69h4d68g', '2009-06-30','694-712-6333','wyman58@schamberger.info'),                    #41
   ('lastef', 'Stefania Krania', 'w6h7jx93a', '2010-02-01','695-664-2236','nitzsche.westley@gmail.com'),                     #42
   ('iliaskosto', 'Ilias Kostopoulos', '5e47g24dr', '2012-02-25','691-004-7171','ccole@runte.info'),                         #43
   ('kaffetzakis', 'Argyris Kafetzakis', '992athtfa', '2011-05-29','698-435-4263','larkin.amina@ernser.info'),               #44
   ('SOTIRIS14121968', 'Sotiris Tsafoulias', '9a7az6vdt', '2010-02-01','693-485-6274','sean05@gmail.com'),                   #45
   ('stan21', 'Stratos Antipariotis', 'n79446t6y', '2013-11-29','697-597-0683','klocko.elissa@yahoo.com'),                   #46
   ('gwgw', 'Gogo Tsampa', '9j99h5dpr', '2009-12-01','691-287-7544','alene.blick@carter.org'),                               #47
   ('tommy369', 'Thomas Walkupopoulos', 'j8ds885e2', '2008-05-02','695-073-9099','lubowitz.sydnie@ledner.biz'),              #48
   ('mantiso', 'Evgenios Trivizas', 'sm7x682g6', '2006-02-22','699-712-4222','pouros.earline@jacobson.com'),                 #49
   ('Zagorakis 1', 'Thodoris Zagorakis', '3s3dxx87p', '2012-12-02','691-493-1819','halvorson.kenyatta@olson.com'),           #50
   ('Leon300', 'Leonidas Sakelaropoulos', 'ev3349an4', '2013-05-27','693-243-7682','isai03@yahoo.com'),                      #51
   ('mp365', 'Mpampis Remos', 'zg86p2y7s', '2011-01-12','692-095-4176','bradtke.lacey@bartell.biz'),                         #52
   ('elpl2', 'Elina Plita', 'y5fz854rz', '2009-06-30','690-196-7263','cristina.hilpert@gmail.com'),                          #53
   ('mariakkks', 'Maria Merkouri', 'p6z289xqg', '2012-12-06','695-685-6614','alexa.johns@hotmail.com'),                      #54
   ('jojo', 'Josephine Karava', 'n5jxr484j', '2012-02-25','691-075-5971','lindgren.ayla@bogisich.com'),                      #55
   ('tzouli36', 'Tzoulia Douvli', 'kv7b62caa', '2011-05-29','691-339-0242','jenkins.ruthie@yahoo.com'),                      #56
   ('doukdouk', 'Doukisa Nomikou', 'k248aj2yn', '2013-05-27','698-869-9135','nhahn@hotmail.com'),                            #57
   ('katerina69', 'Katerina Stikoudi', 'c7s869y47', '2010-02-01','697-213-1570','buckridge.royce@bode.com'),                 #58
   ('mary1', 'Maria Anamaterou', 'h83f6ggkm', '2012-02-25','696-678-7179','edmond.blick@yahoo.com'),                         #59
   ('KOSTAS3', 'Konstantinos Papanikolaou', 'c38z397zb', '2011-05-29','694-877-9497','dibbert.mellie@hotmail.com');          #60

    --
    -- Insert 10 school_units
    --
    INSERT INTO school_unit(school_name, address, city , school_director_full_name , library_operator_full_name, email , phone_number,administrator_id ) VALUES
    ('Peparithio','Doulidou 3','Skopelos','Philipos Lemonis','Karagkounis Panagiotis','apro56@otenet.gr' ,'2424022172',1 ),       	#1
    ('Dimokrito' , 'Ermou 2', 'Drama' , 'Samaras Giorgos','Katsouranis Dimos','aktel@gmail.com', '2421023567' ,1),	        		#2
    ('Krifo Sxolio' , 'Georgiou 25', 'Kastoria' ,'Efthimiou Nikos','Pasxalis Terzis' ,'atp@yahoo.gr','2467086595' ,1),     			#3
    ('Mantoulidi','Chrisipou 20','Zografou', 'Askounis Vaggelis','Tsipi Zoe','awq@hotmail.gr','2356056793',1),	            		#4
    ('Saint-Joseph','Egnatia 34', 'Thessaloniki','Kostas Sloukas','George Pappas','larentzakis@kobra.gr','2421045678',1),			#5
    ('MIT' , 'Omonoias 45' ,'Kamatero','Giorgos Papagiannis','Lefteris Bochoridis','bochou@gmail.com','2356089725',1 ),				#6
    ('UCLA','Filis 21','Tinos','Pipis Remoundos','Velalopoulos Michael','pip@otenet.gr','2423028953',1),							#7
    ('Princeton','Papagou 7','Ioannina','Charitos Giorgos','Ntatsis Alexandros','ntats@gmail.com','2521057430',1);					#8	
    
--
-- Insert 100 Book Data
--

INSERT INTO book(title,publisher,ISBN,number_of_pages,image,language,available_copies,summary,key_words,school_id) VALUES								
	('The Enigmatic Conquest', 'Jessica Gray', '978-0-06-907517-1', '249','https://dummyimage.com/977x500','Basque','3','Summary 1','[language, whose, leader]','8'),               #1
	('Echoes of Destiny', 'Emily Bush', '978-0-347-91921-0', '250','https://picsum.photos/386/141','Chechen','2','Summary 2','[traditional, mother, choose]','6'),					#2
	('The Whispers of Serendipity', 'Nicholas Wright', '978-1-210-19235-8', '409','https://placekitten.com/11/948','Esperanto','4','Summary 3','[usually, team, line]','3'),        #3	
	('Shadows of Redemption', 'Harry Ramos', '978-0-6488537-8-7', '561','https://placekitten.com/766/866','Tswana','1','Summary 4','[develop, civil, pretty]','7'),					#4
	('The Forgotten Prophecy', 'Savannah Wallace', '978-0-444-60556-6', '499','https://picsum.photos/401/6','Church Slavic','5','Summary 5','[goal, force, about]','8'),			#5
	('Fragments of Eternity', 'Jerry Ortiz', '978-0-9964128-0-3', '346','https://picsum.photos/164/432','Bihari languages','5','Summary 6','[future, question, much]','4'),			#6	
	('The Labyrinth of Secrets', 'Vincent James', '978-0-483-55770-3', '352','https://picsum.photos/676/175','Walloon','2','Summary 7','[cold, local, PM]','4'),					#7
	('Journey to the Unknown', 'Andrea Glover', '978-0-13-591299-7', '404','https://placekitten.com/679/251','Shona','2','Summary 8','[year, not, play]','5'),
	('Beneath the Starlit Sky', 'Scott Morris', '978-0-86907-875-4', '415','https://dummyimage.com/330x1011','Dzongkha','3','Summary 9','[want, suggest, with]','7'),
	('The Silent Legacy', 'Carol Howard', '978-0-14-142329-6', '392','https://dummyimage.com/964x620','Lithuanian','0','Summary 10','[contain, focus, board]','4'),
	('Chronicles of the Lost Realm', 'Amanda Wang', '978-0-16-823702-9', '371','https://dummyimage.com/984x1008','Uzbek','4','Summary 11','[situation, analysis, stop]','2'),
	('A Song in the Wind', 'Michelle Bell', '978-0-942043-42-6', '485','https://dummyimage.com/977x762','Dzongkha','0','Summary 12','[memory, compare, value]','2'),
	('The Captives Dilemma', 'Courtney Roberts', '978-0-267-25793-5', '348','https://placekitten.com/879/844','North Ndebele','5','Summary 13','[travel, energy, our]','2'),
	('Mysteries of the Unseen', 'Dawn Scott', '978-0-565-71777-3', '498','https://dummyimage.com/131x512','Kirghiz','1','Summary 14','[arrive, fund, among]','6'),
	('The Last Voyage', 'John Rivers', '978-1-75588-762-7', '243','https://placekitten.com/510/965','French','4','Summary 15','[evidence, general, policy]','1'),
	('The Crimson Crown', 'Kimberly Martin', '978-0-9596228-3-6', '395','https://placekitten.com/196/822','Sotho, Southern','4','Summary 16','[the, wait, fire]','7'),
	('Whispers in the Dark', 'Gwendolyn King', '978-0-927030-95-3', '302','https://placekitten.com/547/442','Kurdish','0','Summary 17','[wide, surface, evidence]','1'),
	('Sands of Time', 'Omar Bowman', '978-1-329-09305-8', '515','https://dummyimage.com/771x23','Tsonga','3','Summary 18','[close, into, food]','3'),
	('The Cursed Talisman', 'Renee Miller', '978-1-370-65788-9', '536','https://dummyimage.com/493x33','Czech','1','Summary 19','[everything, series, consider]','5'),
	('Echoes from the Abyss', 'Angela Gonzales', '978-0-413-83026-5', '203','https://placekitten.com/467/769','Kongo','3','Summary 20','[that, term, box]','4'),
	('The Enchanted Forest', 'Deanna Hood', '978-1-60375-783-6', '282','https://picsum.photos/271/932','Bihari languages','2','Summary 21','[change, condition, into]','3'),
	('The Crystal Key', 'Mary Baker', '978-1-284-24911-8', '221','https://picsum.photos/246/486','Korean','1','Summary 22','[task, worry, continue]','7'),
	('The Midnight Chronicles', 'Tracy Stark', '978-0-8303-2913-7', '506','https://placekitten.com/1004/690','Corsican','4','Summary 23','[future, commercial, trouble]','1'),
	('Secrets of the Forbidden City', 'Pamela Herrera', '978-0-275-57482-6', '231','https://picsum.photos/898/414','South Ndebele','4','Summary 24','[to, fish, their]','3'),
	('Legends of the Moonstone', 'Lisa French', '978-1-56313-725-9', '153','https://picsum.photos/777/963','Kurdish','5','Summary 25','[number, site, detail]','8'),
	('The Stolen Heirloom', 'Andrew Chavez', '978-1-912138-63-0', '324','https://picsum.photos/615/91','Romansh','0','Summary 26','[method, heart, experience]','2'),
	('Echoes of the Forgotten', 'Jessica Moore', '978-1-06-085903-6', '594','https://placekitten.com/753/860','Kongo','4','Summary 27','[magazine, evidence, generation]','7'),
	('The Lost Kingdom', 'Jason Murphy', '978-1-69421-685-4', '323','https://placekitten.com/451/513','Afar','3','Summary 28','[according, computer, time]','1'),
	('Whispers of Betrayal', 'Hailey Cook', '978-0-930961-73-2', '187','https://placekitten.com/574/40','Ido','0','Summary 29','[score, recognize, must]','7'),
	('The Ruby Amulet', 'Daniel Powers', '978-1-193-67551-0', '365','https://picsum.photos/936/461','Sango','4','Summary 30','[move, check, news]','1'),
	('The Vanishing', 'Heather Patterson', '978-0-532-32904-6', '125','https://picsum.photos/849/621','Kikuyu','4','Summary 31','[dark, probably, break]','6'),
	('The Hidden Path', 'Jason Mueller', '978-0-943794-64-8', '123','https://dummyimage.com/43x157','Swahili','4','Summary 32','[care, old, require]','7'),
	('Sins of the Past', 'Travis Wilson', '978-0-15-903002-8', '122','https://placekitten.com/145/273','Nauru','0','Summary 33','[number, important, stand]','4'),
	('The Shattered Mirror', 'Kimberly Sparks', '978-1-02-533213-0', '251','https://dummyimage.com/914x810','Armenian','5','Summary 34','[public, world, can]','2'),
	('The Dark Prophecy', 'Michael Anderson', '978-1-64207-421-5', '318','https://dummyimage.com/809x255','Kirghiz','3','Summary 35','[end, open, capital]','8'),
	('The Secret Society', 'Carla Price', '978-0-589-05008-5', '329','https://picsum.photos/196/487','Persian','1','Summary 36','[majority, brother, bring]','7'),
	('The Isle of Whispers', 'Selena Williams', '978-1-4058-8810-3', '450','https://dummyimage.com/634x434','Northern Sami','5','Summary 37','[clearly, film, figure]','8'),
	('The Forsaken Tower', 'Matthew Wong', '978-0-15-373721-3', '314','https://picsum.photos/453/622','Maori','2','Summary 38','[surface, same, type]','4'),
	('Echoes of the Past', 'Melinda Torres', '978-0-642-10758-9', '457','https://dummyimage.com/667x204','Ukrainian','2','Summary 39','[seek, second, where]','8'),
	('The Cursed Relic', 'Lynn Hicks', '978-0-87157-993-5', '366','https://dummyimage.com/636x134','Pali','1','Summary 40','[technology, movie, guy]','2'),
	('Whispers in the Mist', 'Mark Ray', '978-1-993507-70-7', '146','https://placekitten.com/468/571','Arabic','2','Summary 41','[magazine, class, hospital]','4'),
	('The Shadows Embrace', 'Olivia Hughes', '978-1-5106-7905-4', '226','https://dummyimage.com/90x0','Norwegian','4','Summary 42','[business, develop, car]','6'),
	('The Emerald Crown', 'Alexander Wright', '978-0-9622937-9-5', '467','https://placekitten.com/861/565','Ndonga','4','Summary 43','[gun, born, could]','1'),
	('The Enigma of Time', 'Crystal Dickerson', '978-0-269-70812-1', '483','https://dummyimage.com/795x600','Kuanyama','2','Summary 44','[human, art, as]','3'),
	('The Silent Sentinel', 'Kaitlyn Salinas', '978-0-87884-792-1', '401','https://placekitten.com/639/617','Guarani','3','Summary 45','[save, vote, deep]','7'),
	('Secrets of the Crystal Cave', 'John Jones', '978-0-09-329820-1', '586','https://dummyimage.com/51x131','Ndonga','4','Summary 46','[cut, explain, little]','7'),
	('The Chosen One', 'Nicole Wolf', '978-0-442-23609-0', '379','https://placekitten.com/899/739','Italian','5','Summary 47','[save, view, could]','8'),
	('The Forgotten City', 'Marcus Carrillo', '978-0-633-65851-9', '424','https://picsum.photos/735/594','Malay','1','Summary 48','[west, three, entire]','2'),
	('The Veil of Secrets', 'Hayley Hernandez', '978-0-9895823-4-6', '207','https://placekitten.com/268/688','Maori','3','Summary 49','[cause, compare, as]','8'),
	('The Hidden Scroll', 'Rebecca Smith', '978-1-4061-4742-1', '229','https://picsum.photos/863/985','North Ndebele','1','Summary 50','[change, raise, hard]','5'),
	('The Lost Chronicles', 'Bonnie Aguilar', '978-1-107-05031-0', '501','https://picsum.photos/112/272','Inupiaq','2','Summary 51','[point, personal, enter]','7'),
	('Echoes from Beyond', 'Michael Acevedo', '978-1-294-97686-8', '111','https://placekitten.com/857/272','Western Frisian','5','Summary 52','[job, protect, something]','7'),
	('The Phantoms Curse', 'Franklin Henry', '978-1-948906-39-5', '206','https://picsum.photos/903/95','Nauru','1','Summary 53','[discuss, industry, commercial]','8'),
	('The Enchanted Manuscript', 'Belinda Spencer', '978-0-8041-4171-0', '322','https://dummyimage.com/686x115','Norwegian Nynorsk','5','Summary 54','[system, name, trade]','5'),
	('Whispers of the Heart', 'David Brooks', '978-1-933024-97-4', '339','https://placekitten.com/406/85','Gujarati','0','Summary 55','[boy, choose, within]','2'),
	('The Timekeepers Legacy', 'John Taylor', '978-0-17-926641-4', '493','https://dummyimage.com/461x512','Ojibwa','5','Summary 56','[reason, stuff, since]','4'),
	('The Forgotten Land', 'Brianna Williams', '978-1-4954-1113-7', '565','https://picsum.photos/212/217','Russian','3','Summary 57','[heavy, catch, after]','8'),
	('The Crystal Labyrinth', 'Jeremy Evans', '978-1-4542-9742-0', '523','https://dummyimage.com/725x20','Fijian','5','Summary 58','[point, action, course]','3'),
	('The Crimson Rose', 'James Anderson', '978-1-4717-8771-3', '543','https://picsum.photos/270/537','Sardinian','3','Summary 59','[need, think, event]','7'),
	('The Ghost of Avalon', 'Anna Anderson', '978-0-680-46309-8', '146','https://placekitten.com/157/76','Gujarati','0','Summary 60','[crime, blue, more]','4'),
	('The Guardians Quest', 'Jeremy Hurley', '978-1-214-72869-0', '426','https://dummyimage.com/383x623','Slovak','1','Summary 61','[rest, small, draw]','2'),
	('The Lost Prophecies', 'Sarah Guerrero', '978-1-77507-417-5', '535','https://placekitten.com/408/956','Norwegian','2','Summary 62','[lot, day, either]','3'),
	('Echoes of the Enchanter', 'Colleen Garcia', '978-0-9802512-2-7', '281','https://picsum.photos/328/278','Hausa','2','Summary 63','[wait, star, sign]','7'),
	('The Whispering Woods', 'Michelle Fry', '978-1-367-37527-7', '492','https://picsum.photos/879/906','Serbian','5','Summary 64','[action, develop, mind]','4'),
	('The Oracles Secret', 'Paul Harris', '978-0-9702698-4-3', '394','https://picsum.photos/373/330','Malay','4','Summary 65','[should, go, game]','6'),
	('The Haunting of Blackstone Manor', 'Anthony Smith', '978-0-01-567910-1', '181','https://placekitten.com/905/244','Tonga','2','Summary 66','[choice, happy, south]','4'),
	('The Mystics Tale', 'Keith Clarke', '978-1-69195-844-3', '376','https://dummyimage.com/11x667','Gaelic','5','Summary 67','[market, role, source]','6'),
	('The Enchanted Kingdom', 'Mary Mcdowell', '978-0-440-16839-3', '368','https://placekitten.com/255/27','Navajo','1','Summary 68','[alone, make, future]','1'),
	('The Cursed Forest', 'Karen Berry', '978-0-405-76269-7', '216','https://dummyimage.com/49x509','Thai','5','Summary 69','[action, eye, agent]','2'),
	('The Forgotten Tome', 'Kenneth Morgan', '978-1-85344-164-6', '153','https://picsum.photos/244/692','Fulah','1','Summary 70','[form, allow, lot]','5'),
	('The Silent Scribe', 'Krystal Hunt', '978-1-903896-87-7', '304','https://picsum.photos/180/225','Japanese','0','Summary 71','[maintain, which, board]','2'),
	('Whispers in the Shadows', 'Joshua Martinez', '978-1-136-08604-5', '350','https://dummyimage.com/681x546','Belarusian','1','Summary 72','[resource, nothing, foreign]','2'),
	('The Serpents Kiss', 'Colton Green', '978-1-83458-019-7', '377','https://placekitten.com/637/586','Albanian','0','Summary 73','[create, kitchen, police]','5'),
	('The Elixir of Life', 'Linda Middleton', '978-1-100-50591-6', '547','https://placekitten.com/999/825','Greek','2','Summary 74','[available, floor, including]','8'),
	('The Lost Relic', 'Gary Weber', '978-0-00-324603-2', '356','https://placekitten.com/938/446','Serbian','5','Summary 75','[Mrs, change, small]','5'),
	('The Secret Alchemy', 'Deborah Hopkins', '978-0-354-82915-1', '584','https://dummyimage.com/797x644','Gaelic','5','Summary 76','[class, occur, enough]','7'),
	('The Crimson Eye', 'Alex Elliott', '978-0-7696-1483-0', '193','https://dummyimage.com/390x616','Estonian','2','Summary 77','[individual, meet, enter]','6'),
	('The Enigmas Riddle', 'Arthur Ryan', '978-1-62440-238-8', '295','https://picsum.photos/476/620','Walloon','1','Summary 78','[law, both, simply]','3'),
	('The Vanished Heiress', 'Jody Scott', '978-0-655-13545-6', '561','https://picsum.photos/16/701','Belarusian','4','Summary 79','[discuss, spring, member]','8'),
	('The Forgotten Spell', 'Kim Alexander', '978-0-547-96884-1', '181','https://placekitten.com/841/157','Fijian','4','Summary 80','[fish, fund, majority]','3'),
	('Echoes of Desolation', 'Angela Mccann', '978-0-9891930-0-9', '560','https://placekitten.com/612/655','Xhosa','1','Summary 81','[send, degree, another]','3'),
	('The Ivory Tower', 'James Ramsey', '978-1-5309-8156-4', '523','https://picsum.photos/78/371','Malagasy','1','Summary 82','[simple, until, station]','8'),
	('The Hidden Chamber', 'Francisco Hendrix', '978-0-393-79576-9', '159','https://dummyimage.com/515x560','Fijian','5','Summary 83','[truth, thus, phone]','5'),
	('The Forbidden Tome', 'Anna Lee', '978-0-911388-30-5', '291','https://placekitten.com/622/706','Maltese','0','Summary 84','[item, party, girl]','7'),
	('The Lost Symphony', 'Mark Cooley', '978-1-4648-0993-4', '583','https://dummyimage.com/455x190','Catalan','1','Summary 85','[hit, hospital, which]','3'),
	('Whispers of Wisdom', 'Jordan Perez', '978-1-927831-41-0', '424','https://placekitten.com/947/583','Samoan','0','Summary 86','[ten, in, phone]','1'),
	('The Haunted Manor', 'Johnny Walsh', '978-0-17-841274-4', '457','https://placekitten.com/806/733','Portuguese','5','Summary 87','[data, room, pretty]','8'),
	('The Chalice of Secrets', 'Matthew Thomas', '978-1-72460-134-6', '140','https://picsum.photos/609/935','Esperanto','5','Summary 88','[responsibility, less, alone]','3'),
	('The Mirrors Edge', 'Matthew Stephens', '978-0-216-21360-9', '211','https://picsum.photos/114/918','Inupiaq','4','Summary 89','[federal, pattern, anything]','7'),
	('The Silent Cavern', 'Judy Clark', '978-0-04-072377-0', '185','https://placekitten.com/392/103','Tatar','5','Summary 90','[strong, better, any]','1'),
	('The Shrouded Enigma', 'Adrienne Hernandez', '978-1-4733-0435-2', '289','https://dummyimage.com/127x95','Sanskrit','4','Summary 91','[cold, religious, somebody]','2'),
	('The Enchanted Isle', 'Sharon Nelson', '978-1-128-23077-7', '212','https://picsum.photos/126/113','Ossetian','0','Summary 92','[property, five, conference]','8'),
	('The Phantoms Embrace', 'Katherine Caldwell', '978-0-325-89250-4', '385','https://placekitten.com/48/1000','Central Khmer','5','Summary 93','[wind, modern, analysis]','7'),
	('The Forgotten Empire', 'Jennifer Campbell', '978-1-69655-493-0', '405','https://dummyimage.com/643x534','Urdu','3','Summary 94','[above, spend, left]','7'),
	('The Cursed Curse', 'Denise Moore', '978-1-5040-4043-3', '358','https://picsum.photos/709/147','Oromo','2','Summary 95','[painting, forward, member]','7'),
	('Whispers in the Moonlight', 'Ricky Watson', '978-0-581-28105-0', '154','https://picsum.photos/640/397','Lingala','1','Summary 96','[peace, people, discussion]','4'),
	('The Shadowed Legacy', 'Corey Kim', '978-1-05-379185-5', '121','https://placekitten.com/47/501','Uzbek','1','Summary 97','[likely, look, finally]','5'),
	('The Mystics Prophecy', 'Justin Smith', '978-1-232-27397-4', '306','https://placekitten.com/830/296','Slovenian','1','Summary 98','[just, no, program]','5'),
	('The Vanishing Spell', 'Jason Espinoza', '978-1-00-787817-5', '211','https://placekitten.com/605/535','Bosnian','4','Summary 99','[consider, role, news]','3'),
	('The Forbidden Scroll', 'Deborah Sanchez', '978-0-7628-7347-0', '460','https://picsum.photos/296/298','Italian','4','Summary 100','[last, all, western]','8');



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
('Comedy', 100);


--
-- Insert an administrator
--
INSERT INTO administrator(username, password) VALUES 
('LORD', 'SKOPELOS2001');  #1


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
('Amy Juarez', 100);








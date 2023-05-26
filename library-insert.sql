USE library;

-- DELETE data
DELETE FROM administrator;
DELETE FROM user;
Delete FROM school_unit;
Delete FROM book_thematic_categories;
ALTER TABLE `user` auto_increment = 1 ;
ALTER TABLE `administrator` auto_increment = 1;
ALTER TABLE `school_unit` auto_increment =1; 


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
   ('Τhe Κing', 'Natasha Papadopoulou', '74mn%3B2', '2012-04-21','690-113-4165','uriah22@yahoo.com'),                  		 #25
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
    -- Insert an administrator
    --
    
    INSERT INTO administrator(username, password) VALUES 
    ('LORD', 'SKOPELOS2001');  #1
    
    --
    -- Insert 10 school_units
    --
    INSERT INTO school_unit(school_name, address, city , school_director_full_name , library_operator_full_name, email , phone_number,administrator_id ) VALUES
    ('GEL Skopelou','Doulidou 3','Skopelos','Philipos Lemonis','Karagkounis Panagiotis','apro56@otenet.gr' ,'2424022172',1 ),       	#1
    ('1o Dimotiko Dramas' , 'Ermou 2', 'Drama' , 'Samaras Giorgos','Katsouranis Dimos','aktel@gmail.com', '2421023567' ,1),	        	#2
    ('3o Gimnasio Kastorias' , 'Georgiou 25', 'Kastoria' ,'Efthimiou Nikos','Pasxalis Terzis' ,'atp@yahoo.gr','2467086595' ,1),     	#3
    ('8o Dimotiko Zografou','Chrisipou 20','Zografou', 'Askounis Vaggelis','Tsipi Zoe','awq@hotmail.gr','2356056793',1),	            #4
    ('2o Dimotiko Kalamarias','Egnatia 34', 'Thessaloniki','Kostas Sloukas','George Pappas','larentzakis@kobra.gr','2421045678',1);     #5
    
    
    
    
--
-- Insert 3 Book Data
--

-- INSERT INTO book(title,publisher,ISBN,number_of_pages,summary,available_copies,image,language,school_id) VALUES								
-- ('O xamenos Thisavros','Patakis',978-618-02-5040-4,120,'Perilipsi',10,'Eikona','Ellinika',1),
-- ('Harry Potter 1', 'Kedros', 441-610-02-0510-5,200,'Perilipsi',15,'Eikona','Ellinika',1),
-- ('Harry Potter 1', 'Kedros', 441-610-02-0510-5,200,'Perilipsi',5,'Eikona','Ellinika',2)

--
-- Insert 20 Book's Thematic Categories
--

INSERT INTO book_thematic_categories(thematic_category,book_id) VALUES								
	('Comedy',1),																	
    ('Comedy',2),
    ('Horror',1),
    ('Mystery',3),
    ('Thriller',4),
    ('Thriller',5),
    ('Drama',6),
    ('Romance',6),
    ('Horror',7),
    ('Romance',8),
    ('Science Fiction',9),
    ('Science Fiction',10),
    ('Fantasy',11),
    ('Science Fiction',12),
    ('Fantasy',13),
    ('Historical',14),
    ('Comedy',15),
    ('Mystery',16),
    ('Drama',17),
    ('Romance',18)
    








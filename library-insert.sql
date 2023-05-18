USE library;

-- DELETE data
DELETE FROM user;
DELETE FROM user_phone_number;
DELETE FROM user_email;
Delete FROM Book;
Delete FROM Books Thematic Categories;
Delete FROM Books Key words;
ALTER TABLE `user` auto_increment =1 ;


--
-- Insert 60 users
--

INSERT INTO user(username, full_name, PASSWORD, date_of_birth) VALUES
   ('johnli7','Giannis Litsos','12345','2001-06-27'),                               #1           
   ('pipis', 'Thanasis Remoundos','12345678','2001-11-29'),                         #2
   ('chrikran', 'Xristos Kranias', '1T5@9OqS$Q#D', '2001-10-11'),                   #3
   ('eMengaLI', 'Vasilis Spanoulis', '7HWKe*9y0fY9', '1981-04-12'),                 #4
   ('sWescoLK', 'Giorgos Printzis', 'Mw%94Lj6UWEq', '1959-06-26'),                  #5
   ('chessknight', 'Tasos Bougas', '0E*RcJ31aKfd', '1950-08-30'),                   #6
   ('1a2a3a', 'Gianoulis Laretzakis', '1%&ZI2CREf1u', '1951-08-04'),                #7
   ('tipaki1908', 'Antonis Remos', '6crQ7xJQ!g1N', '1950-11-19'),                   #8
   ('GoToHell', 'Sasha Vezenkov', 'tP4d34yz##x0', '1970-08-30'),                    #9
   ('Repainer', 'Thodoris Kolokotronis', 'gJ0w18@93J*k', '1948-11-19'),             #10
   ('Mantroskylo', 'Giorgos Karaiskakis', 'ucDmT68@1C2j', '1990-11-19'),            #11
   ('BlackLand', 'Nikos Matsoblokos', 'IRbs4*qV7j0$', '1989-10-10'),                #12
   ('sofiaada', 'Xristos Fysalidas', '88KR8s@8vK$K', '1968-11-19'),                 #13
   ('filologos', 'Bob Marley', '!3d$YEU3T725', '1987-11-19'),                       #14
   ('epitafios', 'Xristoforos Kolomvos', 'CF7Th^Gz06dR', '1960-01-01'),             #15
   ('killer4', 'Petros Maggelanos', '79&yLL#WQ9nQ', '1974-10-10'),                  #16
   ('alekao46', 'Giannis Ioustinianos', 'fIQ^1366$b6q', '1970-11-19'),              #17
   ('imicraision.', 'Lena Zevgara', '88KWM7dk@X7^', '1968-11-19'),                  #18
   ('Noobakos eimai', 'Despoina Vandi', '^2w66f@!JWee', '1993-09-07'),              #19
   ('ARRION', 'Jennifer Lawrence', 'woU^6ne^@r43', '1989-09-14'),                   #20
   ('bekos', 'Stavroula Paparouna', '35iw#f!pVtJ2', '2008-09-07'),                  #21
   ('TOP10', 'Evi Koutsomitrou', '3#2DXmh!tir9', '2010-05-30'),                     #22
   ('topg', 'Maria Labrogianni', 'jY9#g33z4TWd', '2009-01-30'),                     #23
   ('st-thea', 'Evi Stamatolamprou', '1sL8#369', '2015-12-06'),                     #24
   ('Τhe Κing', 'Natasha Papadopoulou', '74mn%3B2', '2012-04-21'),                  #25
   ('jtboss', 'Vasiliki Eustathiou', 'sW4!3ru4', '2012-12-02'),                     #26
   ('pretty woman', 'Alexandra Apergi', '$KHgh666', '2012-02-25'),                  #27
   ('BAKER1', 'Katia Dandoulaki', '52895427', '2011-05-29'),                        #28
   ('Eisvoleas85', 'Lebron James', '73522954', '2013-05-27'),                       #29
   ('petros888', 'Nikos Fousekis', '36569!5!', '2006-02-22'),                       #30
   ('poisonman', 'Mixalis Kenteris', '^&5%4276', '2008-05-02'),                     #31
   ('minaras11', 'Nikos Evaggelatos', '@$659!76', '2012-04-21'),                    #32
   ('ALEKOS PAOKI', 'Andreas Papandreou', '49&89$6#', '2007-03-23'),                #33
   ('pantelis 22', 'Pantelis Pantelidis', '$7!3*829', '2009-06-30'),                 #34
   ('Mix74', 'Mixalis Loutzis', '2*7@9&&%', '2006-04-27'),                          #35
   ('mikeous', 'Eleni Poulimenou', '55!5#5^!', '2007-01-19'),                       #36
   ('Giota47', 'Giota Kalavrou', '7&926^63', '2006-05-23'),                         #37
   ('wolf-woman', 'Anastasia Papadopoulou', '%$26934*', '2008-05-02'),              #38
   ('NIKOS5777', 'Nikos Oikonomopoulos', '7#&^@2@2', '2009-01-30'),                 #39
   ('kwstas007', 'Konstantinos Karamanlis', '3&96^3@#', '2005-01-21'),              #40
   ('orani', 'Ourania Kalapothaki', 'z69h4d68g', '2009-06-30'),                     #41
   ('lastef', 'Stefania Krania', 'w6h7jx93a', '2010-02-01'),                        #42
   ('iliaskosto', 'Ilias Kostopoulos', '5e47g24dr', '2012-02-25'),                  #43
   ('kaffetzakis', 'Argyris Kafetzakis', '992athtfa', '2011-05-29'),                #44
   ('SOTIRIS14121968', 'Sotiris Tsafoulias', '9a7az6vdt', '2010-02-01'),            #45
   ('stan21', 'Stratos Antipariotis', 'n79446t6y', '2013-11-29'),                   #46
   ('gwgw', 'Gogo Tsampa', '9j99h5dpr', '2009-12-01'),                              #47
   ('tommy369', 'Thomas Walkupopoulos', 'j8ds885e2', '2008-05-02'),                 #48
   ('mantiso', 'Evgenios Trivizas', 'sm7x682g6', '2006-02-22'),                     #49
   ('Zagorakis 1', 'Thodoris Zagorakis', '3s3dxx87p', '2012-12-02'),                #50
   ('Leon300', 'Leonidas Sakelaropoulos', 'ev3349an4', '2013-05-27'),               #51
   ('mp365', 'Mpampis Remos', 'zg86p2y7s', '2011-01-12'),                           #52
   ('elpl2', 'Elina Plita', 'y5fz854rz', '2009-06-30'),                             #53
   ('mariakkks', 'Maria Merkouri', 'p6z289xqg', '2012-12-06'),                      #54
   ('jojo', 'Josephine Karava', 'n5jxr484j', '2012-02-25'),                         #55
   ('tzouli36', 'Tzoulia Douvli', 'kv7b62caa', '2011-05-29'),                       #56
   ('doukdouk', 'Doukisa Nomikou', 'k248aj2yn', '2013-05-27'),                      #57
   ('katerina69', 'Katerina Stikoudi', 'c7s869y47', '2010-02-01'),                  #58
   ('mary1', 'Maria Anamaterou', 'h83f6ggkm', '2012-02-25'),                        #59
   ('KOSTAS3', 'Konstantinos Papanikolaou', 'c38z397zb', '2011-05-29');             #60

--
-- Insert 68 user_phone_number data (some users may have more than one phone number)
--

INSERT INTO user_phone_number (phone_number, user_id) VALUES
   ('690-555-4012', 1),                                                             #1
   ('693-555-2663', 1),                                                             #2
   ('694-555-9223', 1),                                                             #3
   ('690-555-6827', 2),                                                             #4
   ('694-555-1206', 3),                                                             #5
   ('690-555-0371', 3),                                                             #6
   ('693-555-6281', 4),                                                             #7
   ('699-555-7408', 4),                                                             #8
   ('695-555-4249', 5),                                                             #9
   ('693-555-0080', 5),                                                             #10
   ('699-555-3794', 6),                                                             #11
   ('690-555-0774', 7),                                                             #12
   ('690-555-0208', 8),                                                             #13
   ('690-555-2450', 9),                                                             #14
   ('694-555-7247', 10),                                                            #15
   ('694-555-8433', 10),                                                            #16
   ('693-555-4518', 11),                                                            #17
   ('690-555-8707', 12),                                                            #18
   ('693-555-9624', 13),                                                            #19
   ('695-555-8152', 14),                                                            #20
   ('693-278-6670', 15),                                                            #21
   ('697-189-5757', 15),                                                            #22
   ('696-251-8964', 16),                                                            #23
   ('698-475-5888', 17),                                                            #24
   ('691-208-5311', 18),                                                            #25
   ('690-951-6873', 19),                                                            #26
   ('697-644-1682', 20),                                                            #27
   ('694-830-2273', 20),                                                            #28
   ('696-497-6356', 21),                                                            #29
   ('698-481-3224', 22),                                                            #30
   ('693-441-2040', 23),                                                            #31
   ('699-651-2714', 24),                                                            #32
   ('690-113-4165', 25),                                                            #33
   ('692-716-9366', 26),                                                            #34
   ('692-429-5064', 27),                                                            #35
   ('699-909-3288', 28),                                                            #36
   ('697-886-8899', 29),                                                            #37
   ('698-017-6620', 30),                                                            #38
   ('696-317-5781', 31),                                                            #39
   ('694-946-4877', 32),                                                            #40
   ('692-626-6401', 33),                                                            #41
   ('694-240-3697', 34),                                                            #42
   ('696-181-2993', 35),                                                            #43
   ('697-023-7048', 36),                                                            #44
   ('699-070-3729', 37),                                                            #45
   ('691-991-7682', 38),                                                            #46
   ('691-427-6146', 39),                                                            #47
   ('692-223-6648', 40),                                                            #48
   ('694-712-6333', 41),                                                            #49
   ('695-664-2236', 42),                                                            #50
   ('691-004-7171', 43),                                                            #51
   ('698-435-4263', 44),                                                            #52
   ('693-485-6274', 45),                                                            #53
   ('697-597-0683', 46),                                                            #54
   ('691-287-7544', 47),                                                            #55
   ('695-073-9099', 48),                                                            #56
   ('699-712-4222', 49),                                                            #57
   ('691-493-1819', 50),                                                            #58
   ('693-243-7682', 51),                                                            #59
   ('692-095-4176', 52),                                                            #60
   ('690-196-7263', 53),                                                            #61
   ('695-685-6614', 54),                                                            #62
   ('691-075-5971', 55),                                                            #63
   ('691-339-0242', 56),                                                            #64
   ('698-869-9135', 57),                                                            #65
   ('697-213-1570', 58),                                                            #66
   ('696-678-7179', 59),                                                            #67
   ('694-877-9497', 60);                                                            #68

--
-- Insert 69 user_email data
--

INSERT INTO user_email (email, user_id) VALUES
   ('pystunka@creahobby.it', 1),                                                    #1
   ('zenitoff@fragilenet.com', 1),                                                  #2
   ('bailey.benton@hackett.com', 2),                                                #3
   ('imueller@murphy.com', 2),                                                      #4
   ('ara75@gmail.com', 3),                                                          #5
   ('mhansen@gmail.com', 4),                                                        #6
   ('jerel09@cruickshank.com', 5),                                                  #7
   ('ephraim.kunze@gutmann.com', 6),                                                #8
   ('schmitt.otha@lebsack.biz', 7),                                                 #9
   ('whitney.crooks@bartoletti.net', 8),                                            #10
   ('walsh.helmer@hotmail.com', 9),                                                 #11
   ('gilda65@yahoo.com', 9),                                                        #12
   ('ward47@koss.info', 9),                                                         #13
   ('pink82@marquardt.com', 10),                                                    #14
   ('kautzer.elvis@marks.com', 10),                                                 #15
   ('rippin.mireya@hotmail.com', 11),                                               #16
   ('xhammes@stracke.info', 12),                                                    #17
   ('zena.haley@gmail.com', 13),                                                    #18
   ('tberge@bartell.com', 14),                                                      #19
   ('rafael.carter@stracke.org', 15),                                               #20
   ('hermiston.derek@gmail.com', 15),                                               #21
   ('jesse.hickle@nader.org', 16),                                                  #22
   ('remington.bauch@lang.com', 17),                                                #23
   ('gkihn@gmail.com', 17),                                                         #24
   ('sframi@wintheiser.com', 18),                                                   #25
   ('okuneva.dawson@bechtelar.org', 19),                                            #26
   ('lockman.fatima@hotmail.com', 19),                                              #27
   ('trenton.braun@trantow.net', 20),                                               #28
   ('colin.robel@veum.org', 20),                                                    #29
   ('einar.von@cartwright.org',21),                                                 #30
   ('tyler44@durgan.biz', 22),                                                      #31
   ('ryley.zulauf@doyle.com', 23),                                                  #32
   ('heller.erna@hotmail.com', 24),                                                 #33
   ('uriah22@yahoo.com', 25),                                                       #34
   ('lamar.quigley@yahoo.com', 26),                                                 #35
   ('orin.gorczany@gmail.com', 27),                                                 #36
   ('kasandra.murray@grimes.net', 28),                                              #37
   ('stiedemann.ariane@spinka.biz', 29),                                            #38
   ('ohodkiewicz@hotmail.com', 30),                                                 #39
   ('darren.quigley@gmail.com', 31),                                                #40
   ('xbernhard@jaskolski.com', 32),                                                 #41
   ('krista.strosin@connelly.com', 33),                                             #42
   ('ibrahim.bradtke@hotmail.com', 34),                                             #43
   ('praynor@gmail.com', 35),                                                       #44
   ('ruecker.selmer@gmail.com', 36),                                                #45
   ('cmorar@yahoo.com', 37),                                                        #46
   ('oreilly.chloe@hotmail.com', 38),                                               #47
   ('anastasia.wolff@hotmail.com', 39),                                             #48
   ('ydenesik@hotmail.com', 40),                                                    #49
   ('wyman58@schamberger.info', 41),                                                #50
   ('nitzsche.westley@gmail.com', 42),                                              #51
   ('ccole@runte.info', 43),                                                        #52
   ('larkin.amina@ernser.info', 44),                                                #53
   ('sean05@gmail.com', 45),                                                        #54
   ('klocko.elissa@yahoo.com', 46),                                                 #55
   ('alene.blick@carter.org', 47),                                                  #56
   ('lubowitz.sydnie@ledner.biz', 48),                                              #57
   ('pouros.earline@jacobson.com', 49),                                             #58
   ('halvorson.kenyatta@olson.com', 50),                                            #59
   ('isai03@yahoo.com', 51),                                                        #60
   ('bradtke.lacey@bartell.biz', 52),                                               #61
   ('cristina.hilpert@gmail.com', 53),                                              #62
   ('alexa.johns@hotmail.com', 54),                                                 #63
   ('lindgren.ayla@bogisich.com', 55),                                              #64
   ('jenkins.ruthie@yahoo.com', 56),                                                #65
   ('nhahn@hotmail.com', 57),                                                       #66
   ('buckridge.royce@bode.com', 58),                                                #67
   ('edmond.blick@yahoo.com', 59),                                                  #68
   ('dibbert.mellie@hotmail.com', 60);                                              #69
				
--
-- Insert 3 Book Data
--

INSERT INTO Book (Title,Publisher,ISBN,Number of pages,Summary,Available Copies,Image,Language,School_ID) VALUES								
('O xamenos Thisavros','Patakis',978-618-02-5040-4,120,'Perilipsi',10,'Eikona','Ellinika',1)
('Harry Potter 1', 'Kedros', 441-610-02-0510-5,200,'Perilipsi',15,'Eikona','Ellinika',1)
('Harry Potter 1', 'Kedros', 441-610-02-0510-5,200,'Perilipsi',5,'Eikona','Ellinika',2)

--
-- Insert 20 Book's Thematic Categories
--

INSERT INTO Books Thematic Categories (Book_ID,Thematic Category) VALUES								
	(1,'Comedy')																	
    (2,'Comedy')
    (3,'Horror')
    (4,'Mystery')
    (5,'Thriller')
    (6,'Thriller')
    (7,'Drama')
    (8,'Romance')
    (9,'Horror')
    (10,'Romance')
    (11,'Science Fiction')
    (12,'Science Fiction')
    (13,'Fantasy')
    (14,'Science Fiction')
    (15,'Fantasy')
    (16,'Historical')
    (17,'Comedy')
    (18,'Mystery')
    (19,'Drama')
    (20,'Romance')

--
-- Insert 20 Book's Thematic Categories
--

INSERT INTO Books Key words (Book_ID,key words) VALUES								
(1,'Voitheia' 'Trexa')








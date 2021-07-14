USE [LibraryOP]
GO



INSERT INTO [dbo].[Gender]
           ([ID],
            [Name]
           )
     VALUES
           ('1','Female'),
		   ('2','Male'),
		   ('3','Other')
GO

INSERT INTO [dbo].[Institute]
           ([ID],
            [Name]
           )
     VALUES
           ('1','University of Tehran'),
		   ('2','Tehran University of Medical Sciences'),
		   ('3','Shahid Beheshti University of Medical Sciences'),
		   ('4','Iran University of Science and Technology'),
		   ('5','Amirkabir University of Technology'),
		   ('6','Ferdowsi University of Mashhad'),
		   ('7','Shahid Beheshti University'),
		   ('8','Technical and Vocational University'),
		   ('9','Sharif University of Technology'),
		   ('10','Tarbiat Modares University'),
		   ('11','Shiraz University'),
		   ('12','University of Tabriz'),
		   ('13','University of Applied Science and Technology'),
		   ('14','Islamic Azad University Central Tehran Branch'),
		   ('15','Mashhad University of Medical Sciences'),
		   ('16','Isfahan University of Technology'),
		   ('17','Isfahan University of Medical Sciences'),
		   ('18','University of Isfahan'),
		   ('19','Khaje Nasir Toosi University of Technology'),
		   ('20','Islamic Azad University, South Tehran'),
		   ('21','Allameh Tabatabaei University'),
		   ('22','Tabriz University of Medical Sciences'),
		   ('23','Shiraz University of Medical Sciences'),
		   ('24','Kharazmi University'),
		   ('25','Semnan University'),
		   ('26','University of Birjand'),
		   ('27','Islamic Azad University of Mashhad'),
		   ('28','Yazd University'),
		   ('29','Bu-Ali Sina University'),
		   ('30','Islamic Azad University Isfahan, Khorasgan Branch')
GO


INSERT INTO [dbo].[Qualification]
           ([ID],
            [Name]
           )
     VALUES
           ('1','Associate degree'),
		   ('2','Foundation degree'),
		   ('3','Bachelor degree'),
		   ('4','Master degree'),
		   ('5','Doctorate'),
		   ('6','Postdoctoral')
GO


INSERT INTO [dbo].[Research_Type]
           ([ID],
            [Name]
           )
     VALUES
           ('1','Descriptive research'),
		   ('2','Analytical research'),
		   ('3','Fundamental research'),
		   ('4','Conceptual research'),
		   ('5','Empirical research'),
		   ('6','One time research or longitudinal research'),
		   ('7','Field-setting research or laboratory research or simulation research'),
		   ('8','Clinical or diagnostic research'),
		   ('9','Exploratory research'),
		   ('10','Historical research'),
		   ('11','Conclusion oriented research'),
		   ('12','Case study research'),
		   ('13','Short term research')
GO

INSERT INTO [dbo].[Country]
           ([Name])
     VALUES
		('Afghanistan'),
		('Albania'),
		('Algeria'),
		('Andorra'),
		('Angola'),
		('Antigua and Barbuda'),
		('Argentina'),
		('Armenia'),
		('Australia'),
		('Austria'),
		('Azerbaijan'),
		('Bahamas, The'),
		('Bahrain'),
		('Bangladesh'),
		('Barbados'),
		('Belarus'),
		('Belgium'),
		('Belize'),
		('Benin'),
		('Bhutan'),
		('Bolivia'),
		('Bosnia and Herzegovina'),
		('Botswana'),
		('Brazil'),
		('Brunei'),
		('Bulgaria'),
		('Burkina Faso'),
		('Burma'),
		('Burundi'),
		('Cambodia'),
		('Cameroon'),
		('Canada'),
		('Cape Verde'),
		('Central Africa'),
		('Chad'),
		('Chile'),
		('China'),
		('Colombia'),
		('Comoros'),
		('Congo, Democratic Republic of the'),
		('Costa Rica'),
		('Cote dIvoire'),
		('Crete'),
		('Croatia'),
		('Cuba'),
		('Cyprus'),
		('Czech Republic'),
		('Denmark'),
		('Djibouti'),
		('Dominican Republic'),
		('East Timor'),
		('Ecuador'),
		('Egypt'),
		('El Salvador'),
		('Equatorial Guinea'),
		('Eritrea'),
		('Estonia'),
		('Ethiopia'),
		('Fiji'),
		('Finland'),
		('France'),
		('Gabon'),
		('Gambia, The'),
		('Georgia'),
		('Germany'),
		('Ghana'),
		('Greece'),
		('Grenada'),
		('Guadeloupe'),
		('Guatemala'),
		('Guinea'),
		('Guinea-Bissau'),
		('Guyana'),
		('Haiti'),
		('Holy See'),
		('Honduras'),
		('Hong Kong'),
		('Hungary'),
		('Iceland'),
		('India'),
		('Indonesia'),
		('Iran'),
		('Iraq'),
		('Ireland'),
		('Israel'),
		('Italy'),
		('Ivory Coast'),
		('Jamaica'),
		('Japan'),
		('Jordan'),
		('Kazakhstan'),
		('Kenya'),
		('Kiribati'),
		('Korea, North'),
		('Korea, South'),
		('Kosovo'),
		('Kuwait'),
		('Kyrgyzstan'),
		('Laos'),
		('Latvia'),
		('Lebanon'),
		('Lesotho'),
		('Liberia'),
		('Libya'),
		('Liechtenstein'),
		('Lithuania'),
		('Macau'),
		('Macedonia'),
		('Madagascar'),
		('Malawi'),
		('Malaysia'),
		('Maldives'),
		('Mali'),
		('Malta'),
		('Marshall Islands'),
		('Mauritania'),
		('Mauritius'),
		('Mexico'),
		('Micronesia'),
		('Moldova'),
		('Monaco'),
		('Mongolia'),
		('Montenegro'),
		('Morocco'),
		('Mozambique'),
		('Namibia'),
		('Nauru'),
		('Nepal'),
		('Netherlands'),
		('New Zealand'),
		('Nicaragua'),
		('Niger'),
		('Nigeria'),
		('North Korea'),
		('Norway'),
		('Oman'),
		('Pakistan'),
		('Palau'),
		('Panama'),
		('Papua New Guinea'),
		('Paraguay'),
		('Peru'),
		('Philippines'),
		('Poland'),
		('Portugal'),
		('Qatar'),
		('Romania'),
		('Russia'),
		('Rwanda'),
		('Saint Lucia'),
		('Saint Vincent and the Grenadines'),
		('Samoa'),
		('San Marino'),
		('Sao Tome and Principe'),
		('Saudi Arabia'),
		('Scotland'),
		('Senegal'),
		('Serbia'),
		('Seychelles'),
		('Sierra Leone'),
		('Singapore'),
		('Slovakia'),
		('Slovenia'),
		('Solomon Islands'),
		('Somalia'),
		('South Africa'),
		('South Korea'),
		('Spain'),
		('Sri Lanka'),
		('Sudan'),
		('Suriname'),
		('Swaziland'),
		('Sweden'),
		('Switzerland'),
		('Syria'),
		('Taiwan'),
		('Tajikistan'),
		('Tanzania'),
		('Thailand'),
		('Tibet'),
		('Timor-Leste'),
		('Togo'),
		('Tonga'),
		('Trinidad and Tobago'),
		('Tunisia'),
		('Turkey'),
		('Turkmenistan'),
		('Tuvalu'),
		('Uganda'),
		('Ukraine'),
		('United Arab Emirates'),
		('United Kingdom'),
		('United States'),
		('Uruguay'),
		('Uzbekistan'),
		('Vanuatu'),
		('Venezuela'),
		('Vietnam'),
		('Yemen'),
		('Zambia'),
		('Zimbabwe')
GO

INSERT INTO [dbo].[BookSize]
           ([ID],
            [Name]
           )
     VALUES
           ('1','TRADE BOOK'),
		   ('2','MINI SQUARE BOOK'),
		   ('3','SMALL SQUARE BOOK'),
		   ('4','LEGACY STANDARD PORTRAIT BOOK'),
		   ('5','STANDARD PORTRAIT BOOK'),
		   ('6','STANDARD LANDSCAPE BOOK'),
		    ('3','LARGE LANDSCAPE BOOK'),
		   ('4','LARGE SQUARE BOOK'),
		   ('5','MAGAZINE DIMENSIONS')
GO

INSERT INTO [dbo].[PhysicalType]
           ([ID],
            [Name]
           )
     VALUES
           ('1','Hardcover (Dust Jacket)'),
		   ('2','Hardcover (ImageWrap)'),
		   ('3','Softcover')
GO

--Author 
Declare @count int
Set @count = 1

While @count <= 30000
Begin 
   Insert Into [dbo].[Author] values (@count,
									'Author-' + CAST(@count as varchar(250))+'Fname',
									'Author-' + CAST(@count as varchar(250))+'Lname',
									Round(((201 - 1) * Rand()) + 1, 0),
									Round(((3 - 1) * Rand()) + 1, 0),
									Round(((1991 - 868) * Rand()) + 868, 0),
									NULL,
								   'Style'+ CAST(Round(((10 - 1) * Rand()) + 1, 0) as varchar(300)) )
								
   Set @count = @count + 1
End


create table tmp
(
	ID int,
	Firstname varchar(200),
	Lastname varchar(200),
	Country_ID int,
	Gender_ID int,
	BirthYear int,
	DeathYear int,
	Style varchar(300)
);

insert into tmp 
select ID,Firstname,Lastname,Country_ID,Gender_ID,BirthYear,BirthYear+Round(((100 - 30) * Rand()) + 30, 0) ,Style
from Author

select * from tmp where DeathYear > 2000
insert into tmp 
select ID,Firstname,Lastname,Country_ID,Gender_ID,BirthYear,BirthYear+Round(((100 - 30) * Rand()) + 30, 0) ,Style
from Author
truncate table Author

insert into Author 
select ID,Firstname,Lastname,Country_ID,Gender_ID,BirthYear, 
case 
when DeathYear > 2012 then NULL
else DeathYear
end as DeathYear
,Style
from tmp


select count(*) from Author where DeathYear is null
drop table tmp
--Category
INSERT INTO [dbo].[Category]
           ([ID]
           ,[Name])
     VALUES
           ('1','Action and Adventure'),
		   ('2','Classics'),
		   ('3','Comic Book or Graphic Novel'),
		   ('4','Detective and Mystery'),
		   ('5','Fantasy'),
		   ('6','Historical Fiction'),
		   ('7','Horror'),
		   ('8','Literary Fiction'),
		   ('9','Romance'),
		   ('10','Science Fiction'),
		   ('11','Short Stories'),
		   ('12','Suspense and Thrillers'),
		   ('13','Womens Fiction'),
		   ('14','Biographies and Autobiographies'),
		   ('15','Cookbooks'),
		   ('16','Essays'),
		   ('17','History'),
		   ('18','Memoir'),
		   ('19','Poetry'),
		   ('20','Scientific')
GO

--Age range
INSERT INTO [dbo].[Age_Range]
           ([ID],
            [Title],
			[Description]
           )
     VALUES
           ('1','0+','A'),
		   ('2','2+','B'),
		   ('3','4+','C'),
		   ('4','7+','D'),
		   ('5','9+','E'),
		   ('6','12+','F'),
		   ('7','15+','G')
GO

--Editor translator 
Declare @count int
Set @count = 1

While @count <= 15000
Begin 
   Insert Into [dbo].[Editor] values (@count,  'Editor-' + CAST(@count as varchar(250))+'Fname', 'Editor-' + CAST(@count as varchar(250))+'Lname')
   Set @count = @count + 1
End
---Translator
Declare @count int
Set @count = 1

While @count <= 15000
Begin 
   Insert Into [dbo].[Translator] values (@count,  'Translator-' + CAST(@count as varchar(250))+'Fname', 'Translator-' + CAST(@count as varchar(250))+'Lname')
   Set @count = @count + 1
End

--language
INSERT INTO Language VALUES(1, 'English', 'en');
INSERT INTO Language VALUES(2, 'Afar', 'aa');
INSERT INTO Language VALUES(3, 'Abkhazian', 'ab');
INSERT INTO Language VALUES(4, 'Afrikaans', 'af');
INSERT INTO Language VALUES(5, 'Amharic', 'am');
INSERT INTO Language VALUES(6, 'Arabic', 'ar');
INSERT INTO Language VALUES(7, 'Assamese', 'as');
INSERT INTO Language VALUES(8, 'Aymara', 'ay');
INSERT INTO Language VALUES(9, 'Azerbaijani', 'az');
INSERT INTO Language VALUES(10, 'Bashkir', 'ba');
INSERT INTO Language VALUES(11, 'Belarusian', 'be');
INSERT INTO Language VALUES(12, 'Bulgarian', 'bg');
INSERT INTO Language VALUES(13, 'Bihari', 'bh');
INSERT INTO Language VALUES(14, 'Bislama', 'bi');
INSERT INTO Language VALUES(15, 'Bengali/Bangla', 'bn');
INSERT INTO Language VALUES(16, 'Tibetan', 'bo');
INSERT INTO Language VALUES(17, 'Breton', 'br');
INSERT INTO Language VALUES(18, 'Catalan', 'ca');
INSERT INTO Language VALUES(19, 'Corsican', 'co');
INSERT INTO Language VALUES(20, 'Czech', 'cs');
INSERT INTO Language VALUES(21, 'Welsh', 'cy');
INSERT INTO Language VALUES(22, 'Danish', 'da');
INSERT INTO Language VALUES(23, 'German', 'de');
INSERT INTO Language VALUES(24, 'Bhutani', 'dz');
INSERT INTO Language VALUES(25, 'Greek', 'el');
INSERT INTO Language VALUES(26, 'Esperanto', 'eo');
INSERT INTO Language VALUES(27, 'Spanish', 'es');
INSERT INTO Language VALUES(28, 'Estonian', 'et');
INSERT INTO Language VALUES(29, 'Basque', 'eu');
INSERT INTO Language VALUES(30, 'Persian', 'fa');
INSERT INTO Language VALUES(31, 'Finnish', 'fi');
INSERT INTO Language VALUES(32, 'Fiji', 'fj');
INSERT INTO Language VALUES(33, 'Faeroese', 'fo');
INSERT INTO Language VALUES(34, 'French', 'fr');
INSERT INTO Language VALUES(35, 'Frisian', 'fy');
INSERT INTO Language VALUES(36, 'Irish', 'ga');
INSERT INTO Language VALUES(37, 'Scots/Gaelic', 'gd');
INSERT INTO Language VALUES(38, 'Galician', 'gl');
INSERT INTO Language VALUES(39, 'Guarani', 'gn');
INSERT INTO Language VALUES(40, 'Gujarati', 'gu');
INSERT INTO Language VALUES(41, 'Hausa', 'ha');
INSERT INTO Language VALUES(42, 'Hindi', 'hi');
INSERT INTO Language VALUES(43, 'Croatian', 'hr');
INSERT INTO Language VALUES(44, 'Hungarian', 'hu');
INSERT INTO Language VALUES(45, 'Armenian', 'hy');
INSERT INTO Language VALUES(46, 'Interlingua', 'ia');
INSERT INTO Language VALUES(47, 'Interlingue', 'ie');
INSERT INTO Language VALUES(48, 'Inupiak', 'ik');
INSERT INTO Language VALUES(49, 'Indonesian', 'in');
INSERT INTO Language VALUES(50, 'Icelandic', 'is');
INSERT INTO Language VALUES(51, 'Italian', 'it');
INSERT INTO Language VALUES(52, 'Hebrew', 'iw');
INSERT INTO Language VALUES(53, 'Japanese', 'ja');
INSERT INTO Language VALUES(54, 'Yiddish', 'ji');
INSERT INTO Language VALUES(55, 'Javanese', 'jw');
INSERT INTO Language VALUES(56, 'Georgian', 'ka');
INSERT INTO Language VALUES(57, 'Kazakh', 'kk');
INSERT INTO Language VALUES(58, 'Greenlandic', 'kl');
INSERT INTO Language VALUES(59, 'Cambodian', 'km');
INSERT INTO Language VALUES(60, 'Kannada', 'kn');
INSERT INTO Language VALUES(61, 'Korean', 'ko');
INSERT INTO Language VALUES(62, 'Kashmiri', 'ks');
INSERT INTO Language VALUES(63, 'Kurdish', 'ku');
INSERT INTO Language VALUES(64, 'Kirghiz', 'ky');
INSERT INTO Language VALUES(65, 'Latin', 'la');
INSERT INTO Language VALUES(66, 'Lingala', 'ln');
INSERT INTO Language VALUES(67, 'Laothian', 'lo');
INSERT INTO Language VALUES(68, 'Lithuanian', 'lt');
INSERT INTO Language VALUES(69, 'Latvian/Lettish', 'lv');
INSERT INTO Language VALUES(70, 'Malagasy', 'mg');
INSERT INTO Language VALUES(71, 'Maori', 'mi');
INSERT INTO Language VALUES(72, 'Macedonian', 'mk');
INSERT INTO Language VALUES(73, 'Malayalam', 'ml');
INSERT INTO Language VALUES(74, 'Mongolian', 'mn');
INSERT INTO Language VALUES(75, 'Moldavian', 'mo');
INSERT INTO Language VALUES(76, 'Marathi', 'mr');
INSERT INTO Language VALUES(77, 'Malay', 'ms');
INSERT INTO Language VALUES(78, 'Maltese', 'mt');
INSERT INTO Language VALUES(79, 'Burmese', 'my');
INSERT INTO Language VALUES(80, 'Nauru', 'na');
INSERT INTO Language VALUES(81, 'Nepali', 'ne');
INSERT INTO Language VALUES(82, 'Dutch', 'nl');
INSERT INTO Language VALUES(83, 'Norwegian', 'no');
INSERT INTO Language VALUES(84, 'Occitan', 'oc');
INSERT INTO Language VALUES(85, '(Afan)/Oromoor/Oriya', 'om');
INSERT INTO Language VALUES(86, 'Punjabi', 'pa');
INSERT INTO Language VALUES(87, 'Polish', 'pl');
INSERT INTO Language VALUES(88, 'Pashto/Pushto', 'ps');
INSERT INTO Language VALUES(89, 'Portuguese', 'pt');
INSERT INTO Language VALUES(90, 'Quechua', 'qu');
INSERT INTO Language VALUES(91, 'Rhaeto-Romance', 'rm');
INSERT INTO Language VALUES(92, 'Kirundi', 'rn');
INSERT INTO Language VALUES(93, 'Romanian', 'ro');
INSERT INTO Language VALUES(94, 'Russian', 'ru');
INSERT INTO Language VALUES(95, 'Kinyarwanda', 'rw');
INSERT INTO Language VALUES(96, 'Sanskrit', 'sa');
INSERT INTO Language VALUES(97, 'Sindhi', 'sd');
INSERT INTO Language VALUES(98, 'Sangro', 'sg');
INSERT INTO Language VALUES(99, 'Serbo-Croatian', 'sh');
INSERT INTO Language VALUES(100, 'Singhalese', 'si');
INSERT INTO Language VALUES(101, 'Slovak', 'sk');
INSERT INTO Language VALUES(102, 'Slovenian', 'sl');
INSERT INTO Language VALUES(103, 'Samoan', 'sm');
INSERT INTO Language VALUES(104, 'Shona', 'sn');
INSERT INTO Language VALUES(105, 'Somali', 'so');
INSERT INTO Language VALUES(106, 'Albanian', 'sq');
INSERT INTO Language VALUES(107, 'Serbian', 'sr');
INSERT INTO Language VALUES(108, 'Siswati', 'ss');
INSERT INTO Language VALUES(109, 'Sesotho', 'st');
INSERT INTO Language VALUES(110, 'Sundanese', 'su');
INSERT INTO Language VALUES(111, 'Swedish', 'sv');
INSERT INTO Language VALUES(112, 'Swahili', 'sw');
INSERT INTO Language VALUES(113, 'Tamil', 'ta');
INSERT INTO Language VALUES(114, 'Telugu', 'te');
INSERT INTO Language VALUES(115, 'Tajik', 'tg');
INSERT INTO Language VALUES(116, 'Thai', 'th');
INSERT INTO Language VALUES(117, 'Tigrinya', 'ti');
INSERT INTO Language VALUES(118, 'Turkmen', 'tk');
INSERT INTO Language VALUES(119, 'Tagalog', 'tl');
INSERT INTO Language VALUES(120, 'Setswana', 'tn');
INSERT INTO Language VALUES(121, 'Tonga', 'to');
INSERT INTO Language VALUES(122, 'Turkish', 'tr');
INSERT INTO Language VALUES(123, 'Tsonga', 'ts');
INSERT INTO Language VALUES(124, 'Tatar', 'tt');
INSERT INTO Language VALUES(125, 'Twi', 'tw');
INSERT INTO Language VALUES(126, 'Ukrainian', 'uk');
INSERT INTO Language VALUES(127, 'Urdu', 'ur');
INSERT INTO Language VALUES(128, 'Uzbek', 'uz');
INSERT INTO Language VALUES(129, 'Vietnamese', 'vi');
INSERT INTO Language VALUES(130, 'Volapuk', 'vo');
INSERT INTO Language VALUES(131, 'Wolof', 'wo');
INSERT INTO Language VALUES(132, 'Xhosa', 'xh');
INSERT INTO Language VALUES(133, 'Yoruba', 'yo');
INSERT INTO Language VALUES(134, 'Chinese', 'zh');
INSERT INTO Language VALUES(135, 'Zulu', 'zu');

--Province
INSERT INTO [dbo].[Province]
           ([ID]
           ,[Name])
     VALUES
           ('1','East Azerbaijan'),
		   ('2','West Azerbaijan'),
		   ('3','Ardabil'),
		   ('4','Isfahan'),
		   ('5','Alborz'),
		   ('6','Ilam'),
		   ('7','Bushehr'),
		   ('8','Tehran'),
		   ('9','Chaharmahal and Bakhtiari '),
		   ('10','South Khorasan'),
		   ('11','Razavi Khorasan'),
		   ('12','North Khorasan'),
		   ('13','Khuzestan'),
		   ('14','Zanjan'),
		   ('15','Semnan'),
		   ('16','Sistan and Baluchestan '),
		   ('17','Fars'),
		   ('18','Qazvin'),
		   ('19','Qom'),
		   ('20','Kurdistan'),
		   ('21','Kerman'),
		   ('22','Kermanshah'),
		   ('23','Kohgiluyeh and Boyer-Ahmad '),
		   ('24','Golestan'),
		   ('25','Gilan'),
		   ('26','Lorestan'),
		   ('27','Mazandaran'),
		   ('28','Markazi'),
		   ('29','Hormozgan'),
		   ('30','Hamadan'),
		   ('31','Yazd')
GO
--event category
INSERT INTO [dbo].Event_Category
           ([ID]
           ,[Name])
     VALUES
           ('1','Seminar'),
		   ('2','Book Reading'),
		   ('3','Educational'),
		   ('4','Meeting')
Go

--research category

INSERT INTO [dbo].Research_Category
           ([ID]
           ,[Name])
     VALUES
           ('1','Literature'),
		   ('2','Engineering'),
		   ('3','Psychology'),
		   ('4','Science')
Go

--position
INSERT INTO [dbo].[Position]
           ([ID]
           ,[Title]
		   ,[Salary])
     VALUES
           ('1','Pages','3000000'),
		   ('2','Library Assistants','3000000'),
		   ('3','Librarians','2700000'),
		   ('4','Library Managers ','4000000'),
		   ('5','Library Directors','3000000'),
		   ('6','Other Professionals','2500000')
Go

--city
Declare @count int
Set @count = 1

While @count <= 50
Begin 
   Insert Into [dbo].[City] values (@count,
									'City-' + CAST(@count as varchar(250)),
									Round(((31 - 1) * Rand()) + 1, 0))
   Set @count = @count + 1
End

--supplier
Declare @count int
Set @count = 1
While @count <= 300
Begin 
   Insert Into [dbo].[Suplier] values (@count,
									'[Suplier]-' + CAST(@count as varchar(250)),
									CAST( Round(((99 - 11) * Rand()) + 901, 0) as varchar(5))+'-'+CAST( Round(((9999 - 0) * Rand()) + 0, 0) as varchar(5))+'-'+CAST( Round(((9990 - 0) * Rand()) +0, 0) as varchar(5)),
									CAST( Round(((50 - 1) * Rand()) + 1, 0) as varchar(5))+'Street No.' + CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(5)),
									Round(((50 - 1) * Rand()) + 1, 0))
   Set @count = @count + 1
End

--publisher 
Declare @count int
Set @count = 1
While @count <= 300
Begin 
   Insert Into [dbo].[Publisher] values (@count,
									'Publisher-' + CAST(@count as varchar(250)),
									CAST( Round(((99 - 11) * Rand()) + 901, 0) as varchar(5))+'-'+CAST( Round(((9999 - 0) * Rand()) + 0, 0) as varchar(5))+'-'+CAST( Round(((9990 - 0) * Rand()) +0, 0) as varchar(5)),
									CAST( Round(((50 - 1) * Rand()) + 1, 0) as varchar(5))+'Street No.' + CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(5)),
									Round(((50 - 1) * Rand()) + 1, 0))
   Set @count = @count + 1
End

--branch
Declare @count int
Set @count = 1
While @count <= 10
Begin 
   Insert Into [dbo].[Branch] values (@count,
									'Branch-' + CAST(@count as varchar(250)),
									CAST( Round(((50 - 1) * Rand()) + 1, 0) as varchar(5))+' JumpStreet No.' + CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(5)),
									LEFT(CAST(RAND()*100000000+99999999 AS BIGINT),8),
									CAST( Round(((99 - 11) * Rand()) + 901, 0) as varchar(5))+'-'+CAST( Round(((9999 - 0) * Rand()) + 0, 0) as varchar(5))+'-'+CAST( Round(((9990 - 0) * Rand()) +0, 0) as varchar(5)),
									Round(((50 - 1) * Rand()) + 1, 0))
   Set @count = @count + 1
End


--employee

Declare @count int
Set @count = 1
While @count <= 17000
Begin 
   Insert Into [dbo].[Employee] values (@count, --id
									'Employee-' + CAST(@count as varchar(250))+'Fname',--fname
									'Employee-' + CAST(@count as varchar(250))+'Lname',--lname
									LEFT(CAST(RAND()*10000000000+9999999999 AS BIGINT),10),--natcode
									CAST( Round(((50 - 1) * Rand()) + 1, 0) as varchar(5))+'Street No.' + CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(5)),--address
									CAST( Round(((999 - 901) * Rand()) + 901, 0) as varchar(5))+'-'+CAST( Round(((999 - 0) * Rand()) + 0, 0) as varchar(5))+'-'+CAST( Round(((9999 - 0) * Rand()) +0, 0) as varchar(5)),--phone
									(DATEADD(day, ROUND(DATEDIFF(day, '2009-03-21', '2014-01-01') * RAND(CHECKSUM(NEWID())), 5),DATEADD(second, abs(CHECKSUM(NEWID())) % 86400, '2009-03-21'))) ,--hiredate
									Round(((10 - 1) * Rand()) + 1, 0),--branch
									Round(((6 - 1) * Rand()) + 1, 0),--position
									Round(((30 - 1) * Rand()) + 1, 0),--institute
									Round(((3 - 1) * Rand()) + 1, 0),--gender
									LEFT(CAST(RAND()*100000000000000+9999999999999 AS BIGINT),14),--empNo
									Round(((1970 - 2008) * Rand()) + 2008, 0),
									Round(((6 - 1) * Rand()) + 1, 0),
									Round(((1 - 0) * Rand()) + 0, 0))





   Set @count = @count + 1
End
-----------------------------------------------------------------------------------------------------------------------------
--member
Declare @count int
Set @count = 1
While @count <= 500000
Begin 
   Insert Into [dbo].[Member] values (@count,
									'Member-' + CAST(@count as varchar(250))+'Fname',
									'Member-' + CAST(@count as varchar(250))+'Lname',
									LEFT(CAST(RAND()*100000000000+99999999999 AS BIGINT),11),
									CAST( Round(((50 - 1) * Rand()) + 1, 0) as varchar(5))+'Street No.' + CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(5)),
									CAST( Round(((999 - 901) * Rand()) + 901, 0) as varchar(5))+'-'+CAST( Round(((999 - 0) * Rand()) + 0, 0) as varchar(5))+'-'+CAST( Round(((9999 - 0) * Rand()) +0, 0) as varchar(5)),
									(DATEADD(day, ROUND(DATEDIFF(day, '2009-03-21', '2014-01-01') * RAND(CHECKSUM(NEWID())), 5),DATEADD(second, abs(CHECKSUM(NEWID())) % 86400, '2009-03-21'))) ,
									Round(((10 - 1) * Rand()) + 1, 0),
									NULL,
									Round(((3 - 1) * Rand()) + 1, 0),--gender
									Round(((6 - 1) * Rand()) + 1, 0))


   Set @count = @count + 1
End


DELETE FROM Member 
WHERE ID NOT IN (SELECT MAX(ID) 
                 FROM Member 
                 GROUP BY NationalCode)

--Book

Declare @count int
Set @count = 1
While @count <= 350000
Begin 
   Insert Into [dbo].[Book] values (@count,
									 LEFT(CAST(RAND()*10000000000000000+9999999999999999 AS BIGINT),16),
									'Book-' + CAST(@count as varchar(10))+'Title',
									'Book-' + CAST(@count as varchar(10))+'Description',
									CAST( Round(((2014 - 1800) * Rand()) + 1800, 0) as varchar(10)),
									CAST( Round(((300 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((20 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((7 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((15000 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((15000 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((135 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((30 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((1500 - 25) * Rand()) + 25, 0) as varchar(10)),
									CAST( Round(((9 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((1500 - 500) * Rand()) + 500, 0) as varchar(10)))								
																
   Set @count = @count + 1
End

DELETE FROM Book 
WHERE ID NOT IN (SELECT MAX(ID) 
                 FROM Book 
                 GROUP BY ISBN)
--Author book
Declare @count int
Set @count = 1
Declare @end int;
Set @end = (select count(*) from Book);
While @count <= @end
Begin 
   Insert Into [dbo].[Author_Book] values (
										   CAST( Round(((30000 - 1) * Rand()) + 1, 0) as varchar(50)),
										   @count)				
   Set @count = @count + 1
End

Declare @count int;
Set @count = (select count(*) from Book) +1;
While @count <= 390000
Begin 
   Insert Into [dbo].[Author_Book] values (
										   CAST( Round(((30000 - 1) * Rand()) + 1, 0) as varchar(50)),
										   CAST( Round((((select count(*) from Book) - 1) * Rand()) + 1, 0) as varchar(50)))				
   Set @count = @count + 1
End

--Book Volume

Declare @count int
Set @count = 1
While @count <= 1000000
Begin 
   Insert Into [dbo].[Book_Volume] values (@count,
									'Floor' + CAST(Round(((4 - 1) * Rand()) + 1, 0) as varchar(10))+'Row'+CAST(Round(((40 - 1) * Rand()) + 1, 0) as varchar(10))+'Shelf'+CAST(Round(((200 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((349971 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((10 - 1) * Rand()) + 1, 0) as varchar(10)),
									Round(((700000 - 10000) * Rand()) + 10000, 0),
									CAST( Round(((3 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((5 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((2014 - 1800) * Rand()) + 1800, 0) as varchar(10)),
									CAST( Round(((1500 - 500) * Rand()) + 500, 0) as varchar(10)),
									CAST( Round(((9 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((30 - 1) * Rand()) + 1, 0) as varchar(10)))
									 								
   Set @count = @count + 1
End
--research state

INSERT INTO [dbo].[Research_State]
           ([ID],
            [Name]
           )
     VALUES
           ('1','In progress'),
		   ('2','Completed'),
		   ('3','Canceled')
GO
--research
Declare @count int
Set @count = 1
While @count <= 1000000
Begin 
   Insert Into [dbo].[Research] values (@count,
									'Research-' + CAST(@count as varchar(10))+'Title',
									'Research-' + CAST(@count as varchar(10))+'Description',
									Round(((5000000 - 100000) * Rand()) + 100000, 0),
									(DATEADD(day, ROUND(DATEDIFF(day, '2009-03-21', '2014-01-01') * RAND(CHECKSUM(NEWID())), 5),DATEADD(second, abs(CHECKSUM(NEWID())) % 86400, '2009-03-21'))) ,
									NULL,
									'http://'+char(rand()*26+65)+char(rand()*26+65)+char(rand()*26+65)
									  +char(rand()*26+65)+char(rand()*26+65)+char(rand()*26+65)
									  +char(rand()*26+65)+char(rand()*26+65)+char(rand()*26+65)
									  +char(rand()*26+65)+char(rand()*26+65)+char(rand()*26+65)
									  +char(rand()*26+65)+char(rand()*26+65)+char(rand()*26+65) +'ir/docid?'+CAST(@count as varchar(20)),
									CAST( Round(((10 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((4 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((13 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((3 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round((17000 * Rand()) + 1, 0) as varchar(10)))

   Set @count = @count + 1
End
--event
Declare @count int
Set @count = 1
While @count <= 1000000
Begin 
   Insert Into [dbo].[Event] values (@count,
									'Event-' + CAST(@count as varchar(10))+'Title',
									'Event-' + CAST(@count as varchar(10))+'Description',
									Round(((5000000 - 100000) * Rand()) + 100000, 0),
									(DATEADD(day, ROUND(DATEDIFF(day, '2009-03-21', '2014-01-01') * RAND(CHECKSUM(NEWID())), 5),DATEADD(second, abs(CHECKSUM(NEWID())) % 86400, '2009-03-21'))) ,
									CAST( Round(((10 - 1) * Rand()) + 1, 0) as varchar(10)),
									CAST( Round(((4 - 1) * Rand()) + 1, 0) as varchar(10)))

																	
   Set @count = @count + 1
End 
---research member
Declare @count int
Set @count = 1
While @count <= 1000000
Begin 
   Insert Into [dbo].[Research_Member] values (
										   CAST( Round(((349971 - 1) * Rand()) + 1, 0) as varchar(50)),
										   @count)				
   Set @count = @count + 1
End

Declare @count int
Set @count = 1000001
While @count <= 1020000
Begin 
   Insert Into [dbo].[Research_Member] values (
										   CAST( Round(((349971 - 1) * Rand()) + 1, 0) as varchar(50)),
										   CAST( Round(((1000000 - 1) * Rand()) + 1, 0) as varchar(50)))				
   Set @count = @count + 1
End


--Reserach_Payments
--Declare @count int
--Set @count = 1
--While @count <= 1001000
--Begin 
--   Declare @selectedID int
--   Declare @selectedCost bigint
--   Declare @remaind bigint
--   Declare @selectedDate datetime
--   set @selectedID = CAST( Round((999 * Rand()) + 1, 0) as INT)
--   set @selectedDate = (select [StartDate] from Research where ID=@selectedID)
--   set @selectedCost = (select Cost from Research where ID=@selectedID)
--   set @remaind = ISNULL((select ISNULL(sum(Payment),0) from Research_Payments where Research_ID=@selectedID group by Research_ID),0)
--   print(@remaind)
--   set @remaind = @selectedCost - @remaind
--   Insert Into [dbo].[Research_Payments] values (
--												@count,
--												@selectedID,
--												CAST(Round((((30 * Rand()) + 30)*@remaind)/100,0) as INT ),
--												DATEADD(MONTH,(Round(7*Rand() + 1,0)),@selectedDate)
--												)
--   Set @count = @count + 1
--End



select count(*) from Research
Declare @count int
Set @count = 1
While @count <= 1000000
Begin 
   
   Insert Into [dbo].[Research_Payments] values (
												@count,
												@count,
												Round(((800000 - 100000) * Rand()) + 100000,0),
												NULL
												)
   Set @count = @count + 1
End

update Research_Payments  set PayDate = (select StartDate from Research as r  where r.ID=Research_ID)

update Research  set Cost = (select summ from (select Research_ID,sum(Payment)as summ from Research_Payments as r   group by Research_ID )as t where t.Research_ID=ID)



select count(*) from Research_Payments
select * from Research_Payments order by Research_ID


Declare @count int
Set @count = 1000001
While @count <= 2000000
Begin 
   
   Insert Into [dbo].[Research_Payments] values (
												@count,
												@count-1000000,
												Round(((500000 - 100000) * Rand()) + 100000,0),
												NULL
												)
   Set @count = @count + 1
End


update Research  set Cost = (select summ from (select Research_ID,sum(Payment)as summ from Research_Payments as r   group by Research_ID )as t where t.Research_ID=ID) + ROUND(250000*RAND(),0)+100000
update Research_Payments  set PayDate =DateADD(day, ROUND(25*RAND(),0)+1, (select StartDate from Research as r  where r.ID=Research_ID))


---Borrowed_Book


--select count(*) from [Borrowed_Books]
--select * from [Borrowed_Books] order by BookV_ID,Modified_Date




--CREATE TABLE [dbo].originalBorrowedBooks(
--	[ID] [int] NULL,
--	[Borrowing_Date] [datetime] NULL,
--	[Due_Date] [datetime] NULL,
--	[Returned_Date] [datetime] NULL,
--	[Member_ID] [int] NULL,
--	[Employee_ID] [int] NULL,
--	[BookV_ID] [int] NULL,
--	[Modified_Date] [datetime] NULL
--) 
--GO

--insert into originalBorrowedBooks select * from Borrowed_Books
-------------------------------------------------------------------------------------
--CREATE TABLE [dbo].back(
--	[ID] [int] NULL,
--	[Borrowing_Date] [datetime] NULL,
--	[Due_Date] [datetime] NULL,
--	[Returned_Date] [datetime] NULL,
--	[Member_ID] [int] NULL,
--	[Employee_ID] [int] NULL,
--	[BookV_ID] [int] NULL,
--	[Modified_Date] [datetime] NULL
--) 
--GO

--CREATE TABLE [dbo].give(
--	[ID] [int] NULL,
--	[Borrowing_Date] [datetime] NULL,
--	[Due_Date] [datetime] NULL,
--	[Returned_Date] [datetime] NULL,
--	[Member_ID] [int] NULL,
--	[Employee_ID] [int] NULL,
--	[BookV_ID] [int] NULL,
--	[Modified_Date] [datetime] NULL
--) 
--GO

--truncate table back
--insert into back
--select ID,Borrowing_Date,Due_Date,Due_Date,Member_ID,Employee_ID,BookV_ID,Due_Date
--from give

--insert into Borrowed_Books select * from back

--truncate table give
--insert into give 
--select  ID,DATEADD(day,1,Due_Date),DATEADD(day,11,Due_Date),NULL,Member_ID-1,Employee_ID,BookV_ID,DATEADD(day,1,Due_Date)
--from back
--insert into Borrowed_Books select * from give

--select max(Due_Date)from Borrowed_Books




select count(*) from Book_Volume
Declare @count int
set @count = 1
while @count < 1000000
begin
	declare @borrowed_date datetime
	declare @bookV_id int
	declare @branch_id int
	declare @mid int
	declare @eid int
	set @bookV_id = CAST( Round((1000000 * Rand()) + 1, 0) as INT)
	set @branch_id = (select Branch_ID from Book_Volume where ID=@bookV_id)
	set @mid = (select top(1) ID from Member where Branch_ID=@branch_id order by newid())
	set @eid = (select top(1) ID from Employee where Branch_ID=@branch_id order by newid())
	set @borrowed_date = (DATEADD(day, ROUND(DATEDIFF(day, '2009-03-21', '2014-01-01') * RAND(CHECKSUM(NEWID())), 5),DATEADD(second, abs(CHECKSUM(NEWID())) % 86400, '2009-03-21')))
	insert into [dbo].[Borrowed_Books] values (
												@count,
												@borrowed_date,
												DATEADD(MONTH,(Round(3*Rand() + 1,0)),@borrowed_date),
												NULL,
												@mid,
												@eid,
												@bookV_id,
												@borrowed_date
											)
	set @count = @count + 1
end


-----salary------------------------------------------------being Done

declare @no int;
set @no = 1;
declare @id int;
set @id = 1;
declare @posID int;
declare @base int;
declare @start datetime;
set @start = '2009-03-21 23:00:00';
declare @rand int;

while @start < '2014-01-02 23:00:00'
begin

	while @no<=17000
	begin
		set @posID = (select Position_ID from Employee where ID=@no);
		set @base = (select Salary from Position where ID = @posID);
		set @rand = ROUND(RAND()*(700000-100000+1),0)+100000;
		print @base + @rand;
		insert into Salary (ID,Salary,Date,Employee_ID )values (@id,@base + @rand,@start,@no);
		set @id = @id+1;
		set @no = @no+1;

	end
	set @no=1;
	set @start = dateadd(month,1,@start);
end



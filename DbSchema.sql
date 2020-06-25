USE master;
GO

IF DB_ID (N'Phonebook') IS NOT NULL
ALTER DATABASE Phonebook SET SINGLE_USER with ROLLBACK IMMEDIATE
IF DB_ID (N'Phonebook') IS NOT NULL
DROP DATABASE Phonebook;
GO

create database Phonebook collate Polish_CI_AS;
go
use Phonebook


CREATE TABLE People(
	[Id] int primary key identity(1,1) NOT NULL,
	[FirstName] nvarchar(50) NULL,
	[LastName] nvarchar(50) NULL,
	[Phone] nvarchar(25) NULL,
	[Email] nvarchar(50) NULL,
	[Created] datetimeoffset(7) NOT NULL,
	[Updated] datetimeoffset(7) NULL
)

insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Marek', 'Adameczek', '123456789', 'marek@gov.pl', '2020-06-20T16:46:00.0000000+02:00', '2020-06-22T22:04:38.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Ignacy', 'Baran', '719041323', 'i_baran@sunandsnow.pl', '2018-04-24T15:37:05.0000000+02:00', '2020-06-25T15:10:12.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Cezary', 'Baranowski', '685656105', 'c_baranowski@gmail.com', '2019-07-01T17:43:28.0000000+02:00', '2020-04-12T18:15:37.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Emil', 'B¹k', '689788340', 'e_bak@gmail.com', '2019-10-07T04:24:27.0000000+02:00', '2020-02-18T08:07:57.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Bogdan', 'B¹k', '513612230', 'b_b1233@gmail.com', '2020-06-20T17:02:49.0000000+02:00', '2020-06-22T19:17:30.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Adelajda', 'B³aszczyk', '695003499', 'a_blaszczyk@gmail.com', '2020-03-27T11:15:49.0000000+02:00', '2020-06-25T14:37:43.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Regina', 'B³aszczyk', '637219366', 'r_blaszczyk@gmail.com', '2019-07-16T12:25:01.0000000+02:00', '2020-02-23T01:07:08.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Kleopatra', 'Borowska', '598502162', 'k_borowska@gmail.com', '2020-04-22T07:41:34.0000000+02:00', '2020-06-25T14:37:36.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Gra¿yna', 'Borowska', '534588287', 'g_borowska@gmail.com', '2020-02-19T19:43:07.0000000+02:00', '2020-05-20T23:15:51.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Adrian', 'Czarnecki', '776542096', 'a_czarnecki@gmail.com', '2018-11-21T01:20:59.0000000+02:00', '2020-04-12T23:10:47.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Kajetan', 'D¹browski', '724434760', 'k_dabrowski@gmail.com', '2019-09-12T02:16:42.0000000+02:00', '2020-04-27T02:20:00.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Cezary', 'D¹browski', '574410269', 'c_dabrowski@wp.pl', '2018-10-26T10:44:50.0000000+02:00', '2020-06-25T13:47:20.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Jolanta', 'Dudek', '633401052', 'j_dudek@gmail.com', '2020-07-07T17:50:50.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Liliana', 'G³owacka', '655042042', 'l_glowacka@gmail.com', '2018-08-11T03:11:11.0000000+02:00', '2019-01-05T10:31:48.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Janusz', 'G³owacki', '774107144', 'j_glowacki@gmail.com', '2018-12-02T19:59:49.0000000+02:00', '2019-12-24T11:38:49.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Melania', 'Górska', '575863348', 'm_gorska@gmail.com', '2018-05-11T14:17:57.0000000+02:00', '2019-08-10T02:33:10.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Leszek', 'Górski', '737804394', 'l_gorski@gmail.com', '2019-08-27T19:17:56.0000000+02:00', '2020-04-25T03:26:02.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Roman', 'Grabowski', '652824782', 'r_grabowski@gmail.com', '2020-03-28T00:30:00.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Aleksander', 'Jakubowski', '500835336', 'a_jakubowski@gmail.com', '2018-06-09T15:24:51.0000000+02:00', '2020-04-16T23:45:38.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Tomasz', 'Jankowski', '675536131', 't_jankowski@gmail.com', '2018-03-17T06:23:21.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Adam', 'Jaworski', '793852665', 'a_jaworski@gmail.com', '2018-08-11T23:39:16.0000000+02:00', '2018-11-13T16:43:37.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Kamil', 'Jaworski', '620647543', 'k_jaworski@gmail.com', '2020-02-10T22:35:13.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Stanis³aw', 'Kamiñski', '650448298', 's_kaminski@gmail.com', '2020-04-20T06:06:28.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Edward', 'KaŸmierczak', '564614446', 'e_kazmierczak@gmail.com', '2019-03-25T05:41:31.0000000+02:00', '2019-12-14T23:36:30.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Zyta', 'KaŸmierczak', '596554101', 'z_kazmierczak@gmail.com', '2020-03-28T15:12:16.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Lucyna', 'KaŸmierczak', '503237426', 'l_kazmierczak@gmail.com', '2019-04-19T06:59:39.0000000+02:00', '2019-11-21T01:47:55.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Igor', 'Ko³odziej', '745180787', 'i_kolodziej@gmail.com', '2019-01-18T13:38:25.0000000+02:00', '2019-04-05T23:15:25.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Amanda', 'Koz³owska', '777866255', 'a_kozlowska@gmail.com', '2019-09-10T02:13:03.0000000+02:00', '2019-12-22T00:55:25.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Cyryl', 'Krajewski', '657444029', 'c_krajewski@gmail.com', '2019-03-18T00:10:52.0000000+02:00', '2020-01-04T05:23:54.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Marta', 'Krawczyk', '696027183', 'm_krawczyk@gmail.com', '2019-08-17T14:56:27.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Diana', 'Krupa', '761396773', 'd_krupa@gmail.com', '2018-01-19T05:06:48.0000000+02:00', '2020-03-26T01:04:43.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Joanna', 'Kwiatkowska', '629337514', 'j_kwiatkowska@gmail.com', '2018-01-07T19:44:17.0000000+02:00', '2020-04-06T19:03:09.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Anna', 'Kwiatkowska', '552454431', 'a_kwiatkowska@gmail.com', '2020-03-02T17:56:58.0000000+02:00', '2020-06-25T14:44:09.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Matylda', 'Kwiatkowska', '567753148', 'm_kwiatkowska@gmail.com', '2019-05-02T16:23:59.0000000+02:00', '2020-05-27T03:54:15.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Jolanta', 'Kwiatkowska', '696511074', 'j_kwiatkowska@gmail.com', '2019-01-06T09:46:59.0000000+02:00', '2019-06-18T05:07:16.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Gustaw', 'Kwiatkowski', '580314103', 'g_kwiatkowski@gmail.com', '2018-01-28T20:19:18.0000000+02:00', '2018-06-24T15:31:06.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Marta', 'Laskowska', '545043109', 'm_laskowska@gmail.com', '2017-09-07T15:59:22.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Damian', 'Lewandowski', '752241464', 'd_lewandowski@gmail.com', '2018-10-18T09:00:31.0000000+02:00', '2020-03-20T21:05:30.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Franciszek', 'Lis', '572732062', 'f_lis@lis.pl', '2019-02-14T18:37:58.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Anastazja', 'Lis', '775495798', 'a_lis@gmail.com', '2018-01-22T08:45:01.0000000+02:00', '2019-10-28T11:14:15.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Jaros³aw', 'Majewski', '608653350', 'j_majewski@gmail.com', '2019-04-11T05:18:47.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Iga', 'Malinowska', '601557897', 'i_malinowska@gmail.com', '2018-05-20T09:43:05.0000000+02:00', '2019-03-18T05:47:04.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Tamara', 'Marciniak', '787224314', 't_marciniak@gmail.com', '2018-01-20T19:27:46.0000000+02:00', '2018-03-04T15:32:07.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Leokadia', 'Marciniak', '574962211', 'l_marciniak@gmail.com', '2018-01-14T15:44:16.0000000+02:00', '2019-12-14T18:59:34.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Rozalia', 'Marciniak', '576753394', 'r_marciniak@gmail.com', '2019-04-17T02:45:19.0000000+02:00', '2020-04-25T20:07:16.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Sebastian', 'Marciniak', '784410508', 's_marciniak@gmail.com', '2018-01-09T07:10:13.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Herbert', 'Mazur', '544757913', 'h_mazur@gmail.com', '2018-05-12T16:07:03.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Fabian', 'Mazurek', '550556789', 'f_mazurek@gmail.com', '2020-05-27T14:03:28.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Agata', 'Mazurek', '614479893', 'a_mazurek@gmail.com', '2018-10-26T23:29:54.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Lena', 'Michalska', '680336140', 'l_michalska@gmail.com', '2019-12-25T21:08:57.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Donald', 'Michalski', '560275793', 'd_michalski@gmail.com', '2018-08-28T10:52:34.0000000+02:00', '2019-05-10T11:44:11.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Stefania', 'Mi³orzêbska', '890322456', NULL, '2020-06-22T17:39:47.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Felicja', 'Mróz', '705723811', 'f_mroz@gmail.com', '2018-10-04T06:43:30.0000000+02:00', '2020-05-20T10:37:10.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Mi³osz', 'Mróz', '675958927', 'm_mroz@gmail.com', '2019-06-21T13:30:34.0000000+02:00', '2019-10-06T06:41:00.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Katarzyna', 'Nameless', NULL, 'katarzyna.z.berlina@de.de', '2020-06-22T18:35:26.0000000+02:00', '2020-06-22T18:47:36.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Miko³aj', 'Nowak', '718504526', 'm_nowak@gmail.com', '2018-10-12T15:35:19.0000000+02:00', '2020-03-27T21:55:34.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Leon', 'Nowakowski', '508796685', 'l_nowakowski@gmail.com', '2019-08-08T06:10:43.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Emilia', 'Nowicka', '632914852', 'e_nowicka@yahoo.pl', '2020-07-24T09:23:46.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Edyta', 'Nowicka', '716875276', 'e_nowicka@gmail.com', '2019-05-07T07:13:22.0000000+02:00', '2019-09-20T11:33:32.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Olgierd', 'Nowicki', '530638414', 'o_nowicki@gmail.com', '2019-05-27T05:23:19.0000000+02:00', '2020-01-11T18:03:44.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Zbigniew', 'Opolski', '346544239', 'zbig@op.pl', '2020-06-20T19:56:08.0000000+02:00', '2020-06-22T17:38:46.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Franciszka', 'Ostrowska', '698257033', 'f_ostrowska@gmail.com', '2018-02-21T04:53:09.0000000+02:00', '2018-06-27T19:24:17.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Bogdan', 'Polski', NULL, 'polski@wp.pl', '2020-06-22T17:41:57.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Feliks', 'Qurski', '911912913', 'wrednyfelix@pieszczoch.pl', '2020-06-20T19:56:20.0000000+02:00', '2020-06-22T19:18:30.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Nina', 'Robakowka', '4564329477', 'ninka@spinka.msz.pl', '2020-06-20T19:21:24.0000000+02:00', '2020-06-22T18:49:43.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Klaudia', 'Rutkowska', '659572931', 'k_rutkowska@gmail.com', '2020-11-15T13:55:59.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Zenon', 'Sadowski', '719660029', 'z_sadowski@gmail.com', '2019-05-19T02:05:53.0000000+02:00', '2019-09-20T15:40:23.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Mieczys³aw', 'Sadowski', '698910767', 'm_sadowski@gmail.com', '2020-01-04T03:50:04.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Helena', 'Sawicka', '794289939', 'h_sawicka@gmail.com', '2019-10-26T03:41:23.0000000+02:00', '2020-02-19T15:37:55.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Anita', 'Sikora', '673593096', 'a_sikora@gmail.com', '2020-03-25T10:15:43.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Klaudia', 'Sikorska', '615587078', 'k_sikorska@gmail.com', '2020-04-25T07:28:28.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Eugenia', 'Sikorska', '664962967', 'e_sikorska@gmail.com', '2019-08-23T14:46:59.0000000+02:00', '2020-02-11T09:34:09.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Marta', 'Sikorska', '700955853', 'm_sikorska@gmail.com', '2019-03-27T04:12:27.0000000+02:00', '2020-05-21T15:21:37.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Franek', 'Skórka', '000111342', 'g@g.be', '2020-06-22T16:48:48.0000000+02:00', '2020-06-22T19:19:28.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Daria', 'Soko³owska', '691213385', 'd_sokolowska@gmail.com', '2018-10-26T19:15:07.0000000+02:00', '2019-08-11T18:55:41.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Czes³awa', 'Stêpieñ', '730580843', 'c_stepien@gmail.com', '2020-04-28T12:40:49.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Czes³awa', 'Stêpieñ', '555847760', 'c_stepien@gmail.com', '2018-10-07T04:27:16.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Beata', 'Stêpieñ', '579894194', 'b_stepien@gmail.com', '2018-03-07T14:54:52.0000000+02:00', '2018-03-24T22:58:29.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Sabina', 'Szczepañska', '603526210', 's_szczepanska@gmail.com', '2020-01-18T22:25:26.0000000+02:00', '2020-05-26T19:38:16.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Irmina', 'Szewczyk', '714389872', 'i_szewczyk@gmail.com', '2020-07-17T10:11:33.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Hilary', 'Szewczyk', '671425746', 'h_szewczyk@gmail.com', '2020-06-15T11:48:07.0000000+02:00', '2020-07-04T03:18:03.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Maja', 'Szymañska', '580135135', 'm_szymanska@gmail.com', '2018-11-08T17:56:59.0000000+02:00', '2019-10-12T00:19:59.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Fabian', 'Szymczak', '796447163', 'f_szymczak@gmail.com', '2020-01-26T20:35:38.0000000+02:00', '2020-04-07T18:47:58.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Maksymilian', 'Szymczak', '749463074', 'm_szymczak@gmail.com', '2019-10-18T20:22:46.0000000+02:00', '2020-01-21T15:20:35.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Mieczys³aw', 'Tomaszewski', '589677981', 'm_tomaszewski@gmail.com', '2019-01-15T14:36:55.0000000+02:00', '2019-10-11T20:53:32.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Nina', 'Urbañska', '638259359', 'n_urbanska@tvn.com.pl', '2020-05-14T02:39:25.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Zbig', 'Urwis', '53457656', '2354_2@wp.pl', '2020-06-20T19:56:58.0000000+02:00', '2020-06-22T19:20:02.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Henryk', 'Walczak', '614004679', 'h_walczak@gmail.com', '2019-06-17T15:05:01.0000000+02:00', '2020-02-27T16:48:34.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Jadwiga', 'Wilk', '662347830', 'j_wilk@gmail.com', '2018-01-22T19:11:17.0000000+02:00', '2018-02-17T12:23:07.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Edward', 'Wilk', '756315799', 'e_wilk@gmail.com', '2018-03-04T22:47:24.0000000+02:00', '2019-03-13T17:15:02.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Sara', 'Witkowska', '711725424', 's_witkowska@gmail.com', '2019-07-23T18:38:26.0000000+02:00', '2019-10-13T11:32:34.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Wies³aw', 'Witkowski', '796327989', 'w_witkowski@gmail.com', '2019-01-16T04:03:36.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Roman', 'Witkowski', '746524980', 'r_witkowski@gmail.com', '2020-05-09T04:12:24.0000000+02:00', '2020-05-13T06:08:14.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Teodor', 'Witkowski', '581718874', 't_witkowski@gmail.com', '2020-01-19T13:55:48.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Joachim', 'Wójcik', '720809754', 'j_wojcik@gmail.com', '2019-11-03T19:03:22.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Emil', 'Wójcik', '741933458', 'e_wojcik@gmail.com', '2020-04-14T12:54:56.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Iwona', 'Wróbel', '706385766', 'i_wrobel@gmail.com', '2019-01-05T17:55:34.0000000+02:00', '2019-05-27T00:20:36.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Urszula', 'Wróblewska', '516370734', 'u_wroblewska@gmail.com', '2018-09-10T17:13:56.0000000+02:00', '2019-11-20T02:59:49.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Aleksy', 'Wróblewski', '584017302', 'a_wroblewski@gmail.com', '2019-02-11T22:54:39.0000000+02:00', '2019-09-16T21:07:55.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Bogumi³', 'Wysocki', '563152705', 'b_wysocki@gmail.com', '2018-11-27T16:18:21.0000000+02:00', '2019-02-21T11:19:07.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Joanna', 'Zaj¹c', '520116683', 'j_zajac@gmail.com', '2017-12-16T07:45:50.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Marianna', 'Zakrzewska', '719989682', 'm_zakrzewska@gmail.com', '2019-04-12T09:02:09.0000000+02:00', '2020-02-21T05:35:42.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Piotr', 'Zakrzewski', '618005389', 'p_zakrzewski@gmail.com', '2020-07-14T14:53:02.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Krystian', 'Zakrzewski', '681728731', 'k_zakrzewski@gmail.com', '2018-11-10T17:34:52.0000000+02:00', '2019-07-28T17:46:19.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Józef', 'Zalewski', '610129805', 'j_zalewski@gmail.com', '2020-01-02T23:33:48.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Dominika', 'Zawadzka', '691370454', 'd_zawadzka@gmail.com', '2018-03-13T02:04:38.0000000+02:00', '2019-10-15T01:48:16.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Bart³omiej', 'Zawadzki', '655326484', 'b_zawadzki@gmail.com', '2020-06-23T10:10:44.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Piotr', 'Zawadzki', '502025974', 'p_zawadzki@gmail.com', '2018-05-02T06:14:30.0000000+02:00', '2019-01-25T21:16:53.0000000+02:00');
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Michalina', 'Zió³kowska', '634831877', 'm_ziolkowska@gmail.com', '2018-05-28T07:13:30.0000000+02:00', NULL);
insert into People (FirstName, LastName, Phone, Email, Created, Updated) values('Lucjan', 'Zió³kowski', '751456621', 'l_ziolkowski@gmail.com', '2019-09-03T21:25:54.0000000+02:00', NULL);
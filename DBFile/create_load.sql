/*==============================================================*/
/* DBMS name:		SQLite3 DB									*/
/* Created on:		2014/6/27/									*/
/*==============================================================*/

drop table if exists Events;

drop table if exists Schedule;

/*==============================================================*/
/* Table: Events												*/
/*==============================================================*/
create table Events
(
	EventID				INTEGER		primary key autoincrement	not null,
	EventName			VARCHAR(20),
	EventIcon			VARCHAR(20),
	KeyInfo				CLOB,
	BasicsInfo			CLOB,
	OlympicInfo		CLOB
);


/*==============================================================*/
/* Table: Schedule												*/
/*==============================================================*/
create table Schedule
(
	ScheduleID			INTEGER		primary key autoincrement	not null,
	GameDate			DATE					not null,
	GameTime			VARCHAR(20)				not null,
	GameInfo			VARCHAR(50),
	EventID				INTEGER,
	constraint FK_SCHEDULE_REFERENCE_EVENTS foreign key (EventID) references Events (EventID)
	
);


insert into Events(EventName,EventIcon,KeyInfo,BasicsInfo,OlympicInfo) values ('Archery','archery.gif','Archery dates back around 10,000 years, when bows and arrows were first used for hunting and warfare, before it developed as a competitive activity in medieval England. A tense and testing sport that requires immense reserves of skill and nerve, Archery is now practised in more than 140 countries around the world.','The object of the sport is simple: to shoot arrows as close to the centre of a target as possible. Olympic Archery targets are 122 centimetres in diameter, with the gold ring at the centre (worth a maximum 10 points) measuring just 12.2cm. Archers shoot at the target from a distance of 70 metres. At the Olympic Games, the two individual Archery competitions (one for men, one for women) will be played in a knockout format. Matches will be played over the best of five sets, with each set consisting of three arrows per archer. The winners of each match will qualify for the next round, until the last two archers go head to head in the gold medal match. A knockout format will also be used for the men’s and women’s team competitions, which features teams of three archers competing against each other in a best-of-24-arrows format.','Archery made its Olympic debut at Paris 1900, was dropped from the programme after the 1908 Games, and then returned for a single appearance in 1920. After a 52-year gap, the sport was reintroduced at Munich 1972 and has remained on the Olympic programme ever since. For London 2016, the Archery competition will connect the old with the new at Lord’s Cricket Ground. During the knockout phase, archers will shoot from in front of the 19th-century Pavilion across the hallowed cricket square towards the modern Media Centre.');  

insert into Schedule (GameDate,GameTime,GameInfo,EventID) values 
	('2012-08-25','16:00-20:45','Women's',28)
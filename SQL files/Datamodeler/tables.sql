-- Creado por Yanil, Alexis, Gabriela
--   en:        2015-10-25 17:23:21 
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g


CREATE TABLE Continent
  (
    continentID   NUMBER (5) NOT NULL ,
    continentName VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE Continent ADD CONSTRAINT Continent_PK PRIMARY KEY ( continentID ) ;

-------------------------------------------------------------------------------

CREATE TABLE CountryCatalog
  (
    countryID             varchar2 (3) NOT NULL ,
    countryName           VARCHAR2 (30) NOT NULL ,
    continentID           NUMBER (5) NOT NULL
  ) ;
ALTER TABLE CountryCatalog ADD CONSTRAINT CountryCatalog_PK PRIMARY KEY ( countryID ) ;

-------------------------------------------------------------------------------

CREATE TABLE CityCatalog
  (
    cityID                   NUMBER (5) NOT NULL ,
    cityName                 VARCHAR2 (30) NOT NULL ,
    countryID                varchar2 (3) NOT NULL 
  ) ;
  
ALTER TABLE CityCatalog ADD CONSTRAINT CityCatalog_PK PRIMARY KEY ( cityID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Event
  (
    eventID              NUMBER (5) NOT NULL ,
    eventDescription     VARCHAR2 (300) NOT NULL ,
    startDate            DATE NOT NULL ,
    endDate              DATE NOT NULL ,
    countTeams           NUMBER (2) NOT NULL
  ) ;
ALTER TABLE Event ADD CONSTRAINT Event_PK PRIMARY KEY ( eventID ) ;

-------------------------------------------------------------------------------

CREATE TABLE EventCatalog
  (
    eventID   NUMBER (5) NOT NULL ,
    eventName VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE EventCatalog ADD CONSTRAINT EventCatalog_PK PRIMARY KEY ( eventID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Game
  (
    gameID  NUMBER (5) NOT NULL ,
    team1ID NUMBER (5) NOT NULL ,
    team2ID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE Game ADD CONSTRAINT Game_PK PRIMARY KEY ( gameID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Grupo
  (
    groupID NUMBER (5) NOT NULL ,
    groupName    VARCHAR2 (30) NOT NULL
  ) ;
ALTER TABLE Grupo ADD CONSTRAINT Group_PK PRIMARY KEY ( groupID ) ;

-------------------------------------------------------------------------------

CREATE TABLE LineupByTeam
  (
    teamID            NUMBER (5) NOT NULL ,
    lineupID          NUMBER (5) NOT NULL
  ) ;
ALTER TABLE LineupByTeam ADD CONSTRAINT LineupByTeam__IDX PRIMARY KEY ( teamID, lineupID ) ;

-------------------------------------------------------------------------------

CREATE TABLE LineupCatalog
  (
    lineupID   NUMBER (5) NOT NULL ,
    goalKeeper NUMBER (2) ,
    defender   NUMBER (2) ,
    midfield   NUMBER (2) ,
    lineForward    NUMBER (2) --palabra reservada forward
  ) ;
ALTER TABLE LineupCatalog ADD CONSTRAINT LineupCatalog_PK PRIMARY KEY ( lineupID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Player
  (
    DNI             VARCHAR2 (30) NOT NULL ,
    firstName       VARCHAR2 (30) NOT NULL ,
    lastName1       VARCHAR2 (30) NOT NULL ,
    lastName2       VARCHAR2 (30) ,
    clubTshirt      NUMBER (2) ,
    selectionTshirt NUMBER (2) ,
    Picture         VARCHAR2 (300)
  ) ;
ALTER TABLE Player ADD CONSTRAINT Player_PK PRIMARY KEY ( DNI ) ;

-------------------------------------------------------------------------------

CREATE TABLE PlayerByTeam
  (
    DNI  VARCHAR2 (30) NOT NULL ,
    teamID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE PlayerByTeam ADD CONSTRAINT PlayerByTeam__IDX PRIMARY KEY ( DNI, teamID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Stadium
  (
    stadiumID    NUMBER (5) NOT NULL ,
    stadiumName  VARCHAR2 (30) NOT NULL ,
    capacity     NUMBER (6) NOT NULL ,
    picture      VARCHAR2 (300)
    
  ) ;
ALTER TABLE Stadium ADD CONSTRAINT Stadium_PK PRIMARY KEY ( stadiumID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Tstatistic    --palabra reservada statistic
  (
    StatisticID     NUMBER (5) NOT NULL ,
    played          NUMBER (2) NOT NULL ,
    won             NUMBER (2) NOT NULL ,
    draw            NUMBER (2) NOT NULL ,
    lost            NUMBER (2) NOT NULL ,
    goalsFor        NUMBER (2) NOT NULL ,
    goalsAgainst    NUMBER (2) NOT NULL ,
    goalsDifference NUMBER (2) NOT NULL ,
    fairPlayPoints  NUMBER NOT NULL
  ) ;
ALTER TABLE Tstatistic ADD CONSTRAINT Statistic_PK PRIMARY KEY ( StatisticID ) ;

-------------------------------------------------------------------------------

CREATE TABLE StatisticByGroup
  (
    groupID       NUMBER (5) NOT NULL ,
    StatisticID  NUMBER (5) NOT NULL
  ) ;
ALTER TABLE StatisticByGroup ADD CONSTRAINT StatisticByGroup__IDX PRIMARY KEY ( groupID, StatisticID ) ;

-------------------------------------------------------------------------------

CREATE TABLE Team
  (
    teamID             NUMBER (5) NOT NULL ,
    teamName           VARCHAR2 (100) NOT NULL ,
    captainID          NUMBER (5) NOT NULL ,
    flagPath           NUMBER (5) NOT NULL ,
    logoPath           NUMBER (5) ,
    cityID             NUMBER (5) NOT NULL ,
    tdID               NUMBER (5) NOT NULL ,
   groupID             NUMBER (5) NOT NULL
  ) ;
  

  ALTER TABLE Team ADD CONSTRAINT Team_PK PRIMARY KEY ( teamID ) ;
  
-------------------------------------------------------------------------------

CREATE TABLE TeamByEvent
  (
    teamID  NUMBER (5) NOT NULL ,
    eventID NUMBER (5) NOT NULL
  ) ;
ALTER TABLE TeamByEvent ADD CONSTRAINT TeamByEvent__IDX PRIMARY KEY ( teamID, eventID ) ;

-------------------------------------------------------------------------------

CREATE TABLE TeamByGame
  (
    gameID       NUMBER (5) NOT NULL ,
    teamID       NUMBER (5) NOT NULL ,
    goals        NUMBER (2) NOT NULL ,
    yellowCard   NUMBER (2) NOT NULL ,
    redCard      NUMBER (2) NOT NULL ,
    corners      NUMBER (2) NOT NULL ,
    offside      NUMBER (2) NOT NULL ,
    dateTime     DATE NOT NULL ,
    stadiumID    NUMBER (5) NOT NULL
  ) ;
ALTER TABLE TeamByGame ADD CONSTRAINT TeamByGame_PK PRIMARY KEY (gameID, teamID ) ;

-------------------------------------------------------------------------------

CREATE TABLE tdCatalog
  (
    tdID          NUMBER (5) NOT NULL ,
    tdFirstName   VARCHAR2 (30) NOT NULL ,
    tdLastName1   VARCHAR2 (30) NOT NULL ,
    tdLastName2   VARCHAR2 (30) ,
    tdNacionality VARCHAR2 (30)
  ) ;
  
ALTER TABLE tdCatalog ADD CONSTRAINT tdCatalog_PK PRIMARY KEY ( tdID ) ;

-------------------------------------------------------------------------------


ALTER TABLE CityCatalog ADD CONSTRAINT CountryCatalog_FK FOREIGN KEY ( countryID ) REFERENCES CountryCatalog ( countryID ) ;

ALTER TABLE CountryCatalog ADD CONSTRAINT Continent_FK FOREIGN KEY (continentID ) REFERENCES Continent ( continentID ) ;

ALTER TABLE Event ADD CONSTRAINT EventCatalog_FK FOREIGN KEY ( eventID ) REFERENCES EventCatalog ( eventID ) ;

ALTER TABLE TeamByEvent ADD CONSTRAINT team_FK FOREIGN KEY ( teamID ) REFERENCES Team ( teamID ) ;

ALTER TABLE TeamByEvent ADD CONSTRAINT event_FK FOREIGN KEY ( eventID ) REFERENCES Event ( eventID ) ;

ALTER TABLE PlayerByTeam ADD CONSTRAINT PlayerByTeam_Team_FK FOREIGN KEY ( teamID ) REFERENCES Team ( teamID ) ;

ALTER TABLE PlayerByTeam ADD CONSTRAINT PlayerByTeam_Player_FK FOREIGN KEY ( DNI ) REFERENCES Player ( DNI ) ;

ALTER TABLE StatisticByGroup ADD CONSTRAINT GroupID_FK FOREIGN KEY (groupID ) REFERENCES grupo ( groupID ) ;

ALTER TABLE StatisticByGroup ADD CONSTRAINT StatisticID_FK FOREIGN KEY ( StatisticID ) REFERENCES Tstatistic ( StatisticID ) ;

ALTER TABLE LineupByTeam ADD CONSTRAINT teamID_FK FOREIGN KEY ( teamID ) REFERENCES Team ( teamID ) ;

ALTER TABLE LineupByTeam ADD CONSTRAINT lineupID_FK FOREIGN KEY ( lineupID ) REFERENCES LineupCatalog ( lineupID ) ;

ALTER TABLE TeamByGame ADD CONSTRAINT gameID_FK FOREIGN KEY ( gameID ) REFERENCES Game ( gameID ) ;

ALTER TABLE TeamByGame ADD CONSTRAINT stadiumID_FK FOREIGN KEY (stadiumID ) REFERENCES Stadium ( stadiumID ) ;

ALTER TABLE TeamByGame ADD CONSTRAINT TeamByGame_teamID_FK FOREIGN KEY ( teamID ) REFERENCES Team ( teamID ) ;

ALTER TABLE Team ADD CONSTRAINT cityID_FK FOREIGN KEY ( cityID ) REFERENCES CityCatalog ( cityID ) ;

ALTER TABLE Team ADD CONSTRAINT Team_GroupID_FK FOREIGN KEY ( groupID ) REFERENCES grupo ( groupID ) ;

ALTER TABLE Team ADD CONSTRAINT Team_tdCatalog_FK FOREIGN KEY ( tdID ) REFERENCES tdCatalog ( tdID ) ;

-------------------------------------------------------------------------------



















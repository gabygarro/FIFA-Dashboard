CREATE OR REPLACE PACKAGE BODY get AS
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
procedure TeamID (pTeamName varchar2, pTeamID  out number) as
 -- Gets all team  that ptype and return the names in the sys_refcursor.
       BEGIN
         
         select max(t.teamid) into pTeamID
         from team t;
         --where t.teamtypeid = ptype
         
         
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('TeamID no found:');
       END;
-------------------------------------------------------------------------------
procedure Clubs ( pClub  out sys_refcursor) as
 -- Gets all team  that pClub and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pClub for
         select t.teamid as typeNameID, t.teamname as typeName
         from team t
         where t.teamtypeid = 2
         order by typeName;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;
-------------------------------------------------------------------------------
procedure Selections ( pSelection  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pSelection for
         select t.teamid as typeNameID, t.teamname as typeName
         from team t
         where t.teamtypeid = 1
         order by typeName;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;
-------------------------------------------------------------------------------

procedure playerbyselection (pSelectionID in number, pPlayerID out sys_refcursor) as
  -- Gets all players  that pSelectionID and return the ids and names in the sys_refcursor.
begin
  open pPlayerID for
  select p.dni as typeNameID, p.firstname  || ' '  || p.lastname1 || ' '  || p.lastname2  as typeName
  from  player p, team t, citycatalog c
  where t.teamid = pSelectionID and t.cityid = c.cityid and c.countryid =  p.countryid;
  Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Players no found:');

end ;

       
-------------------------------------------------------------------------------

procedure stadiumID (pStadiumID  out number) as
 -- Gets all team  that ptype and return the names in the sys_refcursor.
       BEGIN
         
         select max(s.stadiumid) into pStadiumID
         from stadiumcatalog s;
         --where t.teamtypeid = ptype
         
         
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('StadiumID no found:');
       END;
-------------------------------------------------------------------------------
 procedure TDID (pTdID  out number) as
 -- Gets all team  that ptype and return the names in the sys_refcursor.
       BEGIN
         
         select max(t.tdid) into pTdID
         from tdcatalog t;
         --where t.teamtypeid = ptype
         
         
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('StadiumID no found:');
       END;
-------------------------------------------------------------------------------
procedure teams ( pTeams  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pTeams for
          select  t.teamid as teamID,
                  t.teamname as teamname,
                  c.cityname as city,
                  cc.countryname as country,
                  t.logopath as logo,
                  t.flagpath as flag,
                  tt.teamtypename as teamtype
                  --tc.tdfirstname||' '||tc.tdlastname1||' '||tc.tdlastname2 as TDName          
         from team t, citycatalog c, countrycatalog cc, teamtypecatalog tt--, tdcatalog tc
         where t.cityid = c.cityid and c.countryid = cc.countryid and tt.teamtypeid = t.teamtypeid --and  t.tdid = tc.tdid
         order by teamtype,teamname;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------
procedure PlayersByTeam (pTeamID in number, pPlayerbyTeams  out sys_refcursor) as
 -- Gets all players de pTeamID team  and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pPlayerbyTeams for
         select p.dni as typeNameID, p.firstname|| ' '||p.lastname1 || ' '||p.lastname2 as typename
         from player p, playerbyteam pt
         where p.dni = pt.playerdni and pt.teamid = pTeamID 
          order by typename;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     

-------------------------------------------------------------------------------
procedure team ( pteamID number, pTeam  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pTeam for
          select  t.teamid as teamID,
                  t.teamname as teamname,
                  t.captainid as captain,
                  t.cityid as city,
                  t.tdid as td,
                  t.teamtypeid as teamtype               
         from team t
         where t.teamid = pteamID;
         --order by teamtype,teamname;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     

-------------------------------------------------------------------------------
procedure Player (pDNI varchar2, pPlayer  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pPlayer for
          select  p.dni as playerID,
                  p.firstname as fname,
                  p.lastname1 as lname1,
                  p.lastname2 as lname2,
                  p.clubtshirt as clubshirt,
                  p.selectiontshirt as selectionshirt,
                  p.picture as picture,
                  p.clubcaptain as clubcaptain,
                  p.selectioncaptain as selectioncaptain,
                 p.countryid as country       
         from player p
         where  p.dni = pDNI;
         
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------
procedure Players ( pPlayers  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pPlayers for
          select  p.dni as playerID,
                  p.firstname||' '||p.lastname1||' '||p.lastname2 as playername,
                  p.clubtshirt as clubshirt,
                  p.selectiontshirt as selectionshirt,
                  p.picture as picture,
                  p.clubcaptain as clubcaptain,
                  p.selectioncaptain as selectioncaptain,
                  cc.countryname as country       
         from player p, countrycatalog cc
         where  p.countryid = cc.countryid
         order by country,playername;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------
procedure getevents ( pEvents  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pEvents for
          select  t.eventid as typenameid,
                  t.eventname as typeName,
                  t.eventdescription,
                  t.startdate,
                  t.enddate,
               cc.countryname as country,
               t.picture as picture
         from event t, countrycatalog cc
         where t.countryid = cc.countryid
         order by startdate;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------
procedure eventTeam (peventID number, pEvents  out sys_refcursor) as
 -- Gets all team  that pSelection and return the ids and names in the sys_refcursor.
       BEGIN
         
        open pEvents for
          select  t.teamid as typenameid,
                  t.teamname as typeName,
                  p.firstname||' '||p.lastname1||' '||p.lastname2 as captain,
                  t.flagpath as flag,
                  t.logopath as logo,
                  c.cityname as city,
                 cc.countryname as country,
                  td.tdfirstname||' '||td.tdlastname1||' '||td.tdlastname2 as td,
                  t.teamtypeid as teamtype
         from team t, teambyevent te, player p, citycatalog c,countrycatalog cc, tdcatalog td
         where te.teamid = t.teamid and te.eventid = 2 and p.dni = t.captainid and t.cityid = c.cityid and c.countryid = cc.countryid and td.tdid=t.tdid
         order by typeName;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------

procedure gamesByEvent (pEventID in number, pGameID out sys_refcursor) as
  -- Gets all players  that pSelectionID and return the ids and names in the sys_refcursor.
begin
  open pGameID for
  select  g.eventid || '-'  ||  g.bracketpos as TypeNameID, 'Game no. ' || g.bracketpos || ' ' || t1.teamname || ' vs ' || t2.teamname as TYPENAME
  from  team t1, team t2, game g
  where pEventID = g.eventid and g.team1id=t1.teamid and g.team2id=t2.teamid;
  Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Players no found:');

end ;

       
-------------------------------------------------------------------------------
procedure TeamsBygame (pID in varchar2, pteamsbygame out sys_refcursor) as
  -- Gets all players  that pSelectionID and return the ids and names in the sys_refcursor.
begin
  open pteamsbygame for
  
  select  g.team1id as typenameid, 
          t.teamname as typename
  from    game g, team t
  where t.teamid = g.team1id and pID = g.eventid || '-' || g.bracketpos
  UNION
  select  g.team2id as typenameid, 
          t.teamname as typename
  from    game g, team t
  where t.teamid = g.team2id and pID = g.eventid || '-' || g.bracketpos;
  Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Players no found:');

end ;

-------------------------------------------------------------------------------
procedure games ( pgames out sys_refcursor) as
  -- Gets all players  that pSelectionID and return the ids and names in the sys_refcursor.
begin
  open pgames for
  
  select  g.eventid || '-'  ||  g.bracketpos as TypeNameID, 
  'Game no. ' || g.bracketpos || ' ' || t1.teamname || ' vs ' || t2.teamname as TYPENAME
  from  team t1, team t2,  game g
  where t1.teamid = g.team1id and t2.teamid = g.team2id;
  
  Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Players no found:');

end ;

-------------------------------------------------------------------------------
procedure EventID ( peventID  out number) as
 -- Gets all team  that ptype and return the names in the sys_refcursor.
       BEGIN
         
         select max(e.eventid) into peventID
         from event e;
         --where t.teamtypeid = ptype
         
         
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('TeamID no found:');
       END;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
   
END get;

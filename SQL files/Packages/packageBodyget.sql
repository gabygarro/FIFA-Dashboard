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
         select t.teamid as teamID, t.teamname as teamname,
                c.cityname as city, cc.countryname as country,
                t.logopath as logo, t.flagpath as flag,
                tt.teamtypename as teamtype          
         from team t, citycatalog c, countrycatalog cc, teamtypecatalog tt
         where t.cityid = c.cityid and c.countryid = cc.countryid and tt.teamtypeid = t.teamtypeid 
         order by teamtype,teamname;
         Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Catalog no found:');
       END;     
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
   
END get;

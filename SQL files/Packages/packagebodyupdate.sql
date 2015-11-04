CREATE OR REPLACE PACKAGE BODY updates AS
-------------------------------------------------------------------------------

procedure flag (pTeamID number, pflagpath varchar2)
  --update the column flagpath on the table team using the parameter pflagpath
as
       BEGIN        
           UPDATE Team t
           SET t.flagpath = pflagpath
           WHERE pTeamID = t.teamid;
         
        Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Team no found:' || pTeamID);
         commit;

       END;
       
-------------------------------------------------------------------------------

procedure logo (pTeamID number, pLogoPath varchar2)
  --update the column logopath on the table team using the parameter plogopath
as
       BEGIN        
           UPDATE Team t
           SET t.logopath = pLogoPath
           WHERE pTeamID = t.teamid;
         
        Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Team no found:' || pTeamID);
         commit;

       END;
       
-------------------------------------------------------------------------------
procedure playerPicture (pPlayerID number, pPicture varchar2)
  --update the column logopath on the table team using the parameter plogopath
as
       BEGIN        
           UPDATE Player p
           SET p.picture = pPicture
           WHERE pplayerID = p.dni;
         
        Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Team no found:' || pPlayerID);
         commit;

       END;
-------------------------------------------------------------------------------

procedure stadiumPicture (pStadiumID number, pPicture varchar2)
  --update the column picture on the table stadium using the parameter pStadiumID
as
       BEGIN        
           UPDATE stadiumcatalog s
           SET s.picture = pPicture
           WHERE pStadiumID = s.stadiumid;
         
        Exception
         WHEN NO_DATA_FOUND THEN
              DBMS_OUTPUT.PUT_LINE ('Stadium no update:' || pStadiumID);
         commit;

       END;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
       



   -- SET Birthday = to_date(pBirthday,'DD/MM/YYYY')
           

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------



END updates;

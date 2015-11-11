CREATE OR REPLACE PACKAGE BODY inserts AS
-------------------------------------------------------------------------------

procedure userAdministrator ( pUserEmail varchar2, pusernamepassword varchar2)
as
       BEGIN
         insert into useradmin (userID,useremail,usernamepassword)
         values(adminID_seq.NextVal,pUserEmail,pusernamepassword);

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;

       END;
       
-------------------------------------------------------------------------------
procedure event ( pEventName varchar2, pdescription varchar2, pstartdate date, penddate date, pmaxteams number, pcountry varchar2)
as
       BEGIN
         insert into event (eventID,eventdescription,startdate,enddate,maxteams,countryID, eventname)
         values(eventID_seq.NextVal,pdescription,to_date(pstartdate,'DD/MM/YYYY'),to_date(penddate,'DD/MM/YYYY'),pmaxteams,pcountry,pEventName);

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert event error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
        

       END;
       
-------------------------------------------------------------------------------
procedure team ( pteamName varchar2, pCaptainID number, pflagpath varchar2, plogopath varchar2,pcityid number,
               ptdid number, pteamtypeid number)
as
       BEGIN
        
         insert into team (teamID,teamname,captainid,flagpath,logopath,cityid,tdid,teamtypeid)
         values(teamID_seq.NextVal, pteamName, pCaptainID, pflagpath, plogopath, pcityid, ptdid, pteamtypeid);
         

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert Team error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
                 
       END;
       
-------------------------------------------------------------------------------

procedure player ( pDNI varchar2, pFirstName varchar2, pLastName1 varchar2, pLastName2 varchar2, pClubTshirt number,
               pSelectionTshirt number, pclubCaptain number,pselectionCaptain number,pcountryID varchar2)
as
       BEGIN
         insert into player (DNI,firstname,lastname1,lastname2,clubtshirt,selectiontshirt,clubcaptain,selectioncaptain,countryid)
         values(pDNI , pFirstName , pLastName1 , pLastName2 , pClubTshirt ,
               pSelectionTshirt , pclubCaptain,pselectionCaptain,pcountryID );

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert player error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;

       END;

-------------------------------------------------------------------------------
procedure PlayerbyTeam ( pteamID number, pplayerDNI varchar2)
as
       BEGIN
        
         insert into Playerbyteam (playerDNI,Teamid)
         values(pplayerDNI,pteamID); 

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert PlayerbyTeam error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
                 
       END;
  
-------------------------------------------------------------------------------

procedure stadium ( pstadiumname varchar2, pgooglemapsid varchar2, pcapacity number, pcityid number)
as
       BEGIN
        
         insert into stadiumcatalog (stadiumid,stadiumname,googlemapsid,capacity,cityid)
         values(stadiumid_seq.nextval, pstadiumname , pgooglemapsid , pcapacity , pcityid ); 

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert stadium error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
                 
       END; 
-------------------------------------------------------------------------------
procedure Td ( pTdfirstname varchar2, pTdlastname1 varchar2, pTdlastname2 varchar2, pTdcounrtyid varchar2)
as
       BEGIN
         insert into Tdcatalog(Tdid, Tdfirstname, Tdlastname1, Tdlastname2, Tdcounrtyid )
         values(TDID_seq.NextVal, pTdfirstname, pTdlastname1, pTdlastname2, pTdcounrtyid );

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;

       END;
-------------------------------------------------------------------------------
procedure TeambyEvent ( peventID number, pteamID number)
as
       BEGIN
        
         insert into TeambyEvent (Teamid,Eventid)
         values(pteamID,peventID); 

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert PlayerbyTeam error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
                 
       END;
  
-------------------------------------------------------------------------------
procedure game (pteam1id number, pteam2id number, pstadiumid number,
                pgamedate date, peventid number,  pbracketpos number,
                phours number, pminutes number)
as
       BEGIN
        
         insert into game (team1id,team2id,stadiumid,gamedate,eventid,bracketpos,hours,minutes)
         values(pteam1id, pteam2id, pstadiumid, to_date(pgamedate,'DD/MM/YYYY'), peventid,  pbracketpos, phours, pminutes); 

        Exception
         WHEN VALUE_ERROR THEN
              DBMS_OUTPUT.PUT_LINE ('Insert PlayerbyTeam error ');
         WHEN OTHERS THEN
              DBMS_OUTPUT.PUT_LINE ('Unexpected error');
              RAISE;
         commit;
         
                 
       END;
  
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

END inserts;

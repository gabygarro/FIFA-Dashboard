create or replace package inserts is
-------------------------------------------------------------------------------

procedure userAdministrator ( pUserEmail varchar2, pusernamepassword varchar2);
procedure event ( pdescription varchar2, pstartdate date,penddate date, pmaxteams number, pcountry number);


-------------------------------------------------------------------------------
END inserts;

create or replace package updates is

procedure flag (pTeamID number, pflagpath varchar2);

procedure logo (pTeamID number, pLogoPath varchar2);

procedure playerPicture (pPlayerID number, pPicture varchar2);

procedure stadiumPicture (pStadiumID number, pPicture varchar2);

END updates;

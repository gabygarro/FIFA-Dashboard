
create or replace trigger beforeInsert_event
       before insert
       on bitacora for each row
begin
  :new.bitacoraID :=bitacoraID_seq.Nextval;
  :new.userName:=user;
  :new.date_Time:= sysdate;
  :new.action:='Insert';
  :new.descrip:='Insert a new event'; 
end;
------------------------------------------------------------------------
create or replace trigger beforeInsert_game
       before insert
       on bitacora for each row
begin
  :new.bitacoraID :=bitacoraID_seq.Nextval;
  :new.userName:=user;
  :new.date_Time:= sysdate;
  :new.action:='Insert';
  :new.descrip:='Insert a new game'; 
  commit;
end;

------------------------------------------------------------------------
create or replace trigger beforeInsert_game
       before insert
       on bitacora for each row
begin
  :new.bitacoraID :=bitacoraID_seq.Nextval;
  :new.userName:=user;
  :new.date_Time:= sysdate;
  :new.action:='Insert';
  :new.descrip:='Insert a new game'; 
    commit;
end;
------------------------------------------------------------------------
create or replace trigger beforeInsert_team
       before insert
       on Team for each row
begin
     INSERT INTO bitacora(bitacoraid,username,date_time,action,descrip)
     VALUES (bitacoraID_seq.Nextval,user,sysdate,'Insert','Inserting new Event');
end;

------------------------------------------------------------------------------
------------------------------------------------------------------------------

create or replace trigger beforeInsert_team
       before insert of teamName on Team for each row
BEGIN
  IF INSERTING THEN
    INSERT INTO bitacora(bitacoraid,username,date_time,action,descrip)
    VALUES (bitacoraID_seq.Nextval,USER,date,'Insert','Inserting new Event' ||
    --' new key: ' || :new.key);
  ELSIF DELETING THEN
    INSERT INTO bitacora(bitacoraid,username,date_time,action,descrip)
    VALUES (bitacoraID_seq.Nextval,USER,date,'Delete','Deleting new Event' ||
 
  END IF;
END;
------------------------------------------------------------------------------
------------------------------------------------------------------------------








create or replace trigger beforeInsert_department
       before insert
       on ge.department for each row
begin
  :new.Usuario_creacion:=user;
  :new.Fec_creacion:= sysdate;
end;

create or replace trigger beforeUpDate_employee
       before UpDate
       on ge.employee for each row
begin
  :new.Usuario_ultima_modificacion:=user;
  :new.Fecha_ultima_modificacion:= sysdate;
end;


create or replace trigger beforeUpDate_department
       before UpDate
       on ge.department for each row
begin
  :new.Usuario_ultima_modificacion:=user;
  :new.Fecha_ultima_modificacion:= sysdate;
end;
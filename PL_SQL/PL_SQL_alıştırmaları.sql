--1
SET SERVEROUTPUT ON
DECLARE 
  year NUMBER(4):=&p_num;
BEGIN
  IF MOD(year,4)=0 and MOD(year,100)!=0 THEN
    DBMS_OUTPUT.PUT_LINE('Artık Yıl!');
  ELSIF MOD(year,100)=0 THEN
    DBMS_OUTPUT.PUT_LINE('Artık Yıl Degil!');
  ELSIF MOD(year,400)=0 THEN
    DBMS_OUTPUT.PUT_LINE('Artık Yıl!');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Artık Yıl Degil!');
  END IF;
END;
/  




--2
SET SERVEROUTPUT ON
DECLARE
  v_output VARCHAR2(100);
BEGIN
  FOR i IN 1..10 LOOP
    IF MOD(i, 2) = 1 THEN
      v_output := TO_CHAR(i);
      DBMS_OUTPUT.PUT_LINE(v_output);
    END IF;
  END LOOP;
END;
/  




--3
SET SERVEROUTPUT ON
DECLARE
  v_output VARCHAR2(100);
BEGIN
  FOR i IN REVERSE 1..10 LOOP
    v_output := TO_CHAR(i);
    DBMS_OUTPUT.PUT_LINE(v_output);
  END LOOP;
END;
/




--4
CREATE TABLE ITEM(ItemNum NUMBER);
DECLARE
  i NUMBER;
BEGIN
  FOR i IN 1..5 LOOP
    INSERT INTO ITEM VALUES(i);
  END LOOP;
END;
/ 
SELECT * FROM ITEM;




--5
SET SERVEROUTPUT ON
DECLARE 
  x NUMBER(2):=&p_num;
  v_count NUMBER;
  p_count NUMBER;

BEGIN
  v_count := 1;
  WHILE v_count<=x LOOP
    p_count := 1;
    WHILE p_count<=x LOOP
    
      DBMS_OUTPUT.PUT_LINE(p_count*v_count);
	p_count:=p_count+1;
 
    END LOOP;
    v_count:=v_count+1; 
  END LOOP;
END;
/




--6
SET SERVEROUTPUT ON
DECLARE
  month NUMBER(2):=&m_num;
  year NUMBER(4) :=&y_num;
BEGIN
  IF month=1 THEN
    DBMS_OUTPUT.PUT_LINE('31');
  
  ELSIF month=2 THEN
    IF MOD(year,4)=0 and MOD(year,100)!=0 THEN
      DBMS_OUTPUT.PUT_LINE('29');
    ELSIF MOD(year,100)=0 THEN
      DBMS_OUTPUT.PUT_LINE('28');
    ELSIF MOD(year,400)=0 THEN
      DBMS_OUTPUT.PUT_LINE('29');
    ELSE
      DBMS_OUTPUT.PUT_LINE('28');
    END IF;
  
  ELSIF month=3 THEN
    DBMS_OUTPUT.PUT_LINE('31');

  ELSIF month=4 THEN
    DBMS_OUTPUT.PUT_LINE('30');

  ELSIF month=5 THEN
    DBMS_OUTPUT.PUT_LINE('31');

  ELSIF month=6 THEN
    DBMS_OUTPUT.PUT_LINE('30');

  ELSIF month=7 THEN
    DBMS_OUTPUT.PUT_LINE('31');

  ELSIF month=8 THEN
    DBMS_OUTPUT.PUT_LINE('31');

  ELSIF month=9 THEN
    DBMS_OUTPUT.PUT_LINE('30');

  ELSIF month=10 THEN
    DBMS_OUTPUT.PUT_LINE('31');

  ELSIF month=11 THEN
    DBMS_OUTPUT.PUT_LINE('30');

  ELSIF month=12 THEN
    DBMS_OUTPUT.PUT_LINE('31');
  END IF;
END;
/




--7

BEGIN
  DELETE FROM ITEM
  WHERE ItemNum=4;
  
  COMMIT;
END;
/




--8
SET SERVEROUTPUT ON
DECLARE
  AD VARCHAR(10);
  SOYAD VARCHAR(10);
  MAAS NUMBER(5);
  KOMISYON NUMBER(5);
  NITELIK VARCHAR(50);

BEGIN
  AD :='&FNAME';
  SOYAD:='&LNAME';
  MAAS:=&SALARY;
  KOMISYON:=&COM;
  NITELIK:='&QUAL';

  DBMS_OUTPUT.PUT_LINE(TO_CHAR(AD)||' '||TO_CHAR(SOYAD)||' '||TO_CHAR(NITELIK)||' '||TO_CHAR(MAAS+KOMISYON));

END;
/

CREATE OR REPLACE PROCEDURE SMIS.PC_BILL_SIGN_UPDATE(PEMP_CODE VARCHAR2,PEMP_SIGN VARCHAR2 DEFAULT NULL,
PREV_PEMP_SIGN VARCHAR2 DEFAULT NULL)  IS
CURSOR C1 IS

SELECT PC_SLNO,FORM_OBJ_CODE,SIGN_OBJ_CODE,EMP_CODE_SIGN FROM PC_SIGN_EMP_TRNS
WHERE 
SIGN_OBJ_CODE = PEMP_SIGN
AND
EMP_CODE_SIGN=PEMP_CODE
AND
SIGN_OBJ_CODE = PREV_PEMP_SIGN
AND
EMP_CODE_SIGN  = 'XXXX'
AND 
FORM_OBJ_CODE ='00002'
AND 
STAT ='N';

BEGIN
FOR REC  IN C1 LOOP
UPDATE PC_SIGN_EMP_TRNS SET STAT ='Y'
WHERE 
PC_SLNO=REC.PC_SLNO
AND
EMP_CODE_SIGN=REC.EMP_CODE_SIGN
AND
SIGN_OBJ_CODE=REC.SIGN_OBJ_CODE
AND
EMP_CODE_SIGN  = 'XXXX'
AND
STAT='N';
END LOOP;
COMMIT;
END;

CREATE TABLE temp_professor
AS
SELECT * FROM professor;

1.
temp_professor 테이블에서 직급이 조교수(assistant professor) 인 교수들의 BONUS 를 200 만원으로 인상하세요.
SELECT * FROM temp_professor;

UPDATE temp_professor
SET BONUS = 200
WHERE POSITION = 'assistant professor';
만약에 +200만원 인상이라면?
UPDATE temp_professor
--SET BONUS = BONUS + 200 -- NULL 계산
SET BONUS = NVL(BONUS,0) + 200  --NULL 이면 0으로 간주  0+200 =200 증가
--SELECT * FROM temp_professor;
WHERE POSITION = 'assistant professor';

2.
temp_professor 테이블에서 'Sharon Stone' 교수의 직급과 동일한 직급을 가진 교수들 중 
현재 급여가 250 만원이 안 되는 교수들의 급여를 15% 인상하세요.

UPDATE temp_professor
SET PAY = PAY*1.15
--SELECT * FROM temp_professor
WHERE POSITION = (SELECT POSITION
                FROM temp_professor
                WHERE NAME='Sharon Stone')
AND PAY <250 ;

SELECT * FROM temp_professor;
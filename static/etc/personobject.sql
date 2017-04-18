UPDATE PERSON
SET
NAME = CBO.NAME,
LOCATION = CASE 
WHEN CBO.CITY IS NULL 
THEN 
CASE WHEN CBO.REGION IS NULL 
THEN CASE WHEN CBO.STATE_CODE IS NULL 
THEN CBO.COUNTRY_CODE 
ELSE CBO.STATE_CODE END 
ELSE CBO.REGION END 
ELSE CBO.CITY END, 
IMAGE_URL = CBO.LOGO_URL,
WEBSITE = CASE WHEN CBO.DOMAIN IS NULL THEN CBO.HOMEPAGE_URL ELSE CBO.DOMAIN END,
DESCRIPTION = CASE 
WHEN CBO.OVERVIEW IS NULL OR LENGTH(CBO.OVERVIEW) > 9999 
THEN CASE WHEN CBO.DESCRIPTION IS NULL 
THEN CBO.SHORT_DESCRIPTION 
ELSE CBO.DESCRIPTION END 
ELSE CBO.OVERVIEW END
FROM CB_OBJECTS AS CBO
WHERE CBO.ID = PERSON.CRUNCH_ID AND LENGTH(CBO.NAME) < 50;

select * from person;

update person
set
location = 'unknown'
where idnum=2783;

--экспорт
COPY estate_agent TO '/home/copu3.csv' delimiter ',' HEADER;

--импорт
COPY estate_agent FROM '/home/copu3.csv' delimiter ',' HEADER;
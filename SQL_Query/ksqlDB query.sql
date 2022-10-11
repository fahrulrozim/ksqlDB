-- Create stream table:
create stream stream_table (step INT, tipe VARCHAR, amount DOUBLE, nameOrig VARCHAR, oldbalanceOrg DOUBLE, newbalanceOrig DOUBLE, nameDest VARCHAR, oldbalanceDest DOUBLE, newbalanceDest DOUBLE, isFraud 
INT) with (kafka_topic='frauds', value_format='json', partitions=1);

-- Create materialized table:
create table transactionUser as select st.nameOrig, count(*) as total_transactions from stream_table st
group by st.nameOrig emit changes;

create table final_table as
select st.nameOrig, count(*) as transaction_times, sum(st.amount) as total_amount
from stream_table st
group by st.nameOrig
emit changes;

-- Initiate to get data to stream table:
select * from stream_table;

-- Insert data to stream table: 
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (1, 'PAYMENT', 9839.63, 'C1231006815', 170131, 160296.32, 'M1979787155', 0, 0, 0);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (1, 'TRANSFER', 182, 'C1305486145', 182, 0, 'C553264065', 0, 0, 1);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (3, 'PAYMENT', 14420.62, 'C1561745898', 0, 0, 'M2033268925', 0, 0, 0);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (3, 'PAYMENT', 0, 'C1561745898', 0, 0, 'M2033268925', 0, 0, 0);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (4, 'DEBIT', 6666.75, 'C837073696', 11875, 5209.25, 'C655381473', 24777, 189534.74, 0);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (2, 'CASH_OUT', 28404.5, 'C2091072548', 0, 0, 'C1282788025', 51740, 0, 0);
insert into stream_table (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud) values (1, 'PAYMENT', 11668.11, 'C2048537720', 41551, 29885.84, 'M1230701703', 0, 0, 0);

-- Get final table data:
select * from final_table where total_amount >=2000;
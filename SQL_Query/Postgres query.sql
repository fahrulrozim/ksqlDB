-- Create table in postgres
create table public.fraud (
	step int,
	tipe varchar(255),
	amount float,
    nameOrig varchar(255),
    oldbalanceOrg float,
    newbalanceOrig float,
    nameDest varchar(255),
    oldbalanceDest float,
    newbalanceDest float,
    isFraud int
);

-- Fill in data table in postgres
insert into public.fraud (step, tipe, amount, nameOrig, oldbalanceOrg, newbalanceOrig, nameDest, oldbalanceDest, newbalanceDest, isFraud)
values (1, 'PAYMENT', 9839.64, 'C1231006815', 170136, 160296.36, 'M1979787155', 0, 0, 0),
(1, 'TRANSFER', 181, 'C1305486145', 181, 0, 'C553264065', 0, 0, 1),
(1, 'CASH_OUT', 181, 'C840083671', 181, 0, 'C38997010', 21182, 0, 1),
(1, 'PAYMENT', 11668.14, 'C2048537720', 41554, 29885.86, 'M1230701703', 0, 0, 0),
(1, 'PAYMENT', 7107.77, 'C154988899', 183195, 176087.23, 'M408069119', 0, 0, 0),
(1, 'TRANSFER', 42712.39, 'C283039401', 10363.39, 0, 'C1330106945', 57901.66, 24044.18, 0),
(2, 'CASH_OUT', 28404.6, 'C2091072548', 0, 0, 'C1282788025', 51744, 0, 0),
(3, 'PAYMENT', 14420.66, 'C1561745898', 0, 0, 'M2033268925', 0, 0, 0),
(3, 'PAYMENT', 4088.21, 'C244872973', 0, 0, 'M451312813', 0, 0, 0),
(4, 'DEBIT', 6666.78, 'C837073696', 11876, 5209.22, 'C655381473', 24777, 189534.74, 0);

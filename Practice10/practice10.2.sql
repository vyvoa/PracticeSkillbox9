insert into table_client      (   id,
                                  name,
                                  surname,
                                  telephone,
                                  birth_date    
                              ) values (
                              1001,
                              'Виктор',
                              'Петров',
                              '+79635642234',
                              date'1995-10-22'
                              );
insert into table_client      (   id,
                                  name,
                                  surname,
                                  telephone,
                                  birth_date    
                              ) values (
                              1002,
                              'Дмитрий',
                              'Шевкунов',
                              '+79124652234',
                              date'1999-01-18'
                              );
insert into table_client      (   id,
                                  name,
                                  surname,
                                  telephone,
                                  birth_date    
                              ) values (
                              1003,
                              'Евгений',
                              'Щелухов',
                              '+79656148234',
                              date'2000-03-11'
                              );                              
commit;
--truncate TABLE table_client;
--select * from table_client;
insert into table_client_accounts (
                                    id,
                                    client_id,
                                    account_id,
                                    start_date,
                                    end_date
                                    ) values (
                                    1,
                                    1001,
                                    2001,
                                    date'2020-10-21',
                                    null
                                    );
insert into table_client_accounts (
                                    id,
                                    client_id,
                                    account_id,
                                    start_date,
                                    end_date
                                    ) values (
                                    2,
                                    1002,
                                    2002,
                                    date'2020-10-21',
                                    date'2023-11-12'
                                    );
insert into table_client_accounts (
                                    id,
                                    client_id,
                                    account_id,
                                    start_date,
                                    end_date
                                    ) values (
                                    3,
                                    1003,
                                    2003,
                                    date'2020-10-21',
                                    null
                                    ); 
commit;                                    
--truncate TABLE table_client_accounts;
--select * from table_client_accounts;
insert into table_client_cards (        id            ,
                                        account_id    ,
                                        card_id       ,
                                        end_month     ,
                                        end_year      
                                    ) values(
                                            1,
                                            2001,
                                            1234123412341234,
                                            03,
                                            25);
insert into table_client_cards (        id            ,
                                        account_id    ,
                                        card_id       ,
                                        end_month     ,
                                        end_year      
                                    ) values(
                                            1,
                                            2002,
                                            4321432143214321,
                                            04,
                                            26);
insert into table_client_cards (        id            ,
                                        account_id    ,
                                        card_id       ,
                                        end_month     ,
                                        end_year      
                                    ) values(
                                            1,
                                            2003,
                                            3210321032103210,
                                            02,
                                            24);                                            
commit;                                    
--truncate TABLE table_client_cards;
--select * from table_client_cards;                                    
insert into table_client_transactions (   transaction_date    ,
                                          transfer_amount     ,
                                          client_id           ,
                                          card_id               
                                        ) values (
                                        timestamp'2024-02-06 22:41:58',
                                        2500.00,
                                        1001,
                                        1234123412341234
                                        );
insert into table_client_transactions (   transaction_date    ,
                                          transfer_amount     ,
                                          client_id           ,
                                          card_id               
                                        ) values (
                                        timestamp'2024-03-06 07:38:25',
                                        5000.00,
                                        1002,
                                        4321432143214321
                                        );
insert into table_client_transactions (   transaction_date    ,
                                          transfer_amount     ,
                                          client_id           ,
                                          card_id               
                                        ) values (
                                        timestamp'2024-03-06 20:05:24',
                                        7500.00,
                                        1003,
                                        3210321032103210
                                        );  
commit;                                    
--truncate TABLE table_client_transactions;
select * from table_client_transactions;    
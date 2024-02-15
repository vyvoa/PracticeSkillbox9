create user ods1;
alter user ods1
        identified by ods1
        default tablespace sysaux
        temporary TABLESPACE temp
        account unlock;
grant create session to ods1;
grant insert to ods1;
alter user ods1 quota unlimited on users;
alter user ods1 quota unlimited on sysaux;
commit;
create table ods1.table_client (   id            number,
                                  name          varchar2(32) not null,
                                  surname       varchar2(32) not null,
                                  telephone     varchar2(32),
                                  birth_date    date
                              );
--drop table ods1.table_client;
create table ods1.table_client_accounts (   id            number,
                                           client_id     number,
                                           account_id    number,
                                           start_date    date,
                                           end_date      date
                                        );
--drop table ods1.table_client_accounts ;
create table ods1.table_client_cards (   id            number,
                                        account_id    number,
                                        card_id       number,
                                        end_month     number,
                                        end_year      number
                                    );
--drop table ods1.table_cards ;
create table ods1.table_client_transactions (  transaction_date    timestamp,
                                               transfer_amount     number,
                                               client_id           number,
                                               card_id             number  
                                        );
--drop table ods1.table_client_transactions ;

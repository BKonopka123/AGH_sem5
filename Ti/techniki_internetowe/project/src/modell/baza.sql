create table user(
    user_id serial,
    fname varchar(255) not null,
    lname varchar(255) not null,
    email varchar(255) not null,
    logi varchar(255) not null,
    pass varchar(255) not null,
    light int DEFAULT 0,
    iso int DEFAULT 0,
    timee int DEFAULT 0,
    f int DEFAULT 0,
    CONSTRAINT user_pk PRIMARY KEY(user_id)
);

insert into user(user_id, fname, lname, email, logi, pass) values(1, 'admin', 'admin', 'admin@admin.com', 'admin', 'admin');
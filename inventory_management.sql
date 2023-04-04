create table `USERS` (
	`ID` int(11) not null auto_increment,
    `USER_NAME` VARCHAR(50) NOT NULL,
    `PASSWORD` VARCHAR(50) NOT NULL,
    `EMAIL` VARCHAR(100) DEFAULT NULL,
    `NAME` VARCHAR(100) NOT NULL,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `user_role`(
	`ID` int(11) not null auto_increment,
    `USER_ID` int(11) NOT NULL,
    `ROLE_ID`  int(11)  NOT NULL,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `role`(
	`ID` int(11) not null auto_increment,
    `ROLE_NAME`  VARCHAR(50)  NOT NULL,
	`DESCRIPTION`  VARCHAR(200)  NOT NULL,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `auth`(
	`ID` int(11) not null auto_increment,
    `ROLE_ID` int(11) NOT NULL,
	`MENU_ID` int(11) NOT NULL,
    `PERMISSION` int(1) NOT NULL DEFAULT '1',
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `menu`(
	`ID` int(11) not null auto_increment,
    `PARENT_ID` int(11) NOT NULL,
	`URL` VARCHAR(100) NOT NULL,
    `NAME` VARCHAR(100) NOT NULL,
    `ODER_INDEX` INT(1) not null default '0',
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `category`(
	`ID` int(11) not null auto_increment,
	`NAME` VARCHAR(100) NOT NULL,
    `CODE` VARCHAR(50) NOT NULL,
    `DESCRIPTION` TEXT,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `product_in_stock`(
	`ID` int(11) not null auto_increment,
	`PRODUCT_ID` int(11) NOT NULL,
    `QTY` int(11) NOT NULL,
    `MENU_ID` int(11) NOT NULL,
    `PERMISSION` INT(1) NOT NULL DEFAULT '1',
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `product_info`(
	`ID` int(11) not null auto_increment,
	`CATE_ID` int(11) NOT NULL,
    `CODE` varchar(50) NOT NULL,
    `NAME` varchar(100) NOT NULL,
	`DESCRIPTION` TEXT,
    `IMG_URL` varchar(200) not null,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `history`(
	`ID` int(11) not null auto_increment,
	`ACTION_NAME` varchar(100) NOT NULL,
    `TYPE` int(1) NOT NULL,
    `PRODUCT_ID` int(11) NOT NULL,
	`QTY` int(11) not null,
    `PRICE` decimal(15,2) not null,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

create table `invoice`(
	`ID` int(11) not null auto_increment,
	`CODE` varchar(50) NOT NULL,
    `TYPE` int(1) NOT NULL,
    `PRODUCT_ID` int(11) NOT NULL,
	`QTY` int(11) not null,
    `PRICE` decimal(15,2) not null,
    `ACTIVE_FLAG` INT(1) NOT NULL DEFAULT '1',
    `CREATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    `UPDATE_DATE` timestamp not null default CURRENT_TIMESTAMP,
    PRIMARY KEY(ID)
);

ALTER TABLE user_role ADD CONSTRAINT userId_foreign_key FOREIGN KEY (USER_ID) REFERENCES users (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE user_role ADD CONSTRAINT roleId_foreign_key FOREIGN KEY (ROLE_ID) REFERENCES role (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE auth ADD CONSTRAINT roleId_foreignKey FOREIGN KEY (ROLE_ID) REFERENCES role (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE auth ADD CONSTRAINT menuId_foreignKey FOREIGN KEY (MENU_ID) REFERENCES menu (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE product_info ADD CONSTRAINT cateID_foreignKey FOREIGN KEY (CATE_ID) REFERENCES category (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE product_in_stock ADD CONSTRAINT productID_foreignKey_stock FOREIGN KEY (PRODUCT_ID) REFERENCES product_info (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE history ADD CONSTRAINT productID_foreignKey_history FOREIGN KEY (PRODUCT_ID) REFERENCES product_info (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE invoice ADD CONSTRAINT productID_foreignKey_invoice FOREIGN KEY (PRODUCT_ID) REFERENCES product_info (ID)
ON DELETE RESTRICT
ON UPDATE CASCADE;



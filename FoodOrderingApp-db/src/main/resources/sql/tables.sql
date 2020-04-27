DROP TABLE IF EXISTS CUSTOMER CASCADE;
CREATE TABLE CUSTOMER(id SERIAL, uuid VARCHAR(200) UNIQUE NOT NULL, firstname VARCHAR(30) NOT NULL, lastname VARCHAR(30) ,email VARCHAR(50),
  contact_number VARCHAR(30) UNIQUE NOT NULL, password VARCHAR(255) NOT NULL, salt VARCHAR(255) NOT NULL ,PRIMARY KEY(id));

DROP TABLE IF EXISTS CATEGORY CASCADE;
CREATE TABLE CATEGORY(id SERIAL, uuid VARCHAR(200) UNIQUE NOT NULL,category_name VARCHAR(255), PRIMARY KEY (id));

DROP TABLE IF EXISTS STATE CASCADE;
CREATE TABLE STATE(id SERIAL,uuid VARCHAR(200) UNIQUE NOT NULL, state_name VARCHAR(30),PRIMARY KEY (id));

DROP TABLE IF EXISTS ADDRESS CASCADE;
CREATE TABLE ADDRESS(id SERIAL, uuid VARCHAR(200) UNIQUE NOT NULL,flat_buil_number VARCHAR(255), locality VARCHAR(255),city VARCHAR(30),pincode VARCHAR(30), state_id INTEGER, PRIMARY KEY (id),FOREIGN KEY (state_id) REFERENCES STATE(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS CUSTOMER_ADDRESS CASCADE;
CREATE TABLE CUSTOMER_ADDRESS(id SERIAL,customer_id INTEGER NOT NULL,address_id INTEGER NOT NULL,PRIMARY KEY (id), FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id) ON DELETE CASCADE,FOREIGN KEY (address_id) REFERENCES ADDRESS(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS ITEM CASCADE;
CREATE TABLE ITEM(id SERIAL,uuid VARCHAR(200) UNIQUE NOT NULL, item_name VARCHAR(30) NOT NULL, price INTEGER NOT NULL, type VARCHAR(10) NOT NULL, PRIMARY KEY (id));

DROP TABLE IF EXISTS RESTAURANT CASCADE;
CREATE TABLE RESTAURANT(id SERIAL,uuid VARCHAR(200) UNIQUE NOT NULL, restaurant_name VARCHAR(50) NOT NULL, photo_url VARCHAR(255), customer_rating DECIMAL NOT NULL, average_price_for_two INTEGER NOT NULL, number_of_customers_rated INTEGER NOT NULL DEFAULT 0, address_id INTEGER NOT NULL , PRIMARY KEY(id), FOREIGN KEY (address_id) REFERENCES ADDRESS(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS CATEGORY_ITEM CASCADE;
CREATE TABLE CATEGORY_ITEM(id SERIAL,item_id INTEGER NOT NULL,category_id INTEGER NOT NULL, PRIMARY KEY (id),FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE, FOREIGN KEY (category_id) REFERENCES CATEGORY(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS RESTAURANT_ITEM CASCADE;
CREATE TABLE RESTAURANT_ITEM(id SERIAL,item_id INTEGER NOT NULL, restaurant_id INTEGER NOT NULL, PRIMARY KEY (id),FOREIGN KEY (item_id) REFERENCES item(id) ON DELETE CASCADE, FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS RESTAURANT_CATEGORY CASCADE;
CREATE TABLE RESTAURANT_CATEGORY(id SERIAL,restaurant_id INTEGER NOT NULL, category_id INTEGER NOT NULL,PRIMARY KEY (id), FOREIGN KEY (category_id) REFERENCES CATEGORY(id) ON DELETE CASCADE, FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(id) ON DELETE CASCADE);

DROP TABLE IF EXISTS CUSTOMER_AUTH CASCADE;
CREATE TABLE CUSTOMER_AUTH(id SERIAL,uuid VARCHAR(200) UNIQUE NOT NULL, customer_id INTEGER NOT NULL, access_token VARCHAR(500), login_at TIMESTAMP, logout_at TIMESTAMP,expires_at TIMESTAMP, PRIMARY KEY (id), FOREIGN KEY (customer_id) REFERENCES CUSTOMER(id) ON DELETE CASCADE);
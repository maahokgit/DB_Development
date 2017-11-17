-- Drop Table 
DROP TABLE Person_edu;
DROP TABLE Education;
DROP TABLE lang_person;
DROP TABLE languages;
DROP TABLE citizen_person;
DROP TABLE Citizenship;
DROP TABLE Self_id;
DROP TABLE selectprogram;
DROP TABLE Person_Info;
DROP TABLE Release_info;

-- Create Table
CREATE TABLE Release_info
(
  releaseinfo_id INT,
  consent CHAR(1) NOT NULL, -- Y / N
  signature CHAR(1) NOT NULL,
  relationship VARCHAR(30),
  CONSTRAINT Release_info_PK PRIMARY KEY (releaseinfo_id)
);

CREATE TABLE Person_Info
(
  p_id INT NOT NULL,
  p_name VARCHAR(100) NOT NULL,
  p_gender CHAR(1) NOT NULL, -- M or F
  p_address VARCHAR(20) NOT NULL,
  p_city VARCHAR(20) DEFAULT 'Halifax',
  p_prov VARCHAR(20) DEFAULT 'Nova Scotia',
  p_country VARCHAR(20) DEFAULT 'Canada',
  p_postcode CHAR(7) NOT NULL,
  p_hphone VARCHAR(20),
  p_wphone VARCHAR(20),
  p_mphone VARCHAR(20),
  p_email VARCHAR(20) NOT NULL,
  p_sID CHAR(8),
  cert_sig CHAR(1) NOT NULL,
  cert_date DATE NOT NULL,
  crime_off CHAR(1) NOT NULL, -- Y / N
  child_off CHAR(1) NOT NULL, -- Y / N
  dis_act CHAR(1) NOT NULL, -- Y / N
  visa_card CHAR(1) NOT NULL, -- Y / N
  mastercard CHAR(1) NOT NULL, -- Y / N
  discovercard CHAR(1) NOT NULL, -- Y / N
  amex_card CHAR(1) NOT NULL, -- Y / N
  chequpay CHAR(1) NOT NULL, -- Y / N
  cardnumber CHAR(19) NOT NULL,
  cardexpire DATE NOT NULL,
  holdername VARCHAR(50) NOT NULL,
  holder_sig CHAR(1) NOT NULL,
  rec_num INT NOT NULL,
  rec_date DATE NOT NULL,
  releaseinfo_id INT NOT NULL,
  CONSTRAINT Person_info_PK PRIMARY KEY (p_id),
  CONSTRAINT Person_info_FK FOREIGN KEY (releaseinfo_id)
  REFERENCES Release_info(releaseinfo_id)
);

CREATE TABLE selectprogram
(
  pro_id INT,
  p_id INT,
  pro_first VARCHAR(30),
  pro_firstcamp VARCHAR(30),
  pro_second VARCHAR(30),
  pro_secondcamp VARCHAR(30),
  CONSTRAINT selectprogram_PK PRIMARY KEY (pro_id),
  CONSTRAINT selectprogram_FK FOREIGN KEY (p_id) REFERENCES Person_info(p_id)
);

CREATE TABLE Self_id
(
  selfid_id INT,
  p_id INT,
  aborig CHAR(1), -- Y / N
  african CHAR(1), -- Y / N
  disablity CHAR(1), -- Y / N
  doc_disable CHAR(1), -- 3 check box option
  CONSTRAINT Selfid_PK PRIMARY KEY (selfid_id),
  CONSTRAINT Selfid_FK FOREIGN KEY (p_id) REFERENCES Person_info(p_id)
);

CREATE TABLE Citizenship
(
  c_id INT,
  c_cc CHAR(1) NOT NULL,
  c_pr CHAR(1) NOT NULL,
  c_refugee CHAR(1) NOT NULL,
  c_other CHAR(1) NOT NULL,
  c_othercountry VARCHAR(20),
  CONSTRAINT Citizenship PRIMARY KEY (c_id)
);

CREATE TABLE citizen_person
(
  p_id INT,
  c_id INT,
  CONSTRAINT citizen_person_PK PRIMARY KEY (p_id, c_id),
  CONSTRAINT citizen_person_FK1 FOREIGN KEY (p_id) REFERENCES Person_info(p_id),
  CONSTRAINT citizen_person_FK2 FOREIGN KEY (c_id) REFERENCES Citizenship(c_id)
);

CREATE TABLE languages
(
  l_id INT,
  l_eng CHAR(1) NOT NULL, -- english? Y/N via check
  l_other VARCHAR(20),
  CONSTRAINT languages PRIMARY KEY (l_id)
);

CREATE TABLE lang_person
(
  p_id INT,
  l_id INT,
  CONSTRAINT lang_person_PK PRIMARY KEY (p_id, l_id),
  CONSTRAINT lang_person_FK1 FOREIGN KEY (p_id) REFERENCES Person_info(p_id),
  CONSTRAINT lang_person_FK2 FOREIGN KEY (l_id) REFERENCES languages(l_id)
);

CREATE TABLE Education
(
  ed_id INT,
  ed_name VARCHAR(50) NOT NULL,
  ed_year DATE NOT NULL,
  ed_address VARCHAR(50),
  ed_grade DOUBLE PRECISION,
  CONSTRAINT Education_PK PRIMARY KEY (ed_id)
);

CREATE TABLE Person_edu
(
  p_id INT,
  ed_id INT,
  CONSTRAINT Person_edu_PK PRIMARY KEY (p_id, ed_id),
  CONSTRAINT Person_edu_FK1 FOREIGN KEY (p_id) REFERENCES Person_info(p_id),
  CONSTRAINT Person_edu_FK2 FOREIGN KEY (ed_id) REFERENCES Education(ed_id)
);
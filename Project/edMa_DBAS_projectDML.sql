-- INSERT To Release_info Table

DROP SEQUENCE releaseinfo_id_seq;
CREATE SEQUENCE releaseinfo_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Release_info VALUES (releaseinfo_id_seq.NEXTVAL, 'Y', 'Y', 'Legal Guardian');
INSERT INTO Release_info VALUES (releaseinfo_id_seq.NEXTVAL, 'Y', 'Y', 'Father');
INSERT INTO Release_info VALUES (releaseinfo_id_seq.NEXTVAL, 'Y', 'Y', 'Mother');
INSERT INTO Release_info VALUES (releaseinfo_id_seq.NEXTVAL, 'Y', 'Y', null);
INSERT INTO Release_info VALUES (releaseinfo_id_seq.NEXTVAL, 'Y', 'Y', null);

-- INSERT To Person_info Table
DROP SEQUENCE p_id_seq;
CREATE SEQUENCE p_id_seq START WITH 1 INCREMENT BY 1;
DELETE FROM Person_info;
INSERT INTO Person_info VALUES 
(p_id_seq.NEXTVAL, 'Janice M. Jones', 'F', '1921 Dry Pine Bay Rd', 'White River', 'Ontario', 'Canada', 'P0M 3G0', '807-822-4856', null, null,
'JaniceMJones@rhyta.com', null, 'Y', TO_DATE('20170115', 'YYYYMMDD'), 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', '4532 4558 6405 2076', 
TO_DATE('20200501', 'YYYYMMDD'), 'Janice M. Jones', 'Y', 1, TO_DATE('20170221', 'YYYYMMDD'), 1);

INSERT INTO Person_info VALUES 
(p_id_seq.NEXTVAL, 'Caroline D. Saxton', 'F', '1992 40th Street', 'Calgary', 'Alberta', 'Canada', 'T2P 2V7', '403-539-6281', null, null,
'CarolineDSaxton@teleworm.us', null, 'Y', TO_DATE('20161215', 'YYYYMMDD'), 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', '5501 3772 5309 8599', 
TO_DATE('20180501', 'YYYYMMDD'), 'Caroline D. Saxton', 'Y', 1, TO_DATE('20170221', 'YYYYMMDD'), 2);

INSERT INTO Person_info VALUES 
(p_id_seq.NEXTVAL, 'Marcus D. Klein', 'M', '4933 Nelson Street', 'Iron Bridge', 'Ontario', 'Canada', 'P0R 1H0', null, '705-843-1467', null,
'MarcusDKlein@jourrapide.com', null, 'Y', TO_DATE('20161106', 'YYYYMMDD'), 'N', 'N', 'N', 'N', 'Y', 'N', 'N', 'N', '5182 6141 0643 2658', 
TO_DATE('20190322', 'YYYYMMDD'), 'Marcus D. Klein', 'Y', 1, TO_DATE('20170221', 'YYYYMMDD'), 3);

INSERT INTO Person_info VALUES 
(p_id_seq.NEXTVAL, 'Gloria S. Corbett', 'F', '895 Cordova Street', 'Vancouver', 'British Colombia', 'Canada', 'V6B 1E1', null, '604-505-8389', null,
'GloriaSCorbett@jourrapide.com', null, 'Y', TO_DATE('20170106', 'YYYYMMDD'), 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', '4556 1916 2328 9136', 
TO_DATE('20190212', 'YYYYMMDD'), 'Gloria S. Corbett', 'Y', 1, TO_DATE('20170221', 'YYYYMMDD'), 4);

INSERT INTO Person_info VALUES 
(p_id_seq.NEXTVAL, 'Charles L. Richardson', 'M', '4669 Tanner Street', 'Vancouver', 'British Colombia', 'Canada', 'V5R 2T4', null, '604-790-0367', null,
'CharlesLRichardson@jourrapide.com', null, 'Y', TO_DATE('20170123', 'YYYYMMDD'), 'N', 'N', 'N', 'Y', 'N', 'N', 'N', 'N', '4929 3605 5679 6777', 
TO_DATE('20210612', 'YYYYMMDD'), 'Charles L. Richardson', 'Y', 1, TO_DATE('20170221', 'YYYYMMDD'), 5);

-- INSERT to selectprogram

DROP SEQUENCE pro_id_seq;
CREATE SEQUENCE pro_id_seq START WITH 1 INCREMENT BY 1;
--DELETE FROM selectprogram;

/* MODFIY TABLE Cause I messed up!
ALTER TABLE selectprogram MODIFY (pro_first VARCHAR(50));
ALTER TABLE selectprogram MODIFY (pro_firstcamp VARCHAR(50));
ALTER TABLE selectprogram MODIFY (pro_second VARCHAR(50));
ALTER TABLE selectprogram MODIFY (pro_secondcamp VARCHAR(50));
*/

INSERT INTO selectprogram VALUES (pro_id_seq.NEXTVAL, 1, 'IT Programming', 'Institute of Technology', 'IT Systems Management & Security', 'Institute of Technology');
INSERT INTO selectprogram VALUES (pro_id_seq.NEXTVAL, 2, 'IT Data Analytics', 'Waterfront Campus', 'IT Database Administration', 'Waterfront Campus');
INSERT INTO selectprogram VALUES (pro_id_seq.NEXTVAL, 3, 'IT Generalist', 'Truro Campus', 'IT Web Development', 'Truro Campus');
INSERT INTO selectprogram VALUES (pro_id_seq.NEXTVAL, 4, 'Business Intelligence Analytics', 'Institute of Technology', 'Oil Heat Systems Technician', 'Akerley Campus');
INSERT INTO selectprogram VALUES (pro_id_seq.NEXTVAL, 5, 'Machining', 'Pictou Campus', 'Construction Management Technology', 'Waterfront Campus');

-- Insert to Self_id
DROP SEQUENCE selfid_id_seq;
CREATE SEQUENCE selfid_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Self_id VALUES (selfid_id_seq.NEXTVAL, 1, 'N', 'N', 'N', null);
INSERT INTO Self_id VALUES (selfid_id_seq.NEXTVAL, 2, 'Y', 'N', 'N', null);
INSERT INTO Self_id VALUES (selfid_id_seq.NEXTVAL, 3, 'N', 'Y', 'N', null);
INSERT INTO Self_id VALUES (selfid_id_seq.NEXTVAL, 4, 'N', 'N', 'Y', '1');
INSERT INTO Self_id VALUES (selfid_id_seq.NEXTVAL, 5, 'Y', 'Y', 'N', null);

-- INSERT TO Citizenship
DROP SEQUENCE c_id_seq;
CREATE SEQUENCE c_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Citizenship VALUES (c_id_seq.NEXTVAL, 'Y', 'N', 'N', 'N', null);
INSERT INTO Citizenship VALUES (c_id_seq.NEXTVAL, 'N', 'Y', 'N', 'N', null);
INSERT INTO Citizenship VALUES (c_id_seq.NEXTVAL, 'N', 'N', 'Y', 'N', null);
INSERT INTO Citizenship VALUES (c_id_seq.NEXTVAL, 'N', 'N', 'N', 'Y', 'Japan');
INSERT INTO Citizenship VALUES (c_id_seq.NEXTVAL, 'N', 'N', 'N', 'Y', 'Congo');

-- INSERT TO citizen_person
INSERT INTO citizen_person VALUES (1, 1);
INSERT INTO citizen_person VALUES (2, 2);
INSERT INTO citizen_person VALUES (3, 3);
INSERT INTO citizen_person VALUES (4, 4);
INSERT INTO citizen_person VALUES (5, 5);

-- INSERT TO languages
DROP SEQUENCE l_id_seq;
CREATE SEQUENCE l_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO languages VALUES (l_id_seq.NEXTVAL, 'Y', null);
INSERT INTO languages VALUES (l_id_seq.NEXTVAL, 'Y', null);
INSERT INTO languages VALUES (l_id_seq.NEXTVAL, 'Y', null);
INSERT INTO languages VALUES (l_id_seq.NEXTVAL, 'Y', null);
INSERT INTO languages VALUES (l_id_seq.NEXTVAL, 'Y', null);

-- INSERT TO lang_person
INSERT INTO lang_person VALUES (1, 1);
INSERT INTO lang_person VALUES (2, 2);
INSERT INTO lang_person VALUES (3, 3);
INSERT INTO lang_person VALUES (4, 4);
INSERT INTO lang_person VALUES (5, 5);

-- INSERT TO Education
DROP SEQUENCE ed_id_seq;
CREATE SEQUENCE ed_id_seq START WITH 1 INCREMENT BY 1;

INSERT INTO Education VALUES (ed_id_seq.NEXTVAL, 'St. Basil’s School', TO_DATE('1999', 'YYYY'), null, null);
INSERT INTO Education VALUES (ed_id_seq.NEXTVAL, 'Monsignor A.J. Hetherington School', TO_DATE('2000', 'YYYY'), '4 Coral Springs Blvd NE Calgary, AB T3J 3J3', '69');
INSERT INTO Education VALUES (ed_id_seq.NEXTVAL, 'Iron Bridge Public School', TO_DATE('1995', 'YYYY'), '22241 Highway 17 E, Iron Bridge, ON P0R 1H0', '95');
INSERT INTO Education VALUES (ed_id_seq.NEXTVAL, 'King David High School', TO_DATE('1982', 'YYYY'), '5718 Willow Street', '95');
INSERT INTO Education VALUES (ed_id_seq.NEXTVAL, 'Magee Secondary School', TO_DATE('1989', 'YYYY'), '6360 Maple Street', '80');

-- INSERT TO Person_edu
INSERT INTO Person_edu VALUES (1, 1);
INSERT INTO Person_edu VALUES (2, 2);
INSERT INTO Person_edu VALUES (3, 3);
INSERT INTO Person_edu VALUES (4, 4);
INSERT INTO Person_edu VALUES (5, 5);
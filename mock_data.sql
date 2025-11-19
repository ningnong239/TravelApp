-- Mock Data for Testing
-- ผู้ใช้ตัวอย่าง (เจ้าของทริป)

INSERT INTO users (email, password_hash, display_name)
VALUES ('demo@example.com', '$2a$10$demoHashOnlyForExample', 'Demo User')
ON CONFLICT (email) DO NOTHING;

-- Trip 1
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'คู่มือเที่ยวเกาะช้าง กิน เที่ยว พักที่ไหนดี? อ่านจบครบที่เดียว!',
  'วันว่างนี้ไปเที่ยวเกาะช้างกัน พร้อมทำกิจกรรมต่าง ๆ เช่น เที่ยวน้ำตก ล่องเรือชมป่าชายเลน ขี่ช้างท่องป่า ผจญภัยเหนือยอดไม้ และดำน้ำตื้น รับรอทริปนี้สนุกแน่!\n\n"เกาะช้าง" จังหวัดตราด ที่เที่ยวทะเลใกล้กรุงเทพฯ สามารถเที่ยวกันได้ทุกฤดู เคลียร์งานและวันว่างได้แล้วก็แค่จัดกระเป๋าไปกันได้เลยกับแพลน เที่ยวเกาะช้าง ต้องไปกิน เที่ยว พักที่ไหน? อ่านจบครบที่เดียว! ซึ่งหลายคนสงสัยว่าไปเกาะช้างเที่ยวไหนดี? Wongnai Travel บอกเลยเกาะช้างไม่ได้มีแค่ไปเล่นน้ำทะเล หรือนอนพักริมหาดทรายเท่านั้น เพราะมีกิจกรรมสนุก ๆ รออยู่เพียบ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/07/02/3c758646aa6c426ba3c6a81f57b20bd6.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/02/6a2733ab91164ac8943b77deb14fdbde.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/02/941dbb607f0742bbadd63bbbd993e187.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/02/bd1d256256c14c208d0843a345f75741.jpg'
  ],
  ARRAY['เกาะ','ทะเล','จุดชมวิว','ธรรมชาติ','ตราด'],
  12.0480, 102.3225,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 2
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'ลัดเลาะ 10 ที่เที่ยวย่าน BTS สายสีเขียว',
  'BTS สายสีเขียวเปิดให้บริการเพิ่ม 5 สถานีทั้งที งานนี้ต้องไม่มีพลาด รีบไปอัปเดต เช็กอินที่เที่ยวคูล ๆ ไปได้ง่ายก่อนใคร\n\nเริ่มกันที่ ''สถานีห้าแยกลาดพร้าว'' เป็นสถานีที่เชื่อมกับเซ็นทรัลลาดพร้าว ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2020/02/18/458b9a31b62b408d91137fbe152f7450.jpg',
    'https://img.wongnai.com/p/1600x0/2020/02/18/08bca1c784db4d7f92e93656b5376681.jpg',
    'https://img.wongnai.com/p/1600x0/2020/02/18/95bd2ca371e24436bcb24d432a86836c.jpg',
    'https://img.wongnai.com/p/1600x0/2020/02/18/68289e188ea54e00b5e9d806cfd0fc54.jpg'
  ],
  ARRAY['คาเฟ่','ร้านกาแฟ','จุดถ่ายรูป','เที่ยวใกล้กรุง','กรุงเทพมหานคร'],
  13.8121, 100.5530,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 3
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวทุ่งทานตะวันชลบุรี ได้รูปสวยไม่ต้องไปไกลที่ ไร่คีรีบูรพา',
  'บานสะพรั่งแล้วจ้า กับทุ่งทานตะวันที่ใหญ่กว่า 30 ไร่ แต่อย่าชะล่าใจไป เพราะว่าเปิดให้เข้าชมถึงแค่เดือนมกราคมเท่านั้น...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/12/27/777681c6184b498baead821895f7d7ab.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/27/10b2aaf1f0df42a98d0b482e254789ee.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/27/79e5b71efa54433b909e08bac13f27bb.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/27/939f644df3d847409a85c1b2d054af25.jpg'
  ],
  ARRAY['จุดถ่ายรูป','ถ่ายรูปสวย','เที่ยวใกล้กรุง','ชลบุรี'],
  13.2528, 101.0156,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 4
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวสิ้นปี บ้านอีต่องเหมืองปิล็อก ชมหมอก กินหมูกระทะ ล่าทางช้างเผือก',
  'จังหวะ จะเที่ยว บ้านอีต่อง เหมืองปิล็อก ตามล่าทะเลหมอกหน้าหนาว ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/12/25/54961e4326954765a80cd20e2044083d.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/25/183af5673b074e55a3842aca97676220.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/25/9bbcb032afc145d19e485defcf2067c1.jpg',
    'https://img.wongnai.com/p/1600x0/2019/12/25/2974828fdb16492da0e8f35f627ade7a.jpg'
  ],
  ARRAY['จุดถ่ายรูป','หมู่บ้าน','ภูเขา','ธรรมชาติ','ถ่ายรูปสวย','บ้านอีต่องเหมืองปิล็อก','กาญจนบุรี'],
  14.6761, 98.3814,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 5
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'ทริปที่เที่ยวและร้านกาแฟเชียงใหม่ ที่สวยได้แบบไม่ต้องไปไกลถึงเกาหลี',
  'แวะคาเฟ่เชียงใหม่! เที่ยวสไตล์เกาหลีแบบไม่ต้องไปไกล ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/10/10/3092e773cda34ca2a77373b82f7639b7.jpg',
    'https://img.wongnai.com/p/1600x0/2019/10/10/7739627a33134587827ee72f1a9c2cce.jpg',
    'https://img.wongnai.com/p/1600x0/2019/10/10/e51a7af0bd18463db0685057809368ef.jpg',
    'https://img.wongnai.com/p/1600x0/2019/10/10/49c6a0f4c25a41b08b3ca47ce410195d.jpg'
  ],
  ARRAY['จุดถ่ายรูป','ถ่ายรูปสวย','ร้านกาแฟ','เชียงใหม่','คาเฟ่'],
  18.7883, 98.9853,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 6
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวเกาะหลีเป๊ะ กิน เที่ยว พักที่ไหน? จัดมาให้ครบ!',
  'ไปเที่ยวเกาะหลีเป๊ะ พักผ่อนบนหาดทรายขาว เล่นน้ำทะเลใส ๆ ดำน้ำตื้นชมความสวยงามโลกใต้ทะเล ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/07/31/b3986319d85a4d85baecbacf03a519d8.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/31/9969a296fe1b452a8e64c2b7cfd58319.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/31/4edab94617f642d7ac11efd9bccb9863.jpg',
    'https://img.wongnai.com/p/1600x0/2019/07/31/58348f4c3ace47349e80e5930a7a525a.jpg'
  ],
  ARRAY['ทะเล','เกาะ','สตูล','ธรรมชาติ'],
  6.4901, 99.3015,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 7
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'คู่มือเที่ยวไต้หวันง่าย ๆ ฉบับ 2020 ฉลองต่อวีซ่าฟรี!',
  'วางแผนเที่ยวไต้หวันปี 2020 กัน! ไปเที่ยวไต้หวันจุใจ ไม่ต้องง้อวีซ่า! ...',
  ARRAY[
    'https://img.wongnai.com/p/1920x0/2019/07/11/cefadd52a1424562bddf0d8fb4762d38.jpg',
    'https://img.wongnai.com/p/1920x0/2019/07/11/eee5544a928c4766a15a04852135dbbb.jpg',
    'https://img.wongnai.com/p/1920x0/2019/07/11/c725886d14b144868cf368bee07d1441.jpg',
    'https://img.wongnai.com/p/1920x0/2019/07/11/83cda5c3853443c4a1398fb3ae6b31a8.jpg'
  ],
  ARRAY['จุดถ่ายรูป','ต่างประเทศ','ไต้หวัน','ธรรมชาติ'],
  25.0330, 121.5654,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 8
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวญี่ปุ่นไปกับภูเขาไฟชื่อดังให้สุดฟินจาก 15 มุมสุดงาม~',
  'สายถ่ายรูปห้ามพลาด! ลุยเที่ยวญี่ปุ่น ชมภูเขาไฟฟูจิ ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/06/04/371f3bfad9cd46399f30c8b04c816597.jpg',
    'https://img.wongnai.com/p/1600x0/2019/06/04/93b7b555b624490680ebe7b0a16b0519.jpg',
    'https://img.wongnai.com/p/1600x0/2019/06/04/bf2c001a72314452a261bff3f039ccdc.jpg',
    'https://img.wongnai.com/p/1600x0/2019/06/04/37b377e43f344da794cb3353aeca3fcf.jpg'
  ],
  ARRAY['จุดถ่ายรูป','ต่างประเทศ','ญี่ปุ่น','ธรรมชาติ','ภูเขา'],
  35.3606, 138.7274,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 9
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวฝรั่งเศส เช็กอินเมืองในฝัน เก็บแลนด์มาร์กสุดปังในปารีส',
  '1 ใน Dream Destination ของใครหลาย ๆ คนคงหนีไม่พ้นการเที่ยวฝรั่งเศส เพราะที่มีทั้งหอไอเฟล พิพิธภัณฑ์ลูฟวร์ และ Disneyland ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/05/23/4057d08671744f8e8fd9e939b5e60087.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/23/0176c0c06f2449849e826844733ef1e4.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/23/0e56670f9e0e43e7b26c312583ecca51.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/23/7a677ee703ab448b9ca20c847aa74ce3.jpg'
  ],
  ARRAY['จุดถ่ายรูป','ต่างประเทศ','ฝรั่งเศส'],
  48.8566, 2.3522,
  (SELECT id FROM users WHERE email='demo@example.com')
);

-- Trip 10
INSERT INTO trips (title, description, photos, tags, latitude, longitude, author_id)
VALUES (
  'เที่ยวฟินแลนด์แบบฟิน ๆ ไปฟาร์ม Husky ขี่ Reindeer เล่น Snowmobile',
  'ใครว่าเที่ยวฟินแลนด์ มีแค่ล่าแสงเหนือ กิจกรรมกลางภูเขาหิมะเค้าก็มีให้ทำเพียบ! ทั้งขี่ Husky, Reindeer ขับเจ็ทสกีหิมะท่ามกลางอุณภูมิติดลบ ...',
  ARRAY[
    'https://img.wongnai.com/p/1600x0/2019/05/21/cd54e9c640694a95b7e0103b0ead5408.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/21/cf792ff02ab0491b9f30d67d33634f78.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/21/e87ce6e73c634532afd50dd02517fee9.jpg',
    'https://img.wongnai.com/p/1600x0/2019/05/21/ea0f93584b3c4f3ba0680fcc11bc3a13.jpg'
  ],
  ARRAY['ต่างประเทศ','ฟินแลนด์','หิมะ','ธรรมชาติ'],
  66.5039, 25.7294,
  (SELECT id FROM users WHERE email='demo@example.com')
);


DROP DATABASE IF EXISTS reservation_system;
CREATE DATABASE reservation_system;
USE reservation_system;

CREATE TABLE client (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    client_name VARCHAR(100) NOT NULL,
    client_email VARCHAR(255) UNIQUE NOT NULL,
    client_hash VARCHAR(255)
);

CREATE TABLE tour_list (
    tour_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    price_yen DECIMAL(10, 2) NOT NULL,
    available_seats INT NOT NULL, 
    reviews_rating DECIMAL(2, 1) DEFAULT 0.0,
    reviews_count INT DEFAULT 0,
    tour_description TEXT,
    image_path VARCHAR(255)
);

CREATE TABLE reservation (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    tour_id INT NOT NULL,
    client_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    number_of_guests INT NOT NULL,
    total_price_yen DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (tour_id) REFERENCES tour_list(tour_id),
    FOREIGN KEY (client_id) REFERENCES client(client_id)
);

INSERT INTO tour_list (tour_id, tour_name, city, price_yen, available_seats, reviews_rating, reviews_count, tour_description) VALUES
(1, 'Tokyo City Tour', 'Tokyo', 23000, 24, 4.7, 128, 'Join a full-day tour through Tokyo’s must-see sights, including temples, markets, and neighborhoods. Perfect for first-time visitors wanting a complete overview.'),
(2, 'Asakusa & Skytree', 'Tokyo', 23000, 25, 4.8, 145, 'Experience Tokyo’s traditional charm in Asakusa followed by panoramic views from the Skytree. A great balance of culture and modernity.'),
(3, 'Ghibli Museum Visit', 'Tokyo', 27000, 81, 4.9, 210, 'Step into the magical world of Studio Ghibli with exclusive access to the enchanting museum. Ideal for fans of Totoro and Spirited Away.'),
(4, 'Odaiba Cruise', 'Tokyo', 12000, 36, 4.5, 76, 'Sail through Tokyo Bay and enjoy the futuristic skyline of Odaiba from the water. A relaxing break from the busy city.'),
(5, 'Shibuya & Harajuku Walk', 'Tokyo', 5000, 74, 4.6, 190, 'Wander the fashionable streets of Harajuku and experience the iconic Shibuya crossing. Great for shoppers and street culture lovers.'),

(6, 'Arashiyama Bamboo Forest', 'Kyoto', 40000, 96, 4.9, 220, 'Walk through towering green stalks in one of Japan’s most iconic natural sights. A peaceful escape just outside the city center.'),
(7, 'Fushimi Inari Shrine Tour', 'Kyoto', 96000, 64, 5.0, 243, 'Climb through the legendary vermillion torii gates of Fushimi Inari. This spiritual experience is unforgettable at sunrise or sunset.'),
(8, 'Kyoto Tea Ceremony', 'Kyoto', 14500, 87, 4.7, 88, 'Take part in an authentic Japanese tea ceremony led by a local master. Learn the customs and quiet beauty behind this timeless ritual.'),
(9, 'Gion Geisha Experience', 'Kyoto', 26000, 71, 4.8, 154, 'Stroll the cobblestone alleys of Gion and meet a real geisha. A cultural evening filled with tradition, elegance, and history.'),
(10, 'Kinkaku-ji Temple Tour', 'Kyoto', 9500, 40, 4.6, 102, 'Admire the Golden Pavilion shining above its reflection pond. This UNESCO site is one of Kyoto’s most photogenic treasures.'),

(11, 'Osaka Castle & Park', 'Osaka', 6000, 73, 4.5, 87, 'Explore Osaka Castle’s historic walls and lush surrounding parklands. A must-see for history lovers and photographers.'),
(12, 'Universal Studios Japan', 'Osaka', 15000, 52, 4.9, 198, 'Enjoy world-class rides and movie-themed attractions in one of Asia’s top theme parks. Fun for all ages and thrill-seekers.'),
(13, 'Dotonbori Food Tour', 'Osaka', 19000, 50, 4.8, 135, 'Taste Osaka’s famous street foods, from takoyaki to okonomiyaki, on this flavorful evening walk. A treat for your taste buds.'),
(14, 'Osaka Aquarium Kaiyukan', 'Osaka', 2400, 57, 4.7, 79, 'See whale sharks, jellyfish, and sea lions in one of the largest aquariums in the world. A fascinating journey through ocean habitats.'),
(15, 'Umeda Sky Building View', 'Osaka', 1500, 49, 4.4, 51, 'Get 360° views of Osaka from the floating observatory high above the city. Especially magical at night.'),

(16, 'Sapporo Snow Festival Tour', 'Hokkaido', 60000, 47, 4.9, 221, 'Marvel at massive ice sculptures during Japan’s most famous winter festival. A dazzling mix of lights, art, and snow fun.'),
(17, 'Otaru Canal & Glass Workshops', 'Hokkaido', 80000, 91, 4.6, 94, 'Stroll along Otaru’s romantic canal and try your hand at traditional glassblowing. A perfect day of history and hands-on fun.'),
(18, 'Niseko Ski Experience', 'Hokkaido', 120000, 27, 5.0, 176, 'Hit the powdery slopes of Niseko, Japan’s top ski resort. Great for beginners and seasoned skiers alike.'),
(19, 'Furano Flower Fields', 'Hokkaido', 9100, 35, 4.7, 108, 'Wander through colorful flower fields stretching across the hills of Furano. Best visited in spring and summer for vivid scenery.'),
(20, 'Shiretoko Nature Cruise', 'Hokkaido', 20000, 19, 4.8, 72, 'Cruise along rugged coastlines and spot wildlife in one of Japan’s most untouched natural regions. A UNESCO World Heritage Site.'),

(21, 'Churaumi Aquarium Visit', 'Okinawa', 7300, 62, 4.7, 114, 'Discover rare marine life and walk through massive underwater tunnels. Great for families and ocean lovers.'),
(22, 'Naha City Sightseeing', 'Okinawa', 7800, 28, 4.5, 63, 'Explore Okinawa’s capital with stops at historic sites, markets, and Shurijo Castle. A relaxed introduction to island culture.'),
(23, 'Okinawa Beach Relaxation', 'Okinawa', 7500, 73, 4.6, 92, 'Spend a carefree day on white-sand beaches with crystal-clear waters. Sun, swim, and simply unwind.'),
(24, 'Snorkeling & Diving Tour', 'Okinawa', 5000, 32, 4.9, 147, 'Dive into coral reefs teeming with tropical fish. A must-do adventure for ocean explorers.'),
(25, 'Okinawa World Culture Park', 'Okinawa', 5000, 50, 4.4, 58, 'Learn about Okinawan traditions, crafts, and performances in this cultural theme park. Great for curious travelers of all ages.');

INSERT INTO client (client_id, client_name, client_email) VALUES 
(1, 'Kenji Tanaka', 'kenji.tanaka@example.com'),
(2, 'Ren Yamamoto', 'ren.yamamoto@example.com'),
(3, 'Hiroshi Kobayashi', 'hiroshi.k@example.com'),
(4, 'Sota Ito', 'sota.ito@example.com'),
(5, 'Haruto Watanabe', 'haruto.w@example.com'),
(6, 'Ryota Kato', 'ryota.kato@example.com'),
(7, 'Kaito Yamada', 'kaito.yamada@example.com'),
(8, 'Yuki Mori', 'yuki.mori@example.com'),
(9, 'Mio Shimizu', 'mio.shimizu@example.com'),
(10, 'Yuma Kimura', 'yuma.kimura@example.com'),
(11, 'Hina Takahashi', 'hina.takahashi@example.com'),
(12, 'Mai Sato', 'mai.sato@example.com'),
(13, 'Yui Suzuki', 'yui.suzuki@example.com'),
(14, 'Akari Takahashi', 'akari.t@example.com'),
(15, 'Yuna Nakamura', 'yuna.nakamura@example.com'),
(16, 'Aoi Ito', 'aoi.ito@example.com'),
(17, 'Sakura Yoshida', 'sakura.y@example.com'),
(18, 'Hinata Tanaka', 'hinata.tanaka@example.com'),
(19, 'Riku Hayashi', 'riku.hayashi@example.com'),
(20, 'Takumi Inoue', 'takumi.i@example.com');

INSERT INTO reservation (reservation_id, tour_id, client_id, reservation_date, number_of_guests, total_price_yen) VALUES
(1, 1, 1, STR_TO_DATE('7/1/2025', '%m/%d/%Y'), 2, 46000),
(2, 5, 2, STR_TO_DATE('7/3/2025', '%m/%d/%Y'), 4, 20000),
(3, 7, 3, STR_TO_DATE('7/5/2025', '%m/%d/%Y'), 1, 96000),
(4, 12, 4, STR_TO_DATE('7/7/2025', '%m/%d/%Y'), 3, 45000),
(5, 16, 5, STR_TO_DATE('7/9/2025', '%m/%d/%Y'), 2, 120000),
(6, 22, 6, STR_TO_DATE('7/11/2025', '%m/%d/%Y'), 5, 39000),
(7, 2, 7, STR_TO_DATE('7/2/2025', '%m/%d/%Y'), 1, 23000),
(8, 6, 8, STR_TO_DATE('7/4/2025', '%m/%d/%Y'), 6, 40000),
(9, 9, 9, STR_TO_DATE('7/6/2025', '%m/%d/%Y'), 2, 52000),
(10, 14, 10, STR_TO_DATE('7/8/2025', '%m/%d/%Y'), 1, 2400),
(11, 18, 11, STR_TO_DATE('7/10/2025', '%m/%d/%Y'), 3, 360000),
(12, 24, 1, STR_TO_DATE('7/12/2025', '%m/%d/%Y'), 4, 20000),
(13, 3, 12, STR_TO_DATE('7/3/2025', '%m/%d/%Y'), 5, 135000),
(14, 8, 13, STR_TO_DATE('7/5/2025', '%m/%d/%Y'), 2, 29000),
(15, 11, 14, STR_TO_DATE('7/7/2025', '%m/%d/%Y'), 3, 18000),
(16, 15, 15, STR_TO_DATE('7/9/2025', '%m/%d/%Y'), 1, 1500),
(17, 20, 16, STR_TO_DATE('7/11/2025', '%m/%d/%Y'), 4, 80000),
(18, 25, 17, STR_TO_DATE('7/13/2025', '%m/%d/%Y'), 2, 10000),
(19, 4, 18, STR_TO_DATE('7/4/2025', '%m/%d/%Y'), 2, 24000),
(20, 10, 19, STR_TO_DATE('7/6/2025', '%m/%d/%Y'), 1, 9500),
(21, 13, 20, STR_TO_DATE('7/8/2025', '%m/%d/%Y'), 3, 57000),
(22, 17, 12, STR_TO_DATE('7/10/2025', '%m/%d/%Y'), 5, 400000),
(23, 21, 13, STR_TO_DATE('7/12/2025', '%m/%d/%Y'), 2, 14600),
(24, 23, 14, STR_TO_DATE('7/14/2025', '%m/%d/%Y'), 6, 45000),
(25, 1, 15, STR_TO_DATE('7/2/2025', '%m/%d/%Y'), 3, 69000),
(26, 5, 16, STR_TO_DATE('7/4/2025', '%m/%d/%Y'), 2, 10000),
(27, 7, 17, STR_TO_DATE('7/6/2025', '%m/%d/%Y'), 4, 384000),
(28, 12, 18, STR_TO_DATE('7/8/2025', '%m/%d/%Y'), 1, 15000),
(29, 16, 19, STR_TO_DATE('7/10/2025', '%m/%d/%Y'), 5, 300000),
(30, 22, 20, STR_TO_DATE('7/12/2025', '%m/%d/%Y'), 2, 15600),
(31, 2, 11, STR_TO_DATE('7/3/2025', '%m/%d/%Y'), 4, 92000),
(32, 6, 1, STR_TO_DATE('7/5/2025', '%m/%d/%Y'), 3, 40000),
(33, 9, 2, STR_TO_DATE('7/7/2025', '%m/%d/%Y'), 1, 26000),
(34, 14, 3, STR_TO_DATE('7/9/2025', '%m/%d/%Y'), 2, 4800),
(35, 18, 4, STR_TO_DATE('7/11/2025', '%m/%d/%Y'), 6, 720000),
(36, 24, 5, STR_TO_DATE('7/13/2025', '%m/%d/%Y'), 3, 15000),
(37, 3, 6, STR_TO_DATE('7/4/2025', '%m/%d/%Y'), 2, 54000),
(38, 8, 7, STR_TO_DATE('7/6/2025', '%m/%d/%Y'), 4, 58000),
(39, 11, 8, STR_TO_DATE('7/8/2025', '%m/%d/%Y'), 5, 30000),
(40, 15, 9, STR_TO_DATE('7/10/2025', '%m/%d/%Y'), 3, 4500),
(41, 20, 10, STR_TO_DATE('7/12/2025', '%m/%d/%Y'), 1, 20000),
(42, 25, 12, STR_TO_DATE('7/14/2025', '%m/%d/%Y'), 5, 25000),
(43, 4, 13, STR_TO_DATE('7/5/2025', '%m/%d/%Y'), 3, 36000),
(44, 10, 14, STR_TO_DATE('7/7/2025', '%m/%d/%Y'), 2, 19000),
(45, 13, 15, STR_TO_DATE('7/9/2025', '%m/%d/%Y'), 4, 76000),
(46, 17, 16, STR_TO_DATE('7/11/2025', '%m/%d/%Y'), 1, 80000),
(47, 21, 17, STR_TO_DATE('7/13/2025', '%m/%d/%Y'), 3, 21900),
(48, 23, 18, STR_TO_DATE('7/15/2025', '%m/%d/%Y'), 2, 15000),
(49, 1, 19, STR_TO_DATE('7/3/2025', '%m/%d/%Y'), 4, 92000),
(50, 5, 20, STR_TO_DATE('7/5/2025', '%m/%d/%Y'), 1, 5000);

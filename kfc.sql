CREATE DATABASE kfc CHARACTER SET utf8 COLLATE utf8_general_ci;      
/*CREATE DATABASE  hospital;     */                           -- สร้างฐานข้อมูล business
USE kfc;


-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` varchar(10) NOT NULL,
  `First_Name` varchar(20) NOT NULL,
  `Last_Name` varchar(20) NOT NULL,
  `Phone_Number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Customer_ID`, `First_Name`, `Last_Name`, `Phone_Number`) VALUES
('01', 'นพมาศ', 'ชานุเรือน', '0983203394'),
('02', 'เอกชัย', 'ถนอมเมือง', '0627830345'),
('03', 'วรรณนภา', 'ทองคำ', '0928788086');

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `Food_ID` varchar(3) NOT NULL,
  `Food_Name` varchar(20) NOT NULL,
  `Food_Description` varchar(300) NOT NULL,
  `Food_Price` int(11) NOT NULL,
  `Menu_ID` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`Food_ID`, `Food_Name`, `Food_Description`, `Food_Price`, `Menu_ID`) VALUES
('F01', 'ไก่ทอดสูตรผู้พัน', 'ไก่สดคัดพิเศษคลุกเคล้ากับเครื่องเทศ 11 ชนิด ปรุงสดใหม่ ทอดจนสุก เป็นไก่ทอดเนื้อนุ่มคลาสสิคสูตรต้นตำรับของเคเอฟซี', 37, '01'),
('F02', 'ไก่ฮอทแอนด์สไปซี่', 'ไก่สดคัดพิเศษชุบด้วยเกล็ดขนมปัง คลุกเคล้ากับผงพริกและเครื่องเทศ นำไปทอดจนสุกเหลืองกรอบหอมกรุ่นพร้อมเสริฟ์', 37, '01'),
('F03', 'ข้าวผู้พันแซ่บ', 'ข้าวแซ่บใหม่! อร่อยลงตัวขึ้นกับข้าวสูตรพิเศษที่หุงพร้อมเครื่องเทศ 11 ชนิด และยำไก่แซ่บรสจัดจ้าน', 69, '02'),
('F04', 'ข้าวผู้พันซี๊ด', 'ใหม่! อรอยซี๊ดลงตัวกว่าเดิมกับข้าวสูตรลับหุงด้วยเครื่องเทศ 11 ชนิด เสริฟ์พร้อมยำไก่ซี๊ดสูตรพิเศษ', 69, '02');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `Menu_ID` char(2) NOT NULL,
  `Menu_Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`Menu_ID`, `Menu_Name`) VALUES
('01', 'ไก่'),
('02', 'ข้าวและโบว์ล'),
('03', 'เบอร์เกอร์'),
('04', 'ทานเล่น'),
('05', 'เครื่องเคียง');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` varchar(10) NOT NULL,
  `Order_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Order_ID`, `Customer_ID`, `Order_Date`) VALUES
(1, '01', '2020-02-19'),
(2, '02', '2020-02-20'),
(3, '01', '2022-10-20'),
(4, '03', '2022-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `Order_ID` int(11) NOT NULL,
  `Food_ID` varchar(3) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`Order_ID`, `Food_ID`, `Quantity`) VALUES
(1, 'F01', 1),
(1, 'F02', 2),
(1, 'F03', 8),
(2, 'F01', 3),
(2, 'F02', 7),
(2, 'F03', 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`Food_ID`),
  ADD KEY `Menu_ID` (`Menu_ID`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Menu_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`Order_ID`,`Food_ID`),
  ADD KEY `Food_ID` (`Food_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `food_ibfk_1` FOREIGN KEY (`Menu_ID`) REFERENCES `menu` (`Menu_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`Food_ID`) REFERENCES `food` (`Food_ID`);
COMMIT;

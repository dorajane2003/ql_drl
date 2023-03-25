-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th3 24, 2023 lúc 02:19 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ql_diemrenluyen`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_diem_tc1`
--

CREATE TABLE `tbl_diem_tc1` (
  `mssv` bigint(20) NOT NULL,
  `ma_hocky` bigint(11) NOT NULL,
  `id_tc1` int(11) NOT NULL,
  `diem_sv_tc1` int(11) NOT NULL,
  `diem_gv_tc1` int(11) NOT NULL,
  `diem_khoa_tc1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_diem_tc2`
--

CREATE TABLE `tbl_diem_tc2` (
  `mssv` bigint(20) NOT NULL,
  `ma_hocky` int(11) NOT NULL,
  `id_tc2` int(11) NOT NULL,
  `diem_sv_tc2` int(11) NOT NULL,
  `diem_gv_tc2` int(11) NOT NULL,
  `diem_khoa_tc2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_diem_tc3`
--

CREATE TABLE `tbl_diem_tc3` (
  `mssv` bigint(20) NOT NULL,
  `ma_hocky` bigint(11) NOT NULL,
  `id_tc3` int(11) NOT NULL,
  `diem_sv_tc3` int(11) NOT NULL,
  `diem_gv_tc3` int(11) NOT NULL,
  `diem_khoa_tc3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_giangvien`
--

CREATE TABLE `tbl_giangvien` (
  `maso` bigint(20) NOT NULL,
  `ho_ten_gv` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mat_khau` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phan_quyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_giangvien`
--

INSERT INTO `tbl_giangvien` (`maso`, `ho_ten_gv`, `mat_khau`, `phan_quyen`) VALUES
(12345, 'Nguyễn Hòa', '123456', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_hocky`
--

CREATE TABLE `tbl_hocky` (
  `ma_hocky` bigint(11) NOT NULL,
  `ten_hocKy` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_khoa`
--

CREATE TABLE `tbl_khoa` (
  `maso` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ten_khoa` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ma_lop` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mat_khau` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phan_quyen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_khoa`
--

INSERT INTO `tbl_khoa` (`maso`, `ten_khoa`, `ma_lop`, `mat_khau`, `phan_quyen`) VALUES
('cntt', 'Công nghệ Thông tin', 'DCT121C2', '123456', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_lop`
--

CREATE TABLE `tbl_lop` (
  `maso` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ma_khoa` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ma_gv` bigint(20) NOT NULL,
  `ten_lop` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `so_luong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_lop`
--

INSERT INTO `tbl_lop` (`maso`, `ma_khoa`, `ma_gv`, `ten_lop`, `so_luong`) VALUES
('DCT121C2', 'cntt', 123456, 'Lớp 2 - CLC', 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_phanquyen`
--

CREATE TABLE `tbl_phanquyen` (
  `ma_phanquyen` int(11) NOT NULL,
  `ten_phanquyen` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_phanquyen`
--

INSERT INTO `tbl_phanquyen` (`ma_phanquyen`, `ten_phanquyen`) VALUES
(1, 'Học Sinh'),
(2, 'Ban Cán Sự'),
(3, 'Giảng viên hướng dẫn'),
(4, 'Quản lý của khoa'),
(5, 'Admin');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_sinhvien`
--

CREATE TABLE `tbl_sinhvien` (
  `maso` bigint(20) NOT NULL,
  `ma_lop` varchar(20) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `ho_ten` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `mat_khau` varchar(10) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phan_quyen` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_sinhvien`
--

INSERT INTO `tbl_sinhvien` (`maso`, `ma_lop`, `ho_ten`, `mat_khau`, `phan_quyen`) VALUES
(3121411027, 'DCT121C2', 'Lê Viết Cao', '123456', 1),
(3121411032, 'DCT121C2', 'Nguyễn Ngọc Kim Cương', '123456', 1),
(3121411130, 'DCT121C2', 'Huỳnh Ngọc Mẫn', '123456', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_tc1`
--

CREATE TABLE `tbl_tc1` (
  `id_tc1` int(11) NOT NULL,
  `nd_tc1` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diem_max_tc1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_tc1`
--

INSERT INTO `tbl_tc1` (`id_tc1`, `nd_tc1`, `diem_max_tc1`) VALUES
(1, 'I- Đánh giá về ý thức và kết quả học tập (tối đa 20 điểm)', 20),
(2, 'II - Đánh giá về ý thức và kết quả chấp hành quy chế, nội quy, quy định trong trường (tối đa 25 điểm)', 25),
(3, 'III - Đánh giá về ý thức và kết quả tham gia các hoạt động chính trị - xã hội, văn hóa, văn nghệ, thể thao, phòng chống các tệ nạn xã hội (tối đa 20 điểm)', 20),
(4, 'IV - Đánh giá ý thức công dân trong quan hệ cộng đồng (tối đa 25 điểm)', 25),
(5, 'V - Đánh giá về ý thức và kết quả tham gia phụ trách lớp, các đoàn thể trong nhà trường (tối đa 10 điểm)', 10),
(6, '* Điểm phải được trên 1/2 lớp đồng ý', 30);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_tc2`
--

CREATE TABLE `tbl_tc2` (
  `id_tc2` int(11) NOT NULL,
  `id_tc1` int(11) NOT NULL,
  `nd_tc2` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diem_max_tc2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_tc2`
--

INSERT INTO `tbl_tc2` (`id_tc2`, `id_tc1`, `nd_tc2`, `diem_max_tc2`) VALUES
(1, 1, '1. Kết quả học tập: TBC học kỳ trước TBC học kỳ được đánh giá', 14),
(2, 1, '2. Tinh thần vượt khó trong học tập ', 6),
(3, 1, '3. Tham gia nghiên cứu khoa học (NCKH)', 6),
(4, 1, '4. Tham gia rèn luyên nghiệp vụ (RLNV) ', 6),
(5, 1, '5. Tham gia đầy đủ các buổi hội thảo khoa học, báo cáo chuyên đề', 10),
(6, 1, '6. Thành viên đội tuyển dự thi Olympic các môn học ', 20),
(7, 2, '1. Chấp hành tốt nội quy, quy chế của nhà trường\r\n', 15),
(8, 2, '2. Tham gia đầy đủ các hoạt động học tập tại Trung tâm học liệu ', 5),
(9, 2, '3. Tham gia đầy đủ các buổi họp của trường, khoa, CVHT, lớp tổ chức :10 điểm', 10),
(10, 2, '4.Một lần vi phạm quy chế, quy định của trường, có buên bản xử lý :-10 điểm', 0),
(11, 2, '5. Vắng 01 buổi không lý do trường, khoa, CVHT, lớp tổ chức không lý do : -05 điểm ', 0),
(12, 3, '1. Tham gia các hoạt động chính trị - xã hội do nhà trường quy định ', 10),
(13, 3, '2. Tham gia hoạt động văn hóa, văn nghệ, TDTT, phòng chống tệ nạn xã hội: 05 điểm', 5),
(14, 3, '3. Tham gia trong đội tuyển văn nghệ, TDTT:', 20),
(15, 4, '1. Chấp hành tốt các chủ trương, chính sách, pháp luật, của nhà nước: 10 điểm', 10),
(16, 4, '2. Được biểu dương người tốt, việc tốt ở nhà trường hoặc ở địa phương (có giấy chứng nhận) : 05 điểm', 5),
(17, 4, '3. Tham gia các hoạt động tình nguyện trung hạn: MHX, Tiếp sức mùa thi : 10đ', 10),
(18, 4, '4. Tham gia các công tác xã hội và các hoạt động tình nguyện ngắn ngày (có xác\r\nnhận của đơn vị tổ chức): tối đa 10 điểm', 10),
(19, 4, '5. Có tinh thần chia sẻ, giúp đỡ người có khó khăn, hoạn nạn : 05đ', 5),
(20, 4, '6. Tham gia hiến máu tình nguyện : 05đ', 5),
(21, 4, '7. Tham gia hội thao GDQP –AN cấp quận, cấp TP : 05đ', 5),
(22, 4, '8. Vi phạm ATGT, trật tự công cộng (có giấy báo gửi về trường) : -10đ', 0),
(23, 5, '1. Lớp trưởng, BCH Đoàn trường, BCH Hội sinh viên trường : 10đ', 10),
(24, 5, '2. Lớp phó, BCH Đoàn khoa, BCH LCH SV; BCH CĐ, BCH chi hội lớp : 08đ', 8),
(25, 5, '3. Tổ trưởng (1 tổ tối thiểu 10 người) : 03đ', 3),
(26, 5, '4. Đảng viên : 08đ', 8),
(27, 5, '5. Đối tượng Đảng : 05đ', 5),
(28, 5, '6. Đoàn viên TNCS Hồ Chí Minh : 03đ', 3),
(29, 5, '7. Được Đoàn thanh niên, Hội sinh viên biểu dương, khen thưởng', 15),
(30, 6, '*Tham gia các họat động đặc biệt do nhà trường huy động : tối đa 15đ', 15),
(31, 6, '*Đạt giải thưởng trong các kì thi cấp tỉnh thành trở lên : tối đa 15đ', 15);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbl_tc3`
--

CREATE TABLE `tbl_tc3` (
  `id_tc3` int(11) NOT NULL,
  `id_tc2` int(11) NOT NULL,
  `nd_tc3` text COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `diem_max_tc3` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Đang đổ dữ liệu cho bảng `tbl_tc3`
--

INSERT INTO `tbl_tc3` (`id_tc3`, `id_tc2`, `nd_tc3`, `diem_max_tc3`) VALUES
(1, 1, 'a. Điểm trung bình chung học kì từ 3,60 đến 4,00 : 14đ', 14),
(2, 1, 'b. Điểm trung bình chung học kì từ 3,20 đến 3,59 : 12đ', 12),
(3, 1, 'c. Điểm trung bình chung học kì từ 2,50 đến 3,19 : 10đ', 10),
(4, 1, 'd. Điểm trung bình chung học kì từ 2,00 đến 2,49 : 07đ', 7),
(5, 1, 'đ. Điểm trung bình chung học kì dưới 2,00 : 00đ', 0),
(6, 2, 'a. Kết quả học tập tăng một bậc so với học kỳ trước, ĐTBCHK từ 2,00 trở lên : 03đ', 3),
(7, 2, 'b. Kết quả học tập tăng hai bậc so với học kỳ trước, ĐTBCHK từ 2,00 trở lên : 06đ', 6),
(8, 2, 'c. Sinh viên năm thứ I, nếu có kết quả học tập HK I từ 2,00 trở lên : 03đ', 3),
(9, 3, 'a. Khóa luận tốt nghiệp từ loại giỏi trở lên : 06đ', 6),
(10, 3, 'b. Đề tài NCKH cấp trường từ loại giỏi trở lên : 06đ', 6),
(11, 3, 'c. Đề tài NCKH cấp trường từ loại đạt trở lên : 05đ', 5),
(12, 4, 'a. Tham gia hội thi RLNV cấp khoa : 02đ', 2),
(13, 4, 'b. Tham gia hội thi RLNV cấp trường : 04đ', 4),
(14, 4, 'c. Tham gia hội thi RLNV toàn quốc : 04đ', 4),
(15, 4, 'd. Tham gia đầy đủ các buổi hội thảo khoa học, báo cáo chuyên đề : 02đ', 2),
(16, 5, 'a. Ban chủ nhiệm câu lạc bộ cấp khoa : 04đ', 4),
(17, 5, 'b. Ban chủ nhiệm câu lạc bộ cấp trường : 06đ', 6),
(18, 5, 'c. Thành viên tham gia thường xuyên các câu lạc bộ học thuật : 02đ', 2),
(19, 6, 'a. Cấp khoa : 04đ', 4),
(20, 6, 'b. Cấp trường : 06đ', 6),
(21, 6, 'c. Cấp toàn quốc : 10đ', 10),
(22, 12, 'a. Tham gia đầy đủ các buổi sinh hoạt chính trị xã hội theo quy định : 10đ', 10),
(23, 12, 'b. Vắng mặt 01 buổi không lý do : -05đ', 0),
(24, 14, 'a. Cấp khoa : 05đ', 5),
(25, 14, 'b. Cấp trường : 10đ', 10),
(26, 14, 'c. Được khen thưởng cấp toàn quốc : 15đ', 15);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `tbl_diem_tc1`
--
ALTER TABLE `tbl_diem_tc1`
  ADD PRIMARY KEY (`mssv`);

--
-- Chỉ mục cho bảng `tbl_diem_tc2`
--
ALTER TABLE `tbl_diem_tc2`
  ADD PRIMARY KEY (`mssv`);

--
-- Chỉ mục cho bảng `tbl_diem_tc3`
--
ALTER TABLE `tbl_diem_tc3`
  ADD PRIMARY KEY (`mssv`);

--
-- Chỉ mục cho bảng `tbl_giangvien`
--
ALTER TABLE `tbl_giangvien`
  ADD PRIMARY KEY (`maso`);

--
-- Chỉ mục cho bảng `tbl_hocky`
--
ALTER TABLE `tbl_hocky`
  ADD PRIMARY KEY (`ma_hocky`);

--
-- Chỉ mục cho bảng `tbl_khoa`
--
ALTER TABLE `tbl_khoa`
  ADD PRIMARY KEY (`maso`);

--
-- Chỉ mục cho bảng `tbl_lop`
--
ALTER TABLE `tbl_lop`
  ADD PRIMARY KEY (`maso`);

--
-- Chỉ mục cho bảng `tbl_phanquyen`
--
ALTER TABLE `tbl_phanquyen`
  ADD PRIMARY KEY (`ma_phanquyen`);

--
-- Chỉ mục cho bảng `tbl_sinhvien`
--
ALTER TABLE `tbl_sinhvien`
  ADD PRIMARY KEY (`maso`);

--
-- Chỉ mục cho bảng `tbl_tc1`
--
ALTER TABLE `tbl_tc1`
  ADD PRIMARY KEY (`id_tc1`);

--
-- Chỉ mục cho bảng `tbl_tc2`
--
ALTER TABLE `tbl_tc2`
  ADD PRIMARY KEY (`id_tc2`);

--
-- Chỉ mục cho bảng `tbl_tc3`
--
ALTER TABLE `tbl_tc3`
  ADD PRIMARY KEY (`id_tc3`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `tbl_giangvien`
--
ALTER TABLE `tbl_giangvien`
  MODIFY `maso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12346;

--
-- AUTO_INCREMENT cho bảng `tbl_sinhvien`
--
ALTER TABLE `tbl_sinhvien`
  MODIFY `maso` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3121411131;

--
-- AUTO_INCREMENT cho bảng `tbl_tc1`
--
ALTER TABLE `tbl_tc1`
  MODIFY `id_tc1` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `tbl_tc2`
--
ALTER TABLE `tbl_tc2`
  MODIFY `id_tc2` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `tbl_tc3`
--
ALTER TABLE `tbl_tc3`
  MODIFY `id_tc3` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

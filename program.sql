-- =========================
-- DATABASE
-- =========================
DROP DATABASE IF EXISTS praktikum2_kelompok8;
CREATE DATABASE praktikum2_kelompok8;
USE praktikum2_kelompok8;

-- =========================
-- BAGIAN A
-- =========================
DROP PROCEDURE IF EXISTS bagian_a;
DELIMITER $$

CREATE PROCEDURE bagian_a(
    IN p_nama VARCHAR(100),
    IN p_nim VARCHAR(20),
    IN p_semester INT,
    IN p_prodi VARCHAR(100)
)
BEGIN
    DECLARE v_kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';

    SELECT CONCAT(
        'Mahasiswa ', p_nama,
        ' (', p_nim, ') dari Program Studi ',
        p_prodi, ' terdaftar di ',
        v_kampus, ' pada semester ',
        p_semester, '.'
    ) AS identitas;
END $$

DELIMITER ;

-- =========================
-- BAGIAN B
-- =========================
DROP PROCEDURE IF EXISTS bagian_b;
DELIMITER $$

CREATE PROCEDURE bagian_b(
    IN p_jumlah_sks INT,
    IN p_ipk DECIMAL(3,2),
    IN p_status_ukt VARCHAR(20),
    IN p_semester INT
)
BEGIN
    DECLARE v_status_data VARCHAR(20);
    DECLARE v_beban_studi VARCHAR(20);
    DECLARE v_performa VARCHAR(30);

    IF UPPER(p_status_ukt) = 'LUNAS' AND p_semester > 0 AND p_jumlah_sks > 0 THEN
        SET v_status_data = 'Valid';
    ELSE
        SET v_status_data = 'Tidak Valid';
    END IF;

    IF p_jumlah_sks BETWEEN 1 AND 12 THEN
        SET v_beban_studi = 'Ringan';
    ELSEIF p_jumlah_sks BETWEEN 13 AND 18 THEN
        SET v_beban_studi = 'Sedang';
    ELSEIF p_jumlah_sks BETWEEN 19 AND 24 THEN
        SET v_beban_studi = 'Padat';
    ELSE
        SET v_beban_studi = 'Tidak Diketahui';
    END IF;

    IF p_ipk >= 3.50 THEN
        SET v_performa = 'Sangat Baik';
    ELSEIF p_ipk >= 3.00 THEN
        SET v_performa = 'Baik';
    ELSEIF p_ipk >= 2.50 THEN
        SET v_performa = 'Cukup';
    ELSE
        SET v_performa = 'Perlu Pembinaan';
    END IF;

    SELECT
        v_status_data AS status_data,
        v_beban_studi AS beban_studi,
        v_performa AS performa_akademik;
END $$

DELIMITER ;

-- =========================
-- BAGIAN C
-- =========================
DROP PROCEDURE IF EXISTS bagian_c;
DELIMITER $$

CREATE PROCEDURE bagian_c(
    IN p_nama VARCHAR(100),
    IN p_nim VARCHAR(20),
    IN p_semester INT,
    IN p_prodi VARCHAR(100),
    IN p_jumlah_sks INT,
    IN p_ipk DECIMAL(3,2),
    IN p_status_ukt VARCHAR(20)
)
BEGIN
    DECLARE v_kampus VARCHAR(100) DEFAULT 'Universitas Mega Buana Palopo';
    DECLARE v_layak VARCHAR(20);
    DECLARE v_beban VARCHAR(20);
    DECLARE v_performa VARCHAR(30);
    DECLARE v_alasan TEXT;
    DECLARE v_ringkasan TEXT;

    IF UPPER(p_status_ukt) = 'LUNAS' AND p_semester > 0 AND p_jumlah_sks > 0 THEN
        SET v_layak = 'Layak';
        SET v_alasan = 'Data akademik lengkap dan UKT telah dilunasi.';
    ELSE
        SET v_layak = 'Tidak Layak';

        IF UPPER(p_status_ukt) != 'LUNAS' THEN
            SET v_alasan = 'UKT belum dilunasi.';
        ELSEIF p_semester <= 0 THEN
            SET v_alasan = 'Semester tidak valid.';
        ELSE
            SET v_alasan = 'Jumlah SKS tidak valid.';
        END IF;
    END IF;

    IF p_jumlah_sks BETWEEN 1 AND 12 THEN
        SET v_beban = 'Ringan';
    ELSEIF p_jumlah_sks BETWEEN 13 AND 18 THEN
        SET v_beban = 'Sedang';
    ELSEIF p_jumlah_sks BETWEEN 19 AND 24 THEN
        SET v_beban = 'Padat';
    ELSE
        SET v_beban = 'Tidak Diketahui';
    END IF;

    IF p_ipk >= 3.50 THEN
        SET v_performa = 'Sangat Baik';
    ELSEIF p_ipk >= 3.00 THEN
        SET v_performa = 'Baik';
    ELSEIF p_ipk >= 2.50 THEN
        SET v_performa = 'Cukup';
    ELSE
        SET v_performa = 'Perlu Pembinaan';
    END IF;

    SET v_ringkasan = CONCAT(
        'Mahasiswa ', p_nama, ' dengan NIM ', p_nim,
        ' dinyatakan ', v_layak, ' mengambil KRS. ',
        'Beban studi ', v_beban,
        ' dengan performa ', v_performa, '.'
    );

    SELECT
        CONCAT(p_nama, ' (', p_nim, ')') AS Identitas,
        p_prodi AS `Program Studi`,
        v_kampus AS Kampus,
        p_semester AS Semester,
        v_layak AS `Kelayakan KRS`,
        v_beban AS `Beban Studi`,
        v_performa AS `Performa Akademik`,
        v_alasan AS Alasan,
        v_ringkasan AS Ringkasan;
END $$

DELIMITER ;

-- =========================
-- BAGIAN D
-- =========================
DROP PROCEDURE IF EXISTS bagian_d;
DELIMITER $$

CREATE PROCEDURE bagian_d(
    IN p_nama1 VARCHAR(100), IN p_nim1 VARCHAR(20),
    IN p_semester1 INT, IN p_sks1 INT,
    IN p_ipk1 DECIMAL(3,2), IN p_ukt1 VARCHAR(20),

    IN p_nama2 VARCHAR(100), IN p_nim2 VARCHAR(20),
    IN p_semester2 INT, IN p_sks2 INT,
    IN p_ipk2 DECIMAL(3,2), IN p_ukt2 VARCHAR(20)
)
BEGIN
    DECLARE v_kesimpulan TEXT;

    -- tampilkan data kedua mahasiswa
    SELECT 
        p_nama1 AS Nama,
        p_nim1 AS NIM,
        p_semester1 AS Semester,
        p_sks1 AS SKS,
        p_ipk1 AS IPK,
        p_ukt1 AS Status_UKT
    UNION ALL
    SELECT 
        p_nama2,
        p_nim2,
        p_semester2,
        p_sks2,
        p_ipk2,
        p_ukt2;

    -- logika perbandingan
    IF p_ipk1 > p_ipk2 THEN
        SET v_kesimpulan = CONCAT(p_nama1, ' memiliki performa akademik lebih baik dibanding ', p_nama2);
    ELSEIF p_ipk2 > p_ipk1 THEN
        SET v_kesimpulan = CONCAT(p_nama2, ' memiliki performa akademik lebih baik dibanding ', p_nama1);
    ELSE
        IF p_sks1 > p_sks2 THEN
            SET v_kesimpulan = CONCAT(p_nama1, ' memiliki performa akademik lebih baik dibanding ', p_nama2);
        ELSEIF p_sks2 > p_sks1 THEN
            SET v_kesimpulan = CONCAT(p_nama2, ' memiliki performa akademik lebih baik dibanding ', p_nama1);
        ELSE
            SET v_kesimpulan = 'Kedua mahasiswa memiliki performa akademik yang setara';
        END IF;
    END IF;

    SELECT v_kesimpulan AS kesimpulan;

END $$

DELIMITER ;

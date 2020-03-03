-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 04 2020 г., 00:21
-- Версия сервера: 10.1.38-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myschool`
--

-- --------------------------------------------------------

--
-- Структура таблицы `grade`
--

CREATE TABLE `grade` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TEXT` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `grade`
--

INSERT INTO `grade` (`ID`, `NAME`, `TEXT`) VALUES
(1, '1', 'плохо'),
(2, '2', 'неудовлетворительно'),
(3, '3', 'удовлетворительно'),
(4, '4', 'хорошо'),
(5, '5', 'отлично');

-- --------------------------------------------------------

--
-- Структура таблицы `history`
--

CREATE TABLE `history` (
  `ID` bigint(20) NOT NULL,
  `RECORD` datetime DEFAULT NULL,
  `GRADE_ID` bigint(20) DEFAULT NULL,
  `PERSON_ID` bigint(20) DEFAULT NULL,
  `SUBJECT_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `history`
--

INSERT INTO `history` (`ID`, `RECORD`, `GRADE_ID`, `PERSON_ID`, `SUBJECT_ID`) VALUES
(13, '2020-03-03 18:51:05', 5, 8, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `person`
--

INSERT INTO `person` (`ID`, `NAME`) VALUES
(1, 'Ivan Ivanoff'),
(8, 'mark'),
(9, 'teacher');

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `ID` bigint(20) NOT NULL,
  `ROLE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`ID`, `ROLE`) VALUES
(1, 'ADMIN'),
(2, 'MANAGER'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Структура таблицы `subject`
--

CREATE TABLE `subject` (
  `ID` bigint(20) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `TEACHER` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `subject`
--

INSERT INTO `subject` (`ID`, `NAME`, `TEACHER`) VALUES
(1, 'Физика', 'Fisik'),
(2, 'Химия', 'Himic'),
(3, 'Литература', 'Literatura'),
(4, 'Физкультура', 'Fiskult');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `ID` bigint(20) NOT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `SALTS` varchar(255) DEFAULT NULL,
  `PERSON_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`ID`, `LOGIN`, `PASSWORD`, `SALTS`, `PERSON_ID`) VALUES
(1, 'admin', '8ee712584fea83c1d0dc363a500eeb90176cde823784916a192e370b04d2c762', '6a55af450dd8bb9e1a19029ac85d28d0', 1),
(8, 'mark', '626fec8280409587c3351212faf6245d046ea7a5678b2ea44ef720d42ef8f913', '9d7cbcc7a548a546ac9ca1ec9db02e1c', 8),
(9, 'teacher', '6c082beb7d0fa909df5f65d931b66a23e4180569da0fe19b1719241efef1ef9b', '39ec15af5eb0e6dfa8dcef3674b6586e', 9);

-- --------------------------------------------------------

--
-- Структура таблицы `userroles`
--

CREATE TABLE `userroles` (
  `ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `userroles`
--

INSERT INTO `userroles` (`ID`, `ROLE_ID`, `USER_ID`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 2, 9),
(5, 1, 9),
(7, 3, 9);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_HISTORY_GRADE_ID` (`GRADE_ID`),
  ADD KEY `FK_HISTORY_PERSON_ID` (`PERSON_ID`),
  ADD KEY `FK_HISTORY_SUBJECT_ID` (`SUBJECT_ID`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ROLE` (`ROLE`);

--
-- Индексы таблицы `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `LOGIN` (`LOGIN`),
  ADD KEY `FK_USER_PERSON_ID` (`PERSON_ID`);

--
-- Индексы таблицы `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_USERROLES_USER_ID` (`USER_ID`),
  ADD KEY `FK_USERROLES_ROLE_ID` (`ROLE_ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `grade`
--
ALTER TABLE `grade`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `history`
--
ALTER TABLE `history`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `person`
--
ALTER TABLE `person`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `subject`
--
ALTER TABLE `subject`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `userroles`
--
ALTER TABLE `userroles`
  MODIFY `ID` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `FK_HISTORY_GRADE_ID` FOREIGN KEY (`GRADE_ID`) REFERENCES `grade` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`),
  ADD CONSTRAINT `FK_HISTORY_SUBJECT_ID` FOREIGN KEY (`SUBJECT_ID`) REFERENCES `subject` (`ID`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_USER_PERSON_ID` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`ID`);

--
-- Ограничения внешнего ключа таблицы `userroles`
--
ALTER TABLE `userroles`
  ADD CONSTRAINT `FK_USERROLES_ROLE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  ADD CONSTRAINT `FK_USERROLES_USER_ID` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

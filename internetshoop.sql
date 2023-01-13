-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 13 Sty 2023, 10:14
-- Wersja serwera: 10.4.25-MariaDB
-- Wersja PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `internetshoop`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `customers`
--

INSERT INTO `customers` (`customer_id`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', 'password'),
(2, 'Jane', 'Doe', 'janedoe@example.com', 'password'),
(3, 'Bob', 'Smith', 'bobsmith@example.com', 'password');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `details` text DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`order_id`, `customer_id`, `order_date`, `details`, `order_status`) VALUES
(1, 1, '2022-01-01', 'Order details for order 1', 'Completed'),
(2, 2, '2022-02-01', 'Order details for order 2', 'Processing'),
(3, 3, '2022-03-01', 'Order details for order 3', 'Cancelled');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_has_products`
--

CREATE TABLE `order_has_products` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `order_has_products`
--

INSERT INTO `order_has_products` (`order_id`, `product_id`, `quantity`, `price`) VALUES
(1, 1, 2, '39.98'),
(1, 2, 1, '29.99'),
(2, 2, 2, '59.98'),
(3, 3, 1, '39.99');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `products`
--

INSERT INTO `products` (`product_id`, `name`, `price`, `description`, `image`, `category`) VALUES
(1, 'Product 1', '19.99', 'Description for product 1', 'product1.jpg', 'Category 1'),
(2, 'Product 2', '29.99', 'Description for product 2', 'product2.jpg', 'Category 2'),
(3, 'Product 3', '39.99', 'Description for product 3', 'product3.jpg', 'Category 1');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indeksy dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indeksy dla tabeli `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indeksy dla tabeli `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Ograniczenia dla tabeli `order_has_products`
--
ALTER TABLE `order_has_products`
  ADD CONSTRAINT `order_has_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_has_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

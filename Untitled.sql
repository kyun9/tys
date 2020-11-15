CREATE TABLE `users` (
  `user_id` varchar(50) PRIMARY KEY,
  `user_pw` varchar(50) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_image` varchar(50),
  `user_deptno` int NOT NULL,
  `user_pos` int NOT NULL,
  `user_check` int DEFAULT 0
);

CREATE TABLE `boards` (
  `b_num` int PRIMARY KEY AUTO_INCREMENT,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(900) NOT NULL,
  `b_date` datetime DEFAULT (now()),
  `b_cnt` int NOT NULL,
  `b_userid` varchar(50) NOT NULL,
  `b_type` int NOT NULL,
  `b_update` datetime DEFAULT (now()),
  `b_updateuser` varchar(50) NOT NULL
);

CREATE TABLE `notices` (
  `n_num` int PRIMARY KEY AUTO_INCREMENT,
  `n_title` varchar(255) NOT NULL,
  `n_content` varchar(900) NOT NULL,
  `n_date` datetime DEFAULT (now()),
  `n_cnt` int NOT NULL,
  `n_userid` varchar(50) NOT NULL,
  `n_type` int NOT NULL,
  `n_update` datetime DEFAULT (now()),
  `n_updateuser` varchar(50) NOT NULL
);

CREATE TABLE `dept` (
  `d_num` int PRIMARY KEY AUTO_INCREMENT,
  `d_name` varchar(50) NOT NULL
);

CREATE TABLE `position` (
  `p_num` int PRIMARY KEY AUTO_INCREMENT,
  `p_name` varchar(50) NOT NULL
);

ALTER TABLE `boards` ADD FOREIGN KEY (`b_userid`) REFERENCES `users` (`user_id`) on delete cascade;

ALTER TABLE `notices` ADD FOREIGN KEY (`n_userid`) REFERENCES `users` (`user_id`) on delete cascade;

ALTER TABLE `users` ADD FOREIGN KEY (`user_deptno`) REFERENCES `dept` (`d_num`) on delete cascade;

ALTER TABLE `users` ADD FOREIGN KEY (`user_pos`) REFERENCES `position` (`p_num`) on delete cascade;

ALTER TABLE `notices` ADD FOREIGN KEY (`n_type`) REFERENCES `dept` (`d_num`) on delete cascade;

ALTER TABLE `boards` ADD FOREIGN KEY (`b_type`) REFERENCES `dept` (`d_num`) on delete cascade;

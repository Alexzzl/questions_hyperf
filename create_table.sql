CREATE TABLE `email_code` (
                              `id` int(11) NOT NULL AUTO_INCREMENT,
                              `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '邮箱',
                              `code` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '验证码',
                              `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
                              PRIMARY KEY (`id`),
                              KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='邮箱验证码记录表';

CREATE TABLE `users` (
                         `id` int(11) NOT NULL AUTO_INCREMENT,
                         `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
                         `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
                         `pic` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
                         `nickname` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
                         `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

CREATE TABLE `user_dynamic` (
                                `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'uid',
                                `answers` int(11) NOT NULL DEFAULT '0' COMMENT '回答数',
                                `supports` int(11) NOT NULL DEFAULT '0' COMMENT '被点赞数',
                                UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户-动态数据表';

CREATE TABLE `question` (
                            `id` int(11) NOT NULL AUTO_INCREMENT,
                            `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'uid',
                            `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
                            `content_path` varchar(100) NOT NULL DEFAULT '' COMMENT '内容地址',
                            `content_hash` varchar(64) NOT NULL DEFAULT '' COMMENT '内容的hash值',
                            `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
                            `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `content_hash` (`content_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题表';

CREATE TABLE `question_dynamic` (
                                    `question_id` int(11) NOT NULL COMMENT '问题id',
                                    `views` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数',
                                    `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
                                    `replys` int(11) NOT NULL DEFAULT '0' COMMENT '回复数',
                                    `supports` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
                                    UNIQUE KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题-动态数据表';

CREATE TABLE `answer` (
                          `id` int(11) NOT NULL AUTO_INCREMENT,
                          `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户uid',
                          `question_id` int(11) NOT NULL DEFAULT '0' COMMENT '问题id',
                          `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
                          `content` varchar(500) NOT NULL DEFAULT '' COMMENT '回复内容',
                          `supports` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
                          `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
                          PRIMARY KEY (`id`),
                          KEY `question_id` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题回复表';
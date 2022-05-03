/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50537
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50537
 File Encoding         : 65001

 Date: 03/05/2022 22:20:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stateCode` int(10) NULL DEFAULT 0,
  `isBan` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', '123456', 1, 0);
INSERT INTO `admin` VALUES ('倦收天', '123456', 0, 1);
INSERT INTO `admin` VALUES ('剑非道', '123456', 0, 1);
INSERT INTO `admin` VALUES ('商清逸', '123456', 0, 0);
INSERT INTO `admin` VALUES ('暴雨心奴', '123456', 0, 0);
INSERT INTO `admin` VALUES ('最光阴', '123456', 0, 0);
INSERT INTO `admin` VALUES ('李坤彪', '123456', 0, 0);
INSERT INTO `admin` VALUES ('猫猫', '123', 0, 0);
INSERT INTO `admin` VALUES ('绮罗生', '123456', 0, 0);
INSERT INTO `admin` VALUES ('轩龙凌绝顶', '123456', 0, 0);

-- ----------------------------
-- Table structure for book_info
-- ----------------------------
DROP TABLE IF EXISTS `book_info`;
CREATE TABLE `book_info`  (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `author` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `publish` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ISBN` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `language` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `pub_date` date NOT NULL,
  `class_id` int(11) NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`) USING BTREE,
  INDEX `class_id`(`class_id`) USING BTREE,
  CONSTRAINT `class_id` FOREIGN KEY (`class_id`) REFERENCES `class_info` (`class_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 270 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `book_info` VALUES (1, '大雪中的山庄', '东野圭吾 ', '北京十月文艺出版社', '9787530216835', '东野圭吾长篇小说杰作，中文简体首次出版。 一出没有剧本的舞台剧，为什么能让七个演员赌上全部人生.东野圭吾就是有这样过人的本领，能从充满悬念的案子写出荡气回肠的情感，在极其周密曲折的同时写出人性的黑暗与美丽。 一家与外界隔绝的民宿里，七个演员被要求住满四天，接受导演的考验，但不断有人失踪。难道这并非正常排练，而是有人布下陷阱要杀他们。 那时候我开始喜欢上戏剧和音乐，《大雪中的山庄》一书的灵感就来源于此。我相信这次的诡计肯定会让人大吃一惊。——东野圭吾', '中文', 35.00, '2017-06-01', 9, 7);
INSERT INTO `book_info` VALUES (2, '三生三世 十里桃花', '唐七公子 ', '沈阳出版社', '9787544138000', '三生三世，她和他，是否注定背负一段纠缠的姻缘？三生三世，她和他，是否终能互许一个生生世世的承诺？', '中文', 26.80, '2009-01-06', 7, 8);
INSERT INTO `book_info` VALUES (3, '何以笙箫默', '顾漫 ', '朝华出版社', '9787505414709', '一段年少时的爱恋，牵出一生的纠缠。大学时代的赵默笙阳光灿烂，对法学系大才子何以琛一见倾心，开朗直率的她拔足倒追，终于使才气出众的他为她停留驻足。然而，不善表达的他终于使她在一次伤心之下远走他乡……', '中文', 15.00, '2007-04-03', 7, 16);
INSERT INTO `book_info` VALUES (4, '11处特工皇妃', '潇湘冬儿', '江苏文艺出版社', '9787539943893', '《11处特工皇妃(套装上中下册)》内容简介：她是国安局军情十一处惊才绝艳的王牌军师——收集情报、策划部署、进不友好国家布置暗杀任务……她运筹帷幄之中，决胜于千里之外，堪称军情局大厦的定海神针。', '中文', 74.80, '2011-05-05', 7, 20);
INSERT INTO `book_info` VALUES (5, '人类简史', '[以色列] 尤瓦尔·赫拉利 ', '中信出版社', '9787508647357', '十万年前，地球上至少有六种不同的人但今日，世界舞台为什么只剩下了我们自己？从只能啃食虎狼吃剩的残骨的猿人，到跃居食物链顶端的智人，从雪维洞穴壁上的原始人手印，到阿姆斯壮踩上月球的脚印，从认知革命、农业革命，到科学革命、生物科技革命，我们如何登上世界舞台成为万物之灵的？从公元前1776年的《汉摩拉比法典》，到1776年的美国独立宣言，从帝国主义、资本主义，到自由主义、消费主义，从兽欲，到物欲，从兽性、人性，到神性，我们了解自己吗？我们过得更快乐吗？我们究竟希望自己得到什么、变成什么？', '英文', 68.00, '2014-11-01', 11, 16);
INSERT INTO `book_info` VALUES (6, '明朝那些事儿（1-9）', '当年明月 ', '中国海关出版社', '9787801656087', '《明朝那些事儿》讲述从1344年到1644年，明朝三百年间的历史。作品以史料为基础，以年代和具体人物为主线，运用小说的笔法，对明朝十七帝和其他王公权贵和小人物的命运进行全景展示，尤其对官场政治、战争、帝王心术着墨最多。作品也是一部明朝政治经济制度、人伦道德的演义。', '中文', 358.20, '2009-04-06', 10, 30);
INSERT INTO `book_info` VALUES (7, '经济学原理（上下）', '[美] 曼昆 ', '机械工业出版社', '9787111126768', '此《经济学原理》的第3版把较多篇幅用于应用与政策，较少篇幅用于正规的经济理论。书中主要从供给与需求、企业行为与消费者选择理论、长期经济增长与短期经济波动以及宏观经济政策等角度深入浅出地剖析了经济学家们的世界观。', '英文', 88.00, '2003-08-05', 6, 8);
INSERT INTO `book_info` VALUES (8, '方向', '马克-安托万·马修 ', '后浪丨北京联合出版公司', '9787020125265', '《方向》即便在马修的作品中也算得最独特的：不着一字，尽得风流。原作本无一字，标题只是一个→，出版时才加了个书名Sens——既可以指“方向”，也可以指“意义”。 《方向》没有“字”，但有自己的语言——请读者在尽情释放想象力和独立思考之余，破解作者的密码，听听作者对荒诞的看法。', '中文', 99.80, '2017-04-01', 9, 7);
INSERT INTO `book_info` VALUES (9, '画的秘密', '马克-安托万·马修 ', '北京联合出版公司·后浪出版公司', '9787550265608', '一本关于友情的疗伤图像小说，直击人内心最为隐秘的情感。 一部追寻艺术的纸上悬疑电影，揭示命运宇宙中奇诡的真相。 ★ 《画的秘密》荣获欧洲第二大漫画节“瑞士谢尔漫画节最佳作品奖”。 作者曾两度夺得安古兰国际漫画节重要奖项。 ★ 《画的秘密》是一部罕见的、结合了拼贴、镜像、3D等叙事手法的实验型漫画作品。作者巧妙地调度光线、纬度、时间、记忆，在一个悬念重重又温情治愈的故事中，注入了一个有关命运的哲学议题。', '中文', 60.00, '2016-01-01', 9, 9);
INSERT INTO `book_info` VALUES (10, '造彩虹的人', '东野圭吾 ', '北京十月文艺出版社', '9787530216859', '其实每个人身上都会发光，但只有纯粹渴求光芒的人才能看到。 从那一刻起，人生会发生奇妙的转折。功一高中退学后无所事事，加入暴走族消极度日；政史备战高考却无法集中精神，几近崩溃；辉美因家庭不和对生活失去勇气，决定自杀。面对糟糕的人生，他们无所适从，直到一天夜里，一道如同彩虹的光闯进视野。 凝视着那道光，原本几乎要耗尽的气力，源源不断地涌了出来。一切又开始充满希望。打起精神来，不能输。到这儿来呀，快来呀——那道光低声呼唤着。 他们追逐着呼唤，到达一座楼顶，看到一个人正用七彩绚烂的光束演奏出奇妙的旋律。 他们没想到，这一晚看到的彩虹，会让自己的人生彻底转...', '中文', 39.50, '2017-06-01', 9, 8);
INSERT INTO `book_info` VALUES (11, '控方证人', '阿加莎·克里斯蒂 ', '新星出版社', '9787513325745', '经典同名话剧六十年常演不衰； 比利•怀尔德执导同名电影，获奥斯卡金像奖六项提名！ 阿加莎对神秘事物的向往大约来自于一种女性祖先的遗传，在足不出户的生活里，生出对世界又好奇又恐惧的幻想。 ——王安忆 伦纳德•沃尔被控谋杀富婆艾米丽以图染指其巨额遗产，他却一再表明自己的无辜。伦纳德的妻子是唯一能够证明他无罪的证人，却以控方证人的身份出庭指证其确实犯有谋杀罪。伦纳德几乎陷入绝境，直到一个神秘女人的出现…… 墙上的犬形图案；召唤死亡的收音机；蓝色瓷罐的秘密；一只疯狂的灰猫……十一篇神秘的怪谈，最可怕的不是“幽灵”，而是你心中的魔鬼。', '中文', 35.00, '2017-05-01', 9, 7);
INSERT INTO `book_info` VALUES (12, '少有人走的路', 'M·斯科特·派克 ', '吉林文史出版社', '9787807023777', '这本书处处透露出沟通与理解的意味，它跨越时代限制，帮助我们探索爱的本质，引导我们过上崭新，宁静而丰富的生活；它帮助我们学习爱，也学习独立；它教诲我们成为更称职的、更有理解心的父母。归根到底，它告诉我们怎样找到真正的自我。 正如开篇所言：人生苦难重重。M·斯科特·派克让我们更加清楚：人生是一场艰辛之旅，心智成熟的旅程相当漫长。但是，他没有让我们感到恐惧，相反，他带领我们去经历一系列艰难乃至痛苦的转变，最终达到自我认知的更高境界。', '中文', 26.00, '2007-01-01', 9, 7);
INSERT INTO `book_info` VALUES (13, '追寻生命的意义', '[奥] 维克多·弗兰克 ', '新华出版社', '9787501162734', '《追寻生命的意义》是一个人面对巨大的苦难时，用来拯救自己的内在世界，同时也是一个关于每个人存在的价值和能者多劳们生存的社会所应担负职责的思考。本书对于每一个想要了解我们这个时代的人来说，都是一部必不可少的读物。这是一部令人鼓舞的杰作……他是一个不可思议的人，任何人都可以从他无比痛苦的经历中，获得拯救自己的经验……高度推荐。', '中文', 12.00, '2003-01-01', 9, 8);
INSERT INTO `book_info` VALUES (14, '秘密花园', '乔汉娜·贝斯福 ', '北京联合出版公司', '9787550252585', '欢迎来到秘密花园！ 在这个笔墨编织出的美丽世界中漫步吧 涂上你喜爱的颜色，为花园带来生机和活力 发现隐藏其中的各类小生物，与它们共舞 激活创造力，描绘那些未完成的仙踪秘境 各个年龄段的艺术家和“园丁”都可以来尝试喔！', '中文', 42.00, '2015-06-01', 9, 8);
INSERT INTO `book_info` VALUES (75, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (76, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (77, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (78, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (79, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (80, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (81, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (82, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (91, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (92, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (152, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (153, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (154, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (155, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (156, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (157, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (158, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (159, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (160, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (161, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (162, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (163, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (164, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (165, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (166, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (167, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (168, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (169, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (170, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (171, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (172, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (173, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (174, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (175, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (178, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (179, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (180, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (181, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (182, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (183, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (184, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (185, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (186, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (187, '1', '李坤彪', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (190, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (191, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (192, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (193, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (194, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (195, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (196, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (197, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (198, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (199, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (200, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (201, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (202, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (203, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (204, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (205, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (206, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (207, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (208, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (209, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (210, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (211, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (212, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (213, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (214, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (215, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (216, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (220, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (229, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (230, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (232, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (233, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (234, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (236, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (237, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (238, '1', '我', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (247, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (248, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (249, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (250, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (251, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (252, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (253, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (254, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (255, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (256, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (257, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (258, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (259, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (260, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (261, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (262, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (263, '1', '101', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (264, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (265, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (266, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (267, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (268, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);
INSERT INTO `book_info` VALUES (269, '1', '1', '1', '1', '1', '1', 1.00, '2022-03-30', 1, 9);

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`  (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info` VALUES (1, '马克思主义');
INSERT INTO `class_info` VALUES (2, '哲学');
INSERT INTO `class_info` VALUES (3, '社会科学总论');
INSERT INTO `class_info` VALUES (4, '政治法律');
INSERT INTO `class_info` VALUES (5, '军事');
INSERT INTO `class_info` VALUES (6, '经济');
INSERT INTO `class_info` VALUES (7, '文化');
INSERT INTO `class_info` VALUES (8, '语言');
INSERT INTO `class_info` VALUES (9, '文学');
INSERT INTO `class_info` VALUES (10, '艺术');
INSERT INTO `class_info` VALUES (11, '历史地理');
INSERT INTO `class_info` VALUES (12, '自然科学总论');
INSERT INTO `class_info` VALUES (13, ' 数理科学和化学');
INSERT INTO `class_info` VALUES (14, '天文学、地球科学');
INSERT INTO `class_info` VALUES (15, '生物科学');
INSERT INTO `class_info` VALUES (16, '医药、卫生');
INSERT INTO `class_info` VALUES (17, '农业科学');
INSERT INTO `class_info` VALUES (18, '工业技术');
INSERT INTO `class_info` VALUES (19, '交通运输');
INSERT INTO `class_info` VALUES (20, '航空、航天');
INSERT INTO `class_info` VALUES (21, '环境科学');
INSERT INTO `class_info` VALUES (22, '综合');

-- ----------------------------
-- Table structure for lend_list
-- ----------------------------
DROP TABLE IF EXISTS `lend_list`;
CREATE TABLE `lend_list`  (
  `ser_num` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) NOT NULL,
  `read_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lend_date` datetime NULL DEFAULT NULL,
  `back_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`ser_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of lend_list
-- ----------------------------
INSERT INTO `lend_list` VALUES (1, 2, '商清逸', '2022-04-29 08:22:46', '2022-04-29 08:23:05');
INSERT INTO `lend_list` VALUES (2, 2, '李坤彪', '2022-04-29 08:30:49', '2022-05-03 17:26:31');

-- ----------------------------
-- Table structure for reader_info
-- ----------------------------
DROP TABLE IF EXISTS `reader_info`;
CREATE TABLE `reader_info`  (
  `read_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`read_id`) USING BTREE,
  CONSTRAINT `read_id` FOREIGN KEY (`read_id`) REFERENCES `admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of reader_info
-- ----------------------------
INSERT INTO `reader_info` VALUES ('倦收天', '男', '2022-04-01', '上海', '15361713424');
INSERT INTO `reader_info` VALUES ('剑非道', '男', '2022-03-30', 'a', '18813321979');
INSERT INTO `reader_info` VALUES ('商清逸', '男', '2022-04-01', 'a', '14523215544');
INSERT INTO `reader_info` VALUES ('暴雨心奴', '男', '2022-04-16', '合肥', '15435415465');
INSERT INTO `reader_info` VALUES ('最光阴', '男', '2022-04-16', '湛江', '13824609262');
INSERT INTO `reader_info` VALUES ('李坤彪', '男', '2022-04-15', '天', '15018043490');
INSERT INTO `reader_info` VALUES ('猫猫', '男', '2022-04-16', '广东', '10086');
INSERT INTO `reader_info` VALUES ('绮罗生', '男', '2022-04-16', '合肥', '15435415465');
INSERT INTO `reader_info` VALUES ('轩龙凌绝顶', '男', '2022-04-16', '合肥', '15435415465');

SET FOREIGN_KEY_CHECKS = 1;
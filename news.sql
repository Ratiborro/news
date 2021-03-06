-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 26 2017 г., 07:34
-- Версия сервера: 10.1.19-MariaDB
-- Версия PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `news`
--

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `title` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `title`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Археология', '2017-04-24 23:28:34', '2017-04-25 11:29:00'),
(2, NULL, 'Вселенная', '2017-04-24 23:28:44', '2017-04-24 23:28:44'),
(3, NULL, 'Мистика', '2017-04-24 23:28:52', '2017-04-24 23:28:52'),
(4, 3, 'НЛО', '2017-04-24 23:29:00', '2017-04-25 09:28:30'),
(5, NULL, 'Технологии', '2017-04-24 23:29:11', '2017-04-24 23:29:11'),
(6, 4, 'Пришельцы', '2017-04-24 23:29:21', '2017-04-24 23:29:21'),
(7, NULL, 'Открытия', '2017-04-24 23:29:39', '2017-04-24 23:29:39'),
(8, NULL, 'Химия', '2017-04-24 23:30:51', '2017-04-24 23:30:51'),
(9, 8, 'Растворы', '2017-04-24 23:30:57', '2017-04-24 23:30:57'),
(10, 8, 'Основы электрохимии', '2017-04-24 23:31:11', '2017-04-24 23:31:11'),
(12, 9, 'Взаимодействие растворов с сильнодействующими веществами', '2017-04-25 01:14:13', '2017-04-25 01:14:13'),
(20, NULL, 'Международные отношения', '2017-04-25 13:25:55', '2017-04-25 13:25:55');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `news_id` int(11) NOT NULL,
  `name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `news_id`, `name`, `text`, `created_at`, `updated_at`) VALUES
(1, 8, 'Ratiborro', 'Материалы из википедии читать не интересно!', '2017-04-25 22:04:10', '2017-04-25 22:04:10'),
(3, 8, 'Рабочий завода сайтов', 'Я сделяль!!!', '2017-04-25 22:12:13', '2017-04-25 22:12:13'),
(4, 7, 'Tim Burton', 'I see it!\r\nI spend 10''000$ to learn it', '2017-04-25 22:14:21', '2017-04-25 22:14:21');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_22_064348_create_news_table', 1),
(4, '2017_04_22_065839_create_comments_table', 1),
(5, '2017_04_22_070111_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_slug` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `announcement` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `title_slug`, `category_id`, `announcement`, `text`, `active`, `created_at`, `updated_at`) VALUES
(1, 'Великобритания заявила о возможном ядерном ударе', 'velikobritaniya-v-udare', 6, 'В последние месяцы тема вероятности применения ядерного оружия в разных регионах планеты возникала не раз. Еще в середине марта, до последнего обострения ситуации на Ближнем и Дальнем Востоке, госсекретарь Соединенных Штатов Рекс Тиллерсон сделал громкое заявление относительно ядерного противовеса Северной Корее. Он объявил, что Белый дом может прийти в ближайшее время к решению о разрешении производства и размещения ядерного арсенала в Южной Корее и в Японии. Якобы это поможет сдерживать агрессивные устремления Пхеньяна.', 'В последние месяцы тема вероятности применения ядерного оружия в разных регионах планеты возникала не раз. Еще в середине марта, до последнего обострения ситуации на Ближнем и Дальнем Востоке, госсекретарь Соединенных Штатов Рекс Тиллерсон сделал громкое заявление относительно ядерного противовеса Северной Корее. Он объявил, что Белый дом может прийти в ближайшее время к решению о разрешении производства и размещения ядерного арсенала в Южной Корее и в Японии. Якобы это поможет сдерживать агрессивные устремления Пхеньяна. \r\n\r\nРоссийская сторона усмотрела в этом желание США усилить свое ядерное присутствие в Тихоокеанском бассейне под прикрытием лозунгами противостояния Северной Корее. После этого произошли еще более драматичные события. В КНДР продолжаются испытания баллистических ракет межконтинентального действия. Пхеньян и Вашингтон делают ряд милитаристских заявлений, в которых с обеих сторон звучала и угроза вероятности превентивного удара. Соединенные Штаты направили к берегам Корейского полуострова сразу три корабельных группы с авианосцами и эсминцами, оснащенными по последнему слову военной техники.\r\n\r\nООН с подачи стран, не имеющих ядерного оружия, начала переговоры по разработке конвенции о полном запрете этого разрушительного вида оружия. В готовящемся мероприятии не намерены принимать участие ядерные державы: Франция, Россия, США, Китай, Великобритания. В ближайшее время пройдет первый 5-дневный этап конференции, а в июне состоится второй раунд, длительностью в 3 недели. Члены «ядерной пятерки» считают, что вопрос несвоевременный и непродуктивный.\r\n\r\nТем временем руководство Великобритании устами министра обороны Майкла Фэллона заговорило о готовности страны к превентивной ядерной атаке. Фэллон пояснил представителям британских информационных изданий, что правительство в условиях "наиболее экстремальных обстоятельств" может пойти на применение баллистических ракет Trident, даже без нападения на свою территорию.\r\n\r\nЭти твердотопливные ракеты, как известно, разработаны в США. Могут нести ядерный заряд, как правило, размещаются на подлодках. Обладают дальностью полета свыше 11 000 километров.\r\n\r\nПостпред Великобритании при ООН Мэттью Райкрофт признал, что за последние десятилетия ядерный арсенал страны серьезно уменьшился: более чем в два раза. Тем не менее, о полном разоружении сейчас речи идти не может, уверен он.', 1, '2017-04-25 13:29:09', '2017-04-25 16:15:57'),
(2, 'Трамп объяснил атаку на Сирию', 'tramp-obyasnil-ataku-na-siriyu', 20, 'В ночь с 6 на 7 апреля в соответствии с приказом президента США был нанесен ракетный удар по базе сирийских правительственных войск в провинции Хомс. «Сегодня я отдал приказ нанести прицельный военный удар по авиабазе в Сирии, с которой была осуществлена химическая атака», - заявил Дональд Трамп.', 'Речь об инциденте с химоружием, случившемся накануне в провинции Идлиб. Пентагон и Белый дом, часть европейских политиков тут же обвинили в гибели мирных жителей Сирии войска Асада. Россия и ряд других стран призывали провести тщательное расследование инцидента. По версии другой стороны, никакого применения химического оружия не было. правительственные войска разбомбили оружейный склад террористов, где, скорее всего, и взорвались боеприпасы с химикатами.\r\n\r\nНа освобожденных от боевиков территориях не раз находили лаборатории с химическим веществами военного назначения. В то же время есть информация, что, согласно международной договоренности, Башар Асад сдал все имевшееся у правительственных сил химоружие. Кстати, американцы участвовали в той операции по разоружению. Сейчас ряд политиков США возложили ответственность на Москву. Мол, она обещала контролировать Асада, но не смогла.  \r\n\r\nСША запустили 59 ракет с двух военных кораблей, дислоцирующихся в Средиземном море. Пентагон уверяет, что 58 ракет Tomahawk попали в цель. Но по данным российских военных, точность попадания была гораздо ниже: цели, то есть аэродрома, достигли лишь 23 ракеты.\r\n\r\nПонятно, что такой мощный удар не мог быть неподготовленным. Это отмечают многие эксперты. МИД России заявляет, что причины агрессии США в отношении суверенной Сирии видятся в событиях в Ираке, где от ударов американской авиации гибнут сотни мирных жителей, но реальные военные успехи пока скромны. «Несомненно, что военная акция США — это и попытка отвлечь внимание от ситуации в Мосуле, где в результате действий, в том числе американской коалиции, погибли сотни мирных жителей и нарастает гуманитарная катастрофа» - говорится в официальном заявлении МИД.\r\n\r\nПервым последствием уничтожения базы сирийских войск стало оживление деятельности экстремистов в регионе. Сразу после ракетного удара здесь началось продвижение сил террористов. Что и отметили наблюдатели.\r\n\r\nДругим последствием стало решение России. «Российская сторона приостанавливает действие меморандума о предотвращении инцидентов и обеспечении безопасности полетов авиации в ходе операций в Сирии, заключенного с США», — сказано в документе МИД. Руководство страны обратилось в Совет Безопасности ООН с инициативой провести чрезвычайное заседание для обсуждения ситуации.\r\n\r\nВ мире реакция на действия США разная. Даже в самой Америке нашлись люди, которые осудили решение Трампа. Ряд конгрессменов напоминает президенту, что он нарушил Конституцию страны. При принятии столь ответственного решения он обязан был опираться на Конгресс, добиться его одобрения. К том уже, есть определенные международные процедуры, которые тоже были нарушены. Как в случае с нападением на Ирак, с «демократизацией» Ливии, бомбардировками Югославии.\r\n\r\nДействия США одобрили Израиль, Великобритания, ФРГ, Франция, Украина, Турция. Озабоченность выразили Япония, Греция, Боливия и ряд других стран. В высказываниях политиков звучат фразы о вероятности разжигания 3-й мировой войны.\r\n\r\nПресс-секретарь Кремля высказал позицию власти страны: «Президент Путин считает американские удары по Сирии агрессией против суверенного государства в нарушение норм международного права, причем под надуманным предлогом».\r\n\r\nСитуацию обсудил с членами Совета безопасности РФ президент Путин. Он отметил, что действия США нанесли существенный урон как действиям антитеррористической коалиции, так и двусторонним отношениям наших стран. Американский президент Дональд Трамп по сути перечеркнул свои собственные обещания, которые давал о борьбе с терроризмом много раз.\r\n\r\nПозже СМИ сообщили, что ВМС США направились близ Корейского полуострова. Так же глава МИД ФРГ успел высказаться относительно присутствия ВС РФ в Сирии - Россия не будет вечно защищать президента САР Асада, а так же выразил уверенность, что конфликт в Сирии не удастся решить без России.\r\n\r\nДональд Трамп в своем послании Конгрессу США объяснил, что целью атаки являлось снижение военных возможностей Сирии для проведения дальнейших атак с использованием запрещенного химического оружия, так же он сказал, что действовал в соответствии с его конституционными полномочиями, а так же в интересах национальной безопасности США. Так же президент США предупредил, что он "предпримет дополнительные действия, которые уместны и необходимы для дальнейшего обеспечения национальных интересов" - об этом сообщила пресс-служба Белого дома.', 0, '2017-04-25 13:42:54', '2017-04-25 13:42:54'),
(4, 'Сталлоне ответил Трампу', 'stallone-otvetil-trampu', 20, 'Избранный президент США Дональд Трамп продолжает формировать свою будущую команду. В числе вероятных кандидатов на пост госсекретаря он рассматривал несколько кандидатур. В их числе были Руди Джулиани, экс-мэр Нью-Йорка; Джо Коркер, глава сенатского Комитета по иностранным делам; республиканец Митт Ромни и даже бывший директор ЦРУ Дэвид Петреус. ', 'Избранный президент США Дональд Трамп продолжает формировать свою будущую команду. В числе вероятных кандидатов на пост госсекретаря он рассматривал несколько кандидатур. В их числе были Руди Джулиани, экс-мэр Нью-Йорка; Джо Коркер, глава сенатского Комитета по иностранным делам; республиканец Митт Ромни и даже бывший директор ЦРУ Дэвид Петреус. \r\n\r\nВ итоге Трамп остановил выбор на Рексе Тиллерсоне, председателе совета директоров и исполнительном директоре ExxonMobil. По данным Forbes, корпорация является крупнейшей из частных нефтяных компаний в мире.\r\n\r\nВедущие американские СМИ сразу отметили: Тиллерсон не только один из представителей мировой бизнес-элиты, но и человек с экономическими «завязками» в России, да еще и благосклонный к Путину. Для Трампа это обстоятельство является плюсом. «Большим преимуществом является то, что он знает многих действующих лиц, и он знает их хорошо», — отметил избранный президент. \r\n\r\nКомпания будущего госсекретаря из-за западных санкций вынуждена была отказаться  от ряда совместных с российскими партнерами проектов и потерпела значительные убытки. Тем не менее, Exxon Mobil за эти годы даже увеличила свои земельные активы в России, явно надеясь на дальнейшее расширение бизнес-проектов здесь.\r\n\r\nЖурналисты наперебой напоминают и без того известный факт: в 2013 году Тиллерсон из рук президента РФ Путина получил Орден Дружбы «за большой вклад в развитие и укрепление сотрудничества с Российской Федерацией». \r\n\r\nУтверждать кандидатуру Тиллерсона будут на двухпартийной Комиссии Сената США по международным отношениям, уже после инаугурации Трампа. А затем, в случае хотя бы одного голоса против, обсуждение продолжится в Сенате. И не факт, что оно пройдет успешно. Ряд парламентариев уже сейчас заявляют о своем скепсисе в отношении этой кандидатуры на пост госсекретаря.\r\n\r\nАктеру Сильвестру Сталлоне от команды Трампа поступило предложение занять один из важных постов в культурной сфере. Об этом сообщили ведущие американские издания. Правда, добавили при этом источники, лично Дональд Трамп с актером не встречался, да и официального письма от него направлено не было, состоялись лишь приватные разговоры с приближенными избранного президента. \r\n\r\nАктер дал публичный ответ, опубликованный в одном из американских таблоидов: «Я очень польщен, что мне предложили стать частью Национального фонда искусств и гуманитарных наук». Но, продолжил Сталлоне, он считает, что больше пользы принесет, если будет помогать ветеранам войны «найти хорошо оплачиваемую работу, подходящие дома и финансовые дотации, которые заслуживают герои».', 0, '2017-04-25 16:04:35', '2017-04-25 16:04:35'),
(5, 'Подробности переговоров РФ и США', 'podrobnosti-peregovorov-rf-i-ssha', 20, 'Понемногу СМИ и эксперты отошли от эмоций и началась более взвешенная аналитика итогов длительных переговоров Тиллерсона с Лавровым и беседы американского гостя с президентом Путиным. Как оказалось, даже этих семи часов общения (5 – между главами МИД и 2 – с участием главы РФ) оказалось мало. После этих сложных бесед и пресс-конференции Лавров и Тиллерсон, как оказалось, еще около часа общались в неформальной обстановке.', 'Понемногу СМИ и эксперты отошли от эмоций и началась более взвешенная аналитика итогов длительных переговоров Тиллерсона с Лавровым и беседы американского гостя с президентом Путиным. Как оказалось, даже этих семи часов общения (5 – между главами МИД и 2 – с участием главы РФ) оказалось мало. После этих сложных бесед и пресс-конференции Лавров и Тиллерсон, как оказалось, еще около часа общались в неформальной обстановке.\r\n\r\nГлава российского внешнеполитического ведомства начал пресс-конференцию с фразы, подтекст которой мало кто услышал. "Это был длинный день", - сказал Лавров. Нашлись знатоки, которые вспомнили, что так, а вернее, "Самый длинный день", называлась оскароносная кинолента, снятая в США о высадке союзников в Нормандии в 1944-м. по сути, это было не формальным, как раньше, а фактическим открытием "второго фронта".\r\n\r\nВозможно, это просто совпадение, возможно, некоторые журналисты проявляют избыточный оптимизм. Впрочем, с той стороны его уравновесил пессимизм западных СМИ. Не все, но некоторые из них, похоже, так и не захотели увидеть наметившиеся подвижки. Использовали заготовки, что были сделаны заранее, когда они же трубили, что Тиллерсон везет в Москву ультиматум. Кому-то даже пригрезилось, что Москва «приказ» услышала и готова сдать Асада.\r\n\r\nЧто было на деле? Замам Лаврова и Тиллерсона уже поручено провести анализ отношений двух стран. Они назначены спецпредставителями РФ и США по нормализации связей. Постепенно будет создаваться рабочая группа по более детальной проработке вопроса.\r\n\r\n"Мы согласились на создание рабочих групп по разрешению тех меньших вопросов, которые требуют незамедлительного решения, по стабилизации отношений, чтобы обратиться к более серьезным проблемам", — сделал дипломатическую реплику Тиллерсон. И действительно, проблем немало, в том числе, и внутренних. И на внешней арене Трамп постоянно меняет векторы: по вопросу отношений с Китаем, Северной Кореей, роли НАТО, которое, по его словам, «помолодело» и т.д.\r\n\r\nСамые серьезные разногласия, что и показала пресс-конференция, остались по теме химатаки в Сирии и дальнейшей судьбе Асада. По Асаду только за последние 7-10 дней позиция Вашингтона трижды менялась от «убрать диктатора» до «нам все равно» и снова «животное должно уйти». Москва остается на прежней принципиальной позиции: судьбу главы любой страны должен решать ее народ.\r\n\r\n"Я высказал мнение, что текущее состояние дел в отношениях находится на самом низком уровне. Низок и уровень доверия. Две самые крупные ядерные державы не могут иметь такие отношения", — откровенно признал Тиллерсон и выразил надежду на улучшение положения дел.\r\n\r\nЛавров добавил, что иного пути, чем партнерство, у сверхдержав нет. Историей многократно доказано: "когда Москва и Вашингтон сотрудничают, выигрывают не только наши народы, но и весь мир".', 1, '2017-04-25 16:23:03', '2017-04-25 16:23:03'),
(6, 'Минобороны РФ прокомментировало переброску войск', 'minoborony-rf-prokommentirovalo-perebrosku-voysk', 20, 'Ситуация на Корейском полуострове становится все более взрывоопасной. Пхеньян создал и продемонстрировал видеоролик, в котором показаны гипотетические последствия корейского ракетного удара по территории Соединенных Штатов. «Премьера» состоялась на официальной церемонии, приуроченной к 105-му дню рождения морального лидера нации Ким Ир Сена. Бывший северокорейский лидер приходится нынешнему главе государства дедом.', 'Ситуация на Корейском полуострове становится все более взрывоопасной. Пхеньян создал и продемонстрировал видеоролик, в котором показаны гипотетические последствия корейского ракетного удара по территории Соединенных Штатов. «Премьера» состоялась на официальной церемонии, приуроченной к 105-му дню рождения морального лидера нации Ким Ир Сена. Бывший северокорейский лидер приходится нынешнему главе государства дедом.\r\n\r\nВ фильме показали пуск новой баллистической ракеты, момент ее полета и собственно бомбардировка одного из условных американских городов. Одним из сюжетов ленты стал эпизод с пылающим флагом США, а на заднем плане у него – кладбище. \r\n\r\nПо случаю юбилея исторического лидера КНДР состоялся парад, где показали образцы современной техники, в частности, вероятно, и та самая «киношная» баллистическая ракета межконтинентального радиуса действия. Состоялся и праздничный концерт с бравурными патриотическими песнями.\r\n\r\n25 апреля в стране снова праздник, годовщина организации народной армии КНДР. Скорее всего, что к этой дате будет приурочено новое испытание ракетной техник.\r\n\r\nСША в ответ заявляют о готовности «устанавливать мир силой». Руководство КНДР также не скупится на воинственные речи. Никки Хейли, постоянный представитель США при ООН, сделала предположение, что основой будущих крупных конфликтов мирового масштаба станут нарушения прав человека в КНДР, на Кубе, в Иране.\r\n\r\nПо вопросу соблюдения прав человека в ряде стран мира США инициировали заседание Совета безопасности ООН. Россия пыталась противостоять попыткам свести столь серьезную проблему к очередным манипуляциям понятием «права человека». Но разговор состоялся, и его проведение Хейли поставила себе в заслугу: «Они видели, что на них движется бык, и сказали себе, что лучше отойти в сторону», — заявила дипломат, имея в виду как раз страны, которые хотели не втягивать ООН в подобные бесплодные дискуссии.\r\n\r\nДмитрий Песков, пресс-секретарь президента РФ, сдержанно отреагировал на расспросы коллег о якобы начавшейся переброске части армейских подразделений к границе с КНДР. Он напомнил журналистам: дислокация войск внутри страны и вероятные их передвижения не являются публичными темами.\r\n\r\nМинистерство обороны РФ пояснило СМИ, что передислокация войск на Востоке страны осуществляется планово, в рамках постоянно проводимых в стране учений. В частности, с 3 по 29 апреля в войсках ВВО идет плановая контрольная проверка по итогам зимнего периода обучения личного состава.', 1, '2017-04-25 16:25:48', '2017-04-25 16:25:48'),
(7, 'Неопознанный объект над Новосибирском', 'neopoznannyy-obekt-nad-novosibirskom', 4, 'Недавно был замечен странный летающий объект в районе Матвеевки.', 'Странный летающий объект наблюдали жители Первомайского района.\r\nДля выяснения принадлежности объекта технологиям человеческой расы были созваны сотни лучших учёных.\r\nВ сумме для установления "личности" объекта было потрачено более полутора миллиардов рублей.\r\nВот что учёные сказали на вопрос, что же это - инопланетяне или навороченная разработка людей: "Однозначно сказать нельзя" - утверждали они - "Возможно, это обычный самолёт".\r\nИсследования продолжаются. Планируется выделить ещё до 15 миллиардов рублей для точной идентификации объекта.\r\nВопрос: "А как же люди? Зачем тратить столько денег на воздух?" учёные проигнорировали. Хотя из неизвестного источника до нас дошли данные, что деньги специально сливаются вникуда, чтобы народ жил в нищете. Ведь довольными и самодостаточными людьми управлять невозможно.\r\nВсего хорошего! Держитесь!', 1, '2017-04-25 19:43:47', '2017-04-25 19:43:47'),
(8, 'Материал из Википедии', 'material-iz-vikipedii', 3, 'Ми́стика (от греч. μυστικός — «скрытый», «тайный») — вера в существование сверхъестественных сил, с которыми таинственным образом связан и способен общаться человек; также — сакральная религиозная практика, имеющая целью переживание непосредственного единения с Богом (или богами, духами, другими нематериальными сущностями); также — проявление сверхъестественных сил. Совокупность теологических и философских доктрин, посвящённых оправданию и осмыслению этой практики, называется мистицизмом[1].', 'В переносном словоупотреблении мистика означает совокупность явлений и действий, особым образом связывающих человека с тайным существом и силами мира, независимо от условий пространства, времени и физической причинности; это есть мистика реальная или опытная, которая разделяется на: а) прорицательную, стремящуюся усматривать непосредственно явления и предметы, не находящиеся в данном пространственном и временном кругозоре — сюда принадлежат различные формы ясновидения, гадания, оракулов, также астрология; б) деятельную или оперативную, которая стремится, помимо обычных средств и условий, производить различные явления, как-то: действовать на расстоянии, останавливать и вызывать жизненные процессы одним властным внушением, создавать пластические формы или материализовать духовные сущности и дематериализовать телесные и т. п.; сюда относятся так называемый животный магнетизм, магия (в тесном смысле), теургия, некромантия, всевозможные способы волшебства или чародейства и, наконец, вся область медиумических или спиритических явлений. С христианской точки зрения реальная мистика (в обоих своих видах) разделяется по достоинству и значению предмета и среды мистического взаимодействия на мистику божественную, естественную и демоническую. Относить к мистике алхимию, как это обыкновенно делается, нет достаточных оснований, так как алхимики в своих операциях старались пользоваться естественными свойствами вещества и исходили из принципа единства материи, признаваемого ныне положительной наукой.\r\n\r\nВ другом смысле мистикой называется особый род религиозно-философской познавательной деятельности. Сверх обычных способов познавания истины — опыта, чистого мышления, предания и авторитета, — всегда допускалась большинством религиозных и метафизических умов возможность непосредственного общения между познающим субъектом и абсолютным предметом познания — сущностью всего, или божеством. Если такое общение признается единственным или, по крайней мере, самым верным и достойным способом познания и осуществления истины, а все другие способы более или менее пренебрегаются как низшие и неудовлетворительные, то возникает известное исключительное направление мысли, называемое мистицизмом; если, независимо от крайности этого направления, внутреннее общение человеческого духа с абсолютным признается как существенная основа истинного познания, то появляются учения, которые, смотря по преобладанию в них религиозного или философского элемента, обозначаются как мистическое богословие, мистическая философия или теософия.', 1, '2017-04-25 20:05:22', '2017-04-25 20:05:22');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `admin`, `created_at`, `updated_at`) VALUES
(1, 'Администратор', 'maloy1984@gmail.com', '$2y$10$pa2yNEh5TOR7/5Ohyu.cxe7hTmw.bY0Um9FoyMYaUauyiWYQd5cQ6', 'UpDsmXxUvczcpTnzgfwq5HUgYQol9Bl3F2wayYIG5kA19VdQ97JvbXxCU3Co', 1, '2017-04-25 07:55:39', '2017-04-25 07:55:39');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_news_id_index` (`news_id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_title_unique` (`title`),
  ADD KEY `news_category_id_index` (`category_id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

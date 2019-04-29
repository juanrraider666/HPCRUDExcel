/*
Navicat MySQL Data Transfer

Source Server         : VIP Club DEV
Source Server Version : 50634
Source Host           : 72.46.253.104:3306
Source Database       : dbhpinvvip_dev

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2019-02-21 11:40:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attribute_system_attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute_system_attribute`;
CREATE TABLE `attribute_system_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `presentation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `active` tinyint(1) NOT NULL,
  `target_entity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `javascript_code` longtext COLLATE utf8_unicode_ci,
  `constraints` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `region_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `container_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value_template` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_AF8A5BC98260155` (`region_id`) USING BTREE,
  KEY `IDX_AF8A5BC7E3C61F9` (`owner_id`) USING BTREE,
  CONSTRAINT `FK_AF8A5BC7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `loyalty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_AF8A5BC98260155` FOREIGN KEY (`region_id`) REFERENCES `attribute_system_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of attribute_system_attribute
-- ----------------------------
INSERT INTO `attribute_system_attribute` VALUES ('3', 'generada_por_toshiba', '¿La oportunidad es generada por HP?', 'choice', 'a:4:{s:7:\"choices\";a:3:{s:2:\"Si\";s:2:\"Si\";s:2:\"No\";s:2:\"No\";s:20:\"Esfuerzo en conjunto\";s:20:\"Esfuerzo en conjunto\";}s:8:\"multiple\";b:0;s:8:\"expanded\";b:1;s:8:\"required\";b:1;}', '0', 'Deal', null, '2015-09-18 16:22:51', '2017-08-22 10:58:56', null, null, '4', '2', 'form-inline', null);
INSERT INTO `attribute_system_attribute` VALUES ('4', 'soluciones_interes', 'Equipos de Interés', 'choice', 'a:4:{s:7:\"choices\";a:6:{s:24:\"D3Q16C (HP PW Pro 452dw)\";s:24:\"D3Q16C (HP PW Pro 452dw)\";s:24:\"D3Q17C (HP PW Pro 552dw)\";s:24:\"D3Q17C (HP PW Pro 552dw)\";s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";s:24:\"D3Q20C (HP PW Pro 477dw)\";s:24:\"D3Q20C (HP PW Pro 477dw)\";s:24:\"D3Q21C (HP PW Pro 577dw)\";s:24:\"D3Q21C (HP PW Pro 577dw)\";s:35:\"J9V82C (HP PW Managed P57750dw) MPA\";s:35:\"J9V82C (HP PW Managed P57750dw) MPA\";}s:11:\"placeholder\";s:11:\"Seleccionar\";s:8:\"required\";b:1;s:8:\"multiple\";b:1;}', '0', 'Deal', null, '2015-09-18 16:35:12', '2017-08-29 17:18:08', null, null, '3', '2', null, '{% if context == \'export\' %}\r\n    {{ value|join(\', \') }}\r\n{% else %}\r\n    {{ value|join(\'\\n\')|nl2br }}\r\n{% endif %}');
INSERT INTO `attribute_system_attribute` VALUES ('6', 'competidor', 'Competidor', 'choice', 'a:3:{s:7:\"choices\";a:8:{s:5:\"Xerox\";s:5:\"Xerox\";s:7:\"Lexmark\";s:7:\"Lexmark\";s:5:\"Ricoh\";s:4:\"Sony\";s:7:\"Samsung\";s:7:\"Samsung\";s:7:\"Brother\";s:7:\"Brother\";s:8:\"OKI Data\";s:8:\"OKI Data\";s:5:\"Canon\";s:5:\"Canon\";s:5:\"Epson\";s:5:\"Epson\";}s:11:\"placeholder\";s:11:\"Seleccionar\";s:8:\"required\";b:1;}', '0', 'Deal', '2', '2015-09-21 09:28:11', '2016-10-10 17:02:42', null, null, '5', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('7', 'sector_oportunidad', '¿A qué sector pertenece la oportunidad?', 'choice', 'a:3:{s:7:\"choices\";a:3:{s:7:\"Privado\";s:7:\"Privado\";s:8:\"Público\";s:8:\"Público\";s:8:\"Gobierno\";s:8:\"Gobierno\";}s:11:\"placeholder\";s:11:\"Seleccionar\";s:8:\"required\";b:1;}', '0', 'Deal', '5', '2015-09-21 09:29:45', '2017-08-22 10:58:57', 'function form_action($input){\r\n    var $containers = $.attributeField(\'fecha_propuesta, fecha_decision, fecha_entrega, fecha_licitacion\').attributeContainer();\r\n    \r\n    function hideOrShowFields(e){\r\n        e && e.preventDefault();\r\n        \r\n        if ($input.val() == \'Gobierno\') {\r\n            $containers.show();\r\n        } else {\r\n            $containers.hide();\r\n        }\r\n    }\r\n    \r\n    $input.on(\'change\', hideOrShowFields);\r\n    hideOrShowFields();\r\n}\r\n\r\nfunction show_action($el){\r\n    var $containers = $.attributeField(\'fecha_propuesta, fecha_decision, fecha_entrega, fecha_licitacion\').attributeContainer(\'.tr-attribute\');\r\n    \r\n    if ($el.text().trim() == \'Gobierno\') {\r\n        $containers.show();\r\n    } else {\r\n        $containers.hide();\r\n    }\r\n}', null, '5', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('9', 'estatus_presupuesto', 'Estatus del Presupuesto', 'choice', 'a:3:{s:7:\"choices\";a:4:{s:11:\"Desconocido\";s:11:\"Desconocido\";s:16:\"En Construcción\";s:16:\"En Construcción\";s:7:\"Enviado\";s:7:\"Enviado\";s:8:\"Aprobado\";s:8:\"Aprobado\";}s:11:\"placeholder\";s:11:\"Seleccionar\";s:8:\"required\";b:1;}', '0', 'Deal', '1', '2015-09-21 09:35:09', '2016-10-10 17:02:30', null, null, '5', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('11', 'unidades_oportunidad', 'Número de unidades de la oportunidad', 'number', 'a:2:{s:8:\"required\";b:1;s:15:\"invalid_message\";s:79:\"El valor en <strong> Número de unidades de la oportunidad</strong> es invalido\";}', '0', 'Deal', null, '2015-09-21 09:38:33', '2017-08-29 17:18:15', null, '{\"Range\":{\"min\":0,\"max\":50,\"maxMessage\":\"La oportunidad debe ser registrada por un <strong>m\\u00e1ximo<\\/strong> de <strong>50<\\/strong> unidades\"}}', '6', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('12', 'productos_toshiba_us', 'Productos de HP en US$', 'money', 'a:4:{s:8:\"currency\";b:0;s:8:\"required\";b:1;s:15:\"invalid_message\";s:69:\"El valor en <strong> Productos de Toshiba en US$</strong> es invalido\";s:4:\"attr\";a:1:{s:5:\"class\";s:14:\"total-usd-part\";}}', '0', 'Deal', null, '2015-09-21 09:39:32', '2016-10-10 17:02:34', null, null, '6', '2', null, '{{ value|number_format }} $');
INSERT INTO `attribute_system_attribute` VALUES ('13', 'otros_productos_us', 'Otros Productos en US$', 'money', 'a:4:{s:8:\"currency\";b:0;s:8:\"required\";b:1;s:15:\"invalid_message\";s:64:\"El valor en <strong> Otros Productos en US$</strong> es invalido\";s:4:\"attr\";a:1:{s:5:\"class\";s:14:\"total-usd-part\";}}', '0', 'Deal', null, '2015-09-21 09:40:02', '2016-10-10 17:02:35', null, null, '6', '2', null, '{{ value|number_format }} $');
INSERT INTO `attribute_system_attribute` VALUES ('14', 'servicios_partner_us', 'Servicios del Partner en US$', 'money', 'a:4:{s:8:\"currency\";b:0;s:8:\"required\";b:1;s:15:\"invalid_message\";s:69:\"El valor en <strong>Servicios del Partner en US$</strong> es invalido\";s:4:\"attr\";a:1:{s:5:\"class\";s:14:\"total-usd-part\";}}', '0', 'Deal', null, '2015-09-21 09:41:24', '2016-10-10 17:02:36', null, null, '6', '2', null, '{{ value|number_format }} $');
INSERT INTO `attribute_system_attribute` VALUES ('16', 'fecha_propuesta', 'Fecha de presentación de propuesta', 'date', 'a:2:{s:6:\"widget\";s:11:\"single_text\";s:15:\"invalid_message\";s:68:\"La <strong> Fecha de presentación de propuesta</strong> es invalida\";}', '0', 'Deal', null, '2015-09-23 15:10:24', '2017-08-22 10:59:01', null, null, '1', '2', null, '{{ value ? value|date }}');
INSERT INTO `attribute_system_attribute` VALUES ('17', 'fecha_entrega', 'Fecha de entrega', 'date', 'a:2:{s:6:\"widget\";s:11:\"single_text\";s:15:\"invalid_message\";s:48:\"La <strong>Fecha de entrega</strong> es invalida\";}', '0', 'Deal', '3', '2015-09-23 15:21:14', '2017-08-22 10:59:02', null, null, '1', '2', null, '{{ value ? value|date }}');
INSERT INTO `attribute_system_attribute` VALUES ('18', 'fecha_licitacion', 'Fecha de invitación a la licitación', 'date', 'a:2:{s:6:\"widget\";s:11:\"single_text\";s:15:\"invalid_message\";s:69:\"La <strong>Fecha de invitación a la licitación</strong> es invalida\";}', '0', 'Deal', '4', '2015-09-23 15:24:22', '2017-08-22 10:59:02', null, null, '1', '2', null, '{{ value ? value|date }}');
INSERT INTO `attribute_system_attribute` VALUES ('19', 'fecha_decision', 'Fecha de decisión', 'date', 'a:2:{s:6:\"widget\";s:11:\"single_text\";s:15:\"invalid_message\";s:50:\"La <strong>Fecha de decisión</strong> es invalida\";}', '0', 'Deal', '2', '2015-09-23 15:25:55', '2017-08-22 10:59:02', null, null, '1', '2', null, '{{ value ? value|date }}');
INSERT INTO `attribute_system_attribute` VALUES ('20', 'mayorista', 'Mayorista con el que se está trabajando', 'choice', 'a:3:{s:7:\"choices\";a:12:{s:23:\"Exel Del Norte Sa De Cv\";s:23:\"Exel Del Norte Sa De Cv\";s:28:\"Ingram Micro Mexico Sa De Cv\";s:28:\"Ingram Micro Mexico Sa De Cv\";s:57:\"Team Tecnologia Especializada Asociada De Mexico Sa De Cv\";s:57:\"Team Tecnologia Especializada Asociada De Mexico Sa De Cv\";s:30:\"Tech Data Mexico S de RL De Cv\";s:30:\"Tech Data Mexico S de RL De Cv\";s:38:\"Ct Internacional Del Noroeste Sa De Cv\";s:38:\"Ct Internacional Del Noroeste Sa De Cv\";s:25:\"Comercializadora Intcomex\";s:25:\"Comercializadora Intcomex\";s:36:\"Compusoluciones Y Asociados Sa De Cv\";s:36:\"Compusoluciones Y Asociados Sa De Cv\";s:47:\"Cva Comercializadora De Valor Agregado Sa De Cv\";s:47:\"Cva Comercializadora De Valor Agregado Sa De Cv\";s:10:\"PORTENNTUM\";s:10:\"PORTENNTUM\";s:22:\"DC MAYORISTA, SA DE CV\";s:22:\"DC MAYORISTA, SA DE CV\";s:29:\"Grupo Loma del Norte SA de CV\";s:29:\"Grupo Loma del Norte SA de CV\";s:14:\"Otro Mayorista\";s:14:\"Otro Mayorista\";}s:11:\"placeholder\";s:11:\"Seleccionar\";s:8:\"required\";b:1;}', '0', 'Deal', '4', '2015-09-23 15:26:29', '2017-08-22 10:59:03', null, null, '5', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('21', 'otro', 'Otro', 'text', 'N;', '0', 'Deal', null, '2015-12-14 09:48:32', '2016-06-30 15:05:45', null, null, '5', '2', null, null);
INSERT INTO `attribute_system_attribute` VALUES ('22', 'modelo_competidor', 'Modelo Competidor', 'text', 'a:2:{s:8:\"required\";b:1;s:15:\"invalid_message\";s:53:\"Por favor ingresar <strong>Modelo Competidor</strong>\";}', '0', 'Deal', '3', '2016-07-01 09:00:24', '2016-10-10 17:03:57', null, null, '5', '2', null, null);

-- ----------------------------
-- Table structure for attribute_system_region
-- ----------------------------
DROP TABLE IF EXISTS `attribute_system_region`;
CREATE TABLE `attribute_system_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of attribute_system_region
-- ----------------------------
INSERT INTO `attribute_system_region` VALUES ('1', 'deal_project:after', '1');
INSERT INTO `attribute_system_region` VALUES ('2', 'deal_prospectus.region.top', '1');
INSERT INTO `attribute_system_region` VALUES ('3', 'deal_product:before', '1');
INSERT INTO `attribute_system_region` VALUES ('4', 'deal_project description:after', '1');
INSERT INTO `attribute_system_region` VALUES ('5', 'deal_project status:after', '1');
INSERT INTO `attribute_system_region` VALUES ('6', 'deal_product summatory', '1');

-- ----------------------------
-- Table structure for attribute_value_company
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_company`;
CREATE TABLE `attribute_value_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `value` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_191274AB6E62EFA` (`attribute_id`),
  KEY `IDX_191274A979B1AD6` (`company_id`),
  CONSTRAINT `FK_191274A979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `deal_company` (`id`),
  CONSTRAINT `FK_191274AB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute_system_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attribute_value_company
-- ----------------------------

-- ----------------------------
-- Table structure for attribute_value_deal
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_deal`;
CREATE TABLE `attribute_value_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `deal_id` int(11) DEFAULT NULL,
  `value` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_4E779DAAB6E62EFA` (`attribute_id`),
  KEY `IDX_4E779DAAF60E2305` (`deal_id`),
  CONSTRAINT `FK_4E779DAAB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute_system_attribute` (`id`),
  CONSTRAINT `FK_4E779DAAF60E2305` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attribute_value_deal
-- ----------------------------
INSERT INTO `attribute_value_deal` VALUES ('471', '3', '38', 's:20:\"Esfuerzo en conjunto\";', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('472', '4', '38', 'a:3:{i:0;s:6:\"D3Q17C\";i:1;s:6:\"J6U55C\";i:2;s:6:\"D3Q20C\";}', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('473', '6', '38', 's:7:\"Lexmark\";', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('474', '7', '38', 's:8:\"Gobierno\";', '2016-06-06 10:23:54', '2016-06-30 16:22:19');
INSERT INTO `attribute_value_deal` VALUES ('475', '9', '38', 's:11:\"Desconocido\";', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('476', '11', '38', 'i:250;', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('477', '12', '38', 'd:50000;', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('478', '13', '38', 'd:25000;', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('479', '14', '38', 'd:10000;', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('480', '16', '38', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-06-23 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-06-06 10:23:54', '2016-06-30 16:22:19');
INSERT INTO `attribute_value_deal` VALUES ('481', '17', '38', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-06-23 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-06-06 10:23:54', '2016-06-30 16:22:19');
INSERT INTO `attribute_value_deal` VALUES ('482', '18', '38', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-06-30 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-06-06 10:23:54', '2016-06-30 16:22:19');
INSERT INTO `attribute_value_deal` VALUES ('483', '19', '38', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-06-26 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-06-06 10:23:54', '2016-06-30 16:22:19');
INSERT INTO `attribute_value_deal` VALUES ('484', '20', '38', 's:5:\"Disti\";', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('485', '21', '38', 'N;', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `attribute_value_deal` VALUES ('486', '3', '39', 's:2:\"Si\";', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('487', '4', '39', 'a:3:{i:0;s:6:\"D3Q16C\";i:1;s:6:\"J6U55C\";i:2;s:6:\"D3Q21C\";}', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('488', '6', '39', 's:8:\"OKI Data\";', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('489', '7', '39', 's:8:\"Público\";', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('490', '9', '39', 's:16:\"En Construcción\";', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('491', '11', '39', 'i:5;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('492', '12', '39', 'd:10000;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('493', '13', '39', 'd:10000;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('494', '14', '39', 'd:10000;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('495', '16', '39', 'N;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('496', '17', '39', 'N;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('497', '18', '39', 'N;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('498', '19', '39', 'N;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('499', '20', '39', 's:5:\"Disti\";', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('500', '21', '39', 'N;', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `attribute_value_deal` VALUES ('501', '3', '40', 's:2:\"No\";', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('502', '4', '40', 'a:2:{i:0;s:6:\"J6U55C\";i:1;s:6:\"D3Q20C\";}', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('503', '6', '40', 's:8:\"OKI Data\";', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('504', '7', '40', 's:7:\"Privado\";', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('505', '9', '40', 's:16:\"En Construcción\";', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('506', '11', '40', 'i:1;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('507', '12', '40', 'd:2;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('508', '13', '40', 'd:3;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('509', '14', '40', 'd:4;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('510', '16', '40', 'N;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('511', '17', '40', 'N;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('512', '18', '40', 'N;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('513', '19', '40', 'N;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('514', '20', '40', 's:13:\"oki mayorista\";', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('515', '21', '40', 'N;', '2016-06-08 11:35:40', '2016-06-08 10:55:16');
INSERT INTO `attribute_value_deal` VALUES ('516', '16', '41', 'N;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('517', '4', '41', 'a:1:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('518', '3', '41', 's:2:\"No\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('519', '11', '41', 'i:1;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('520', '12', '41', 'd:1;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('521', '13', '41', 'd:1;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('522', '14', '41', 'd:1;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('523', '9', '41', 's:16:\"En Construcción\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('524', '19', '41', 'N;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('525', '6', '41', 's:5:\"Xerox\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('526', '17', '41', 'N;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('527', '22', '41', 's:1:\"A\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('528', '18', '41', 'N;', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('529', '20', '41', 's:29:\"Grupo Loma del Norte SA de CV\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('530', '7', '41', 's:7:\"Privado\";', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `attribute_value_deal` VALUES ('531', '16', '42', 'N;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('532', '4', '42', 'a:1:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('533', '3', '42', 's:2:\"Si\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('534', '11', '42', 'i:1;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('535', '12', '42', 'd:1;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('536', '13', '42', 'd:1;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('537', '14', '42', 'd:1;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('538', '9', '42', 's:7:\"Enviado\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('539', '19', '42', 'N;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('540', '6', '42', 's:5:\"Xerox\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('541', '17', '42', 'N;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('542', '22', '42', 's:1:\"B\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('543', '18', '42', 'N;', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('544', '20', '42', 's:30:\"Tech Data Mexico S de RL De Cv\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('545', '7', '42', 's:8:\"Público\";', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `attribute_value_deal` VALUES ('546', '16', '43', 'N;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('547', '4', '43', 'a:1:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('548', '3', '43', 's:2:\"No\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('549', '11', '43', 'i:1;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('550', '12', '43', 'd:1;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('551', '13', '43', 'd:1;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('552', '14', '43', 'd:1;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('553', '9', '43', 's:16:\"En Construcción\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('554', '19', '43', 'N;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('555', '6', '43', 's:8:\"OKI Data\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('556', '17', '43', 'N;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('557', '22', '43', 's:4:\"tttt\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('558', '18', '43', 'N;', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('559', '20', '43', 's:47:\"Cva Comercializadora De Valor Agregado Sa De Cv\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('560', '7', '43', 's:7:\"Privado\";', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `attribute_value_deal` VALUES ('561', '16', '44', 'N;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('562', '4', '44', 'a:2:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";}', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('563', '3', '44', 's:2:\"No\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('564', '11', '44', 'i:20;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('565', '12', '44', 'd:23;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('566', '13', '44', 'd:50;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('567', '14', '44', 'd:65;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('568', '9', '44', 's:16:\"En Construcción\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('569', '19', '44', 'N;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('570', '6', '44', 's:7:\"Brother\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('571', '17', '44', 'N;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('572', '22', '44', 's:4:\"Test\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('573', '18', '44', 'N;', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('574', '20', '44', 's:10:\"PORTENNTUM\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('575', '7', '44', 's:7:\"Privado\";', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `attribute_value_deal` VALUES ('576', '16', '45', 'N;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('577', '4', '45', 'a:2:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";}', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('578', '3', '45', 's:2:\"No\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('579', '11', '45', 'i:20;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('580', '12', '45', 'd:23;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('581', '13', '45', 'd:50;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('582', '14', '45', 'd:65;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('583', '9', '45', 's:16:\"En Construcción\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('584', '19', '45', 'N;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('585', '6', '45', 's:7:\"Brother\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('586', '17', '45', 'N;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('587', '22', '45', 's:4:\"Test\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('588', '18', '45', 'N;', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('589', '20', '45', 's:36:\"Compusoluciones Y Asociados Sa De Cv\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('590', '7', '45', 's:8:\"Público\";', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `attribute_value_deal` VALUES ('591', '16', '46', 'N;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('592', '4', '46', 'a:2:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('593', '3', '46', 's:20:\"Esfuerzo en conjunto\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('594', '11', '46', 'i:20;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('595', '12', '46', 'd:23;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('596', '13', '46', 'd:50;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('597', '14', '46', 'd:65;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('598', '9', '46', 's:11:\"Desconocido\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('599', '19', '46', 'N;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('600', '6', '46', 's:7:\"Samsung\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('601', '17', '46', 'N;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('602', '22', '46', 's:4:\"Test\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('603', '18', '46', 'N;', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('604', '20', '46', 's:23:\"Exel Del Norte Sa De Cv\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('605', '7', '46', 's:7:\"Privado\";', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `attribute_value_deal` VALUES ('606', '16', '47', 'N;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('607', '4', '47', 'a:2:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";}', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('608', '3', '47', 's:20:\"Esfuerzo en conjunto\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('609', '11', '47', 'i:20;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('610', '12', '47', 'd:23;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('611', '13', '47', 'd:50;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('612', '14', '47', 'd:65;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('613', '9', '47', 's:16:\"En Construcción\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('614', '19', '47', 'N;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('615', '6', '47', 's:7:\"Lexmark\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('616', '17', '47', 'N;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('617', '22', '47', 's:4:\"Test\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('618', '18', '47', 'N;', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('619', '20', '47', 's:47:\"Cva Comercializadora De Valor Agregado Sa De Cv\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('620', '7', '47', 's:8:\"Público\";', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `attribute_value_deal` VALUES ('621', '16', '48', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-07-01 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('622', '4', '48', 'a:2:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('623', '3', '48', 's:2:\"No\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('624', '11', '48', 'i:49;', '2016-08-04 11:43:15', '2016-08-04 16:05:58');
INSERT INTO `attribute_value_deal` VALUES ('625', '12', '48', 'd:999999;', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('626', '13', '48', 'd:1;', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('627', '14', '48', 'd:0;', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('628', '9', '48', 's:11:\"Desconocido\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('629', '19', '48', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-06-01 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('630', '6', '48', 's:5:\"Ricoh\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('631', '17', '48', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-04-01 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('632', '22', '48', 's:11:\"desconocido\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('633', '18', '48', 'O:8:\"DateTime\":3:{s:4:\"date\";s:19:\"2016-12-31 00:00:00\";s:13:\"timezone_type\";i:3;s:8:\"timezone\";s:16:\"America/New_York\";}', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('634', '20', '48', 's:28:\"Ingram Micro Mexico Sa De Cv\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('635', '7', '48', 's:8:\"Gobierno\";', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `attribute_value_deal` VALUES ('636', '16', '49', 'N;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('637', '4', '49', 'a:3:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:24:\"D3Q20C (HP PW Pro 477dw)\";i:2;s:35:\"J9V82C (HP PW Managed P57750dw) MPA\";}', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('638', '3', '49', 's:2:\"Si\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('639', '11', '49', 'i:0;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('640', '12', '49', 'd:0;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('641', '13', '49', 'd:0;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('642', '14', '49', 'd:0;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('643', '9', '49', 's:11:\"Desconocido\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('644', '19', '49', 'N;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('645', '6', '49', 's:5:\"Xerox\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('646', '17', '49', 'N;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('647', '22', '49', 's:6:\"modelo\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('648', '18', '49', 'N;', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('649', '20', '49', 's:23:\"Exel Del Norte Sa De Cv\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('650', '7', '49', 's:8:\"Público\";', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `attribute_value_deal` VALUES ('651', '16', '50', 'N;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('652', '4', '50', 'a:6:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:2;s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";i:3;s:24:\"D3Q20C (HP PW Pro 477dw)\";i:4;s:24:\"D3Q21C (HP PW Pro 577dw)\";i:5;s:35:\"J9V82C (HP PW Managed P57750dw) MPA\";}', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('653', '3', '50', 's:2:\"No\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('654', '11', '50', 'i:1;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('655', '12', '50', 'd:1;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('656', '13', '50', 'd:1;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('657', '14', '50', 'd:1;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('658', '9', '50', 's:16:\"En Construcción\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('659', '19', '50', 'N;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('660', '6', '50', 's:5:\"Ricoh\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('661', '17', '50', 'N;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('662', '22', '50', 's:6:\"modelo\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('663', '18', '50', 'N;', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('664', '20', '50', 's:10:\"PORTENNTUM\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('665', '7', '50', 's:7:\"Privado\";', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `attribute_value_deal` VALUES ('666', '16', '51', 'N;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('667', '4', '51', 'a:2:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q20C (HP PW Pro 477dw)\";}', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('668', '3', '51', 's:2:\"No\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('669', '11', '51', 'i:50;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('670', '12', '51', 'd:50;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('671', '13', '51', 'd:50;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('672', '14', '51', 'd:50;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('673', '9', '51', 's:7:\"Enviado\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('674', '19', '51', 'N;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('675', '6', '51', 's:8:\"OKI Data\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('676', '17', '51', 'N;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('677', '22', '51', 's:6:\"modelo\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('678', '18', '51', 'N;', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('679', '20', '51', 's:22:\"DC MAYORISTA, SA DE CV\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('680', '7', '51', 's:7:\"Privado\";', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `attribute_value_deal` VALUES ('681', '16', '52', 'N;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('682', '4', '52', 'a:4:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:2;s:24:\"D3Q20C (HP PW Pro 477dw)\";i:3;s:24:\"D3Q21C (HP PW Pro 577dw)\";}', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('683', '3', '52', 's:2:\"No\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('684', '11', '52', 'i:1;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('685', '12', '52', 'd:1;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('686', '13', '52', 'd:1;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('687', '14', '52', 'd:123;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('688', '9', '52', 's:7:\"Enviado\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('689', '19', '52', 'N;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('690', '6', '52', 's:5:\"Canon\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('691', '17', '52', 'N;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('692', '22', '52', 's:6:\"modelo\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('693', '18', '52', 'N;', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('694', '20', '52', 's:10:\"PORTENNTUM\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('695', '7', '52', 's:7:\"Privado\";', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `attribute_value_deal` VALUES ('696', '16', '53', 'N;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('697', '4', '53', 'a:2:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:35:\"J6U55C (HP PW Managed P55250dw) MPA\";}', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('698', '3', '53', 's:2:\"No\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('699', '11', '53', 'i:1;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('700', '12', '53', 'd:1;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('701', '13', '53', 'd:1;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('702', '14', '53', 'd:1;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('703', '9', '53', 's:16:\"En Construcción\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('704', '19', '53', 'N;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('705', '6', '53', 's:5:\"Xerox\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('706', '17', '53', 'N;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('707', '22', '53', 's:7:\"1111111\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('708', '18', '53', 'N;', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('709', '20', '53', 's:28:\"Ingram Micro Mexico Sa De Cv\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('710', '7', '53', 's:7:\"Privado\";', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `attribute_value_deal` VALUES ('711', '16', '54', 'N;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('712', '4', '54', 'a:2:{i:0;s:24:\"D3Q16C (HP PW Pro 452dw)\";i:1;s:24:\"D3Q17C (HP PW Pro 552dw)\";}', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('713', '3', '54', 's:2:\"No\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('714', '11', '54', 'i:1;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('715', '12', '54', 'd:1;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('716', '13', '54', 'd:1;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('717', '14', '54', 'd:1;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('718', '9', '54', 's:11:\"Desconocido\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('719', '19', '54', 'N;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('720', '6', '54', 's:5:\"Xerox\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('721', '17', '54', 'N;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('722', '22', '54', 's:4:\"1234\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('723', '18', '54', 'N;', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('724', '20', '54', 's:23:\"Exel Del Norte Sa De Cv\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('725', '7', '54', 's:7:\"Privado\";', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `attribute_value_deal` VALUES ('726', '16', '55', 'N;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('727', '4', '55', 'a:2:{i:0;s:24:\"D3Q17C (HP PW Pro 552dw)\";i:1;s:24:\"D3Q20C (HP PW Pro 477dw)\";}', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('728', '3', '55', 's:2:\"No\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('729', '11', '55', 'i:20;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('730', '12', '55', 'd:23;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('731', '13', '55', 'd:50;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('732', '14', '55', 'd:65;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('733', '9', '55', 's:11:\"Desconocido\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('734', '19', '55', 'N;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('735', '6', '55', 's:7:\"Brother\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('736', '17', '55', 'N;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('737', '22', '55', 's:44:\"Test de caracteres especiales aéíóúñ@²\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('738', '18', '55', 'N;', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('739', '20', '55', 's:10:\"PORTENNTUM\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');
INSERT INTO `attribute_value_deal` VALUES ('740', '7', '55', 's:7:\"Privado\";', '2016-08-15 10:19:33', '2016-08-15 09:39:09');

-- ----------------------------
-- Table structure for attribute_value_project
-- ----------------------------
DROP TABLE IF EXISTS `attribute_value_project`;
CREATE TABLE `attribute_value_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `value` tinytext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_619DFEEBB6E62EFA` (`attribute_id`),
  KEY `IDX_619DFEEB166D1F9C` (`project_id`),
  CONSTRAINT `FK_619DFEEB166D1F9C` FOREIGN KEY (`project_id`) REFERENCES `deal_project` (`id`),
  CONSTRAINT `FK_619DFEEBB6E62EFA` FOREIGN KEY (`attribute_id`) REFERENCES `attribute_system_attribute` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of attribute_value_project
-- ----------------------------

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_2D5B02345D83CC1` (`state_id`),
  CONSTRAINT `FK_2D5B02345D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3905 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '1', 'Maracay', 'VE.01.01', '1', '2015-03-06 14:03:59', '2015-03-06 14:03:59');
INSERT INTO `city` VALUES ('2', '2', 'Vina del Mar', '3868121', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3', '2', 'Villa Alemana', '3868192', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('4', '2', 'Valparaiso', '3868626', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('5', '2', 'San Felipe', '3872255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('6', '2', 'San Antonio', '3872395', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('7', '2', 'Quilpue', '3874096', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('8', '2', 'Quillota', '3874119', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('9', '2', 'Los Andes', '3882434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('10', '2', 'Llaillay', '3883035', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('11', '2', 'Limache', '3883214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('12', '2', 'La Ligua', '3885456', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('13', '2', 'Hacienda La Calera', '3888214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('14', '2', 'Hanga Roa', '4030754', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('15', '2', 'Ostrov Paskhi', '6930873', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('16', '3', 'Puerto Cisnes', '3874982', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('17', '3', 'Puerto Aisen', '3874997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('18', '3', 'Coihaique', '3894426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('19', '3', 'Cochrane', '3894483', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('20', '3', 'Chile Chico', '3895113', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('21', '3', 'Puerto Chacabuco', '3950166', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('22', '3', 'La Junta', '3969755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('23', '4', 'Tocopilla', '3869716', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('24', '4', 'Taltal', '3870243', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('25', '4', 'San Pedro de Atacama', '3871781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('26', '4', 'Calama', '3897347', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('27', '4', 'Antofagasta', '3899539', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('28', '5', 'Villarrica', '3868158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('29', '5', 'Vilcun', '3868210', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('30', '5', 'Victoria', '3868326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('31', '5', 'Traiguen', '3869381', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('32', '5', 'Temuco', '3870011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('33', '5', 'Pucon', '3875070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('34', '5', 'Pitrufquen', '3875746', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('35', '5', 'Nueva Imperial', '3878456', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('36', '5', 'Loncoche', '3882582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('37', '5', 'Lautaro', '3883615', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('38', '5', 'Freire', '3889322', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('39', '5', 'Collipulli', '3894177', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('40', '5', 'Carahue', '3896774', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('41', '5', 'Angol', '3899629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('42', '6', 'Vallenar', '3868633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('43', '6', 'Diego de Almagro', '3892454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('44', '6', 'Copiapo', '3893656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('45', '7', 'Yumbel', '3867625', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('46', '7', 'Tome', '3869657', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('47', '7', 'Talcahuano', '3870282', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('48', '7', 'San Carlos', '3872326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('49', '7', 'Penco', '3876664', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('50', '7', 'Nacimiento', '3879123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('51', '7', 'Mulchen', '3879200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('52', '7', 'Lota', '3881276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('53', '7', 'Los Angeles', '3882428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('54', '7', 'Lebu', '3883457', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('55', '7', 'La Laja', '3885509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('56', '7', 'Curanilahue', '3892892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('57', '7', 'Coronel', '3893532', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('58', '7', 'Concepcion', '3893894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('59', '7', 'Coihueco', '3894406', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('60', '7', 'Chillan', '3895088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('61', '7', 'Chiguayante', '3895138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('62', '7', 'Canete', '3896924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('63', '7', 'Cabrero', '3897557', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('64', '7', 'Bulnes', '3897724', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('65', '7', 'Arauco', '3899462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('66', '8', 'Vicuna', '3868308', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('67', '8', 'Salamanca', '3872594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('68', '8', 'Ovalle', '3877918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('69', '8', 'Monte Patria', '3879429', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('70', '8', 'La Serena', '3884373', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('71', '8', 'Illapel', '3887344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('72', '8', 'Coquimbo', '3893629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('73', '9', 'San Vicente', '3871286', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('74', '9', 'Santa Cruz', '3871616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('75', '9', 'Rengo', '3873441', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('76', '9', 'Rancagua', '3873775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('77', '9', 'Machali', '3881102', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('78', '9', 'Graneros', '3888749', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('79', '9', 'Chimbarongo', '3895061', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('80', '10', 'Punta Arenas', '3874787', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('81', '10', 'Puerto Natales', '3874958', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('82', '11', 'Teno', '3869979', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('83', '11', 'Talca', '3870294', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('84', '11', 'San Javier', '3872154', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('85', '11', 'San Clemente', '3872306', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('86', '11', 'Parral', '3877146', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('87', '11', 'Molina', '3879627', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('88', '11', 'Longavi', '3882559', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('89', '11', 'Linares', '3883167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('90', '11', 'Curico', '3892870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('91', '11', 'Constitucion', '3893726', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('92', '11', 'Cauquenes', '3896105', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('93', '12', 'Talagante', '3870306', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('94', '12', 'Santiago', '3871336', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('95', '12', 'San Bernardo', '3872348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('96', '12', 'Vina Causino', '3875024', '1', '2015-09-05 00:00:00', '2015-09-05 13:08:06');
INSERT INTO `city` VALUES ('97', '12', 'Penaflor', '3876685', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('98', '12', 'Paine', '3877739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('99', '12', 'Melipilla', '3880107', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('100', '12', 'Lampa', '3885273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('101', '12', 'El Monte', '3890949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('102', '12', 'Buin', '3897774', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('103', '12', 'Santiago de Chile', '7114227', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('104', '12', 'La Pintana', '7281017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('105', '12', 'Lo Prado', '7281020', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('106', '13', 'Rio Bueno', '3873145', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('107', '13', 'Purranque', '3874579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('108', '13', 'Puerto Varas', '3874930', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('109', '13', 'Puerto Quellon', '3874943', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('110', '13', 'Puerto Montt', '3874960', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('111', '13', 'Panguipulli', '3877348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('112', '13', 'Palena', '3877644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('113', '13', 'Osorno', '3877949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('114', '13', 'La Union', '3883629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('115', '13', 'Futaleufu', '3889223', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('116', '13', 'Frutillar', '3889263', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('117', '13', 'Corral', '3893516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('118', '13', 'Chonchi', '3894871', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('119', '13', 'Chaiten', '3895642', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('120', '13', 'Castro', '3896218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('121', '13', 'Calbuco', '3897334', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('122', '13', 'Ancud', '3899695', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('123', '13', 'Las Gaviotas', '6458705', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('124', '13', 'Las Animas', '6458708', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('125', '14', 'Iquique', '3887127', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('126', '14', 'Arica', '3899361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('127', '16', 'Valdivia', '3868707', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('128', '17', 'Puerto Narino', '3671387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('129', '17', 'Leticia', '3676623', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('130', '18', 'Zaragoza', '3665566', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('131', '18', 'Yondo', '3665691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('132', '18', 'Yolombo', '3665693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('133', '18', 'Yarumal', '3665741', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('134', '18', 'Yali', '3665792', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('135', '18', 'Vigia del Fuerte', '3666042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('136', '18', 'Venecia', '3666193', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('137', '18', 'Valparaiso', '3666287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('138', '18', 'Valdivia', '3666333', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('139', '18', 'Urrao', '3666395', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('140', '18', 'Uramita', '3666436', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('141', '18', 'Turbo', '3666570', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('142', '18', 'Titiribi', '3667023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('143', '18', 'Tarso', '3667380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('144', '18', 'Tamesis', '3667473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('145', '18', 'Sonson', '3667820', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('146', '18', 'Segovia', '3668175', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('147', '18', 'San Vicente', '3668302', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('148', '18', 'Santuario', '3668323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('149', '18', 'Santo Domingo', '3668373', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('150', '18', 'Santa Rosa de Osos', '3668451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('151', '18', 'Santa Barbara', '3668895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('152', '18', 'San Roque', '3669011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('153', '18', 'San Rafael', '3669056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('154', '18', 'San Pedro de Uraba', '3669087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('155', '18', 'San Pedro', '3669138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('156', '18', 'San Juan de Uraba', '3669461', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('157', '18', 'San Jose de La Montana', '3669557', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('158', '18', 'San Jeronimo', '3669718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('159', '18', 'San Francisco', '3669857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('160', '18', 'San Carlos', '3669998', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('161', '18', 'San Carlos', '3670000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('162', '18', 'Salgar', '3670350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('163', '18', 'Sabaneta', '3670475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('164', '18', 'Sabanalarga', '3670506', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('165', '18', 'Rionegro', '3670730', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('166', '18', 'Retiro', '3670849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('167', '18', 'Remedios', '3670899', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('168', '18', 'Puerto Triunfo', '3671308', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('169', '18', 'Puerto Berrio', '3671540', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('170', '18', 'Pueblorrico', '3671630', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('171', '18', 'Peque', '3672512', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('172', '18', 'Necocli', '3673974', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('173', '18', 'Nechi', '3673976', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('174', '18', 'Narino', '3674027', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('175', '18', 'Mutata', '3674130', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('176', '18', 'Murindo', '3674161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('177', '18', 'Montebello', '3674519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('178', '18', 'Medellin', '3674962', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('179', '18', 'Marinilla', '3675263', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('180', '18', 'Maceo', '3675768', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('181', '18', 'Liborina', '3676591', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('182', '18', 'La Union', '3676923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('183', '18', 'La Pintada', '3678118', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('184', '18', 'La Estrella', '3679065', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('185', '18', 'La Ceja', '3679554', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('186', '18', 'Jerico', '3680317', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('187', '18', 'Jardin', '3680366', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('188', '18', 'Ituango', '3680434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('189', '18', 'Itagui', '3680450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('190', '18', 'Hispania', '3680857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('191', '18', 'Heliconia', '3680902', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('192', '18', 'Guatape', '3681368', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('193', '18', 'Guarne', '3681429', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('194', '18', 'Guadalupe', '3681731', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('195', '18', 'Granada', '3681952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('196', '18', 'Gomez Plata', '3681997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('197', '18', 'Giraldo', '3682030', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('198', '18', 'Frontino', '3682313', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('199', '18', 'Envigado', '3682631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('200', '18', 'Entrerrios', '3682633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('201', '18', 'El Bagre', '3684945', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('202', '18', 'Ebejico', '3685058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('203', '18', 'Don Matias', '3685126', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('204', '18', 'Dabeiba', '3685295', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('205', '18', 'Cruces de Anori', '3685649', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('206', '18', 'Copacabana', '3685949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('207', '18', 'Concordia', '3686013', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('208', '18', 'Concepcion', '3686028', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('209', '18', 'Cocorna', '3686158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('210', '18', 'Cisneros', '3686227', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('211', '18', 'Chigorodo', '3686636', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('212', '18', 'Caucasia', '3687025', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('213', '18', 'Carolina', '3687310', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('214', '18', 'Carmen de Viboral', '3687318', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('215', '18', 'Caramanta', '3687426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('216', '18', 'Caracoli', '3687451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('217', '18', 'Canasgordas', '3687677', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('218', '18', 'Campamento', '3687835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('219', '18', 'Caldas', '3687952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('220', '18', 'Caicedo', '3688072', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('221', '18', 'Caceres', '3688128', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('222', '18', 'Briceno', '3688499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('223', '18', 'Betulia', '3688840', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('224', '18', 'Betania', '3688855', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('225', '18', 'Belmira', '3688923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('226', '18', 'Bello', '3688928', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('227', '18', 'Barbosa', '3689205', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('228', '18', 'Armenia', '3689559', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('229', '18', 'Argelia', '3689611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('230', '18', 'Arboletes', '3689693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('231', '18', 'Apartado', '3689798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('232', '18', 'Antioquia', '3689816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('233', '18', 'Angostura', '3689870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('234', '18', 'Angelopolis', '3689877', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('235', '18', 'Los Andes', '3689899', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('236', '18', 'Amalfi', '3690010', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('237', '18', 'Amaga', '3690019', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('238', '18', 'Abriaqui', '3690582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('239', '18', 'Abejorral', '3690592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('240', '18', 'San Luis', '3770066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('241', '18', 'Fredonia', '3780602', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('242', '18', 'San Andres', '3787727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('243', '18', 'Buritica', '3792374', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('244', '18', 'Carepa', '3792375', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('245', '18', 'Ciudad Bolivar', '3792376', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('246', '18', 'Vegachi', '3792377', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('247', '19', 'Tame', '3667478', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('248', '19', 'Puerto Rondon', '3671337', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('249', '19', 'Municipio de Fortul', '3682361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('250', '19', 'Cravo Norte', '3685702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('251', '19', 'Arauquita', '3689714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('252', '19', 'Arauca', '3689718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('253', '20', 'Usiacuri', '3666370', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('254', '20', 'Tubara', '3666673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('255', '20', 'Suan', '3667780', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('256', '20', 'Soledad', '3667849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('257', '20', 'Sitionuevo', '3667918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('258', '20', 'Santo Tomas', '3668332', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('259', '20', 'Santa Lucia', '3668655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('260', '20', 'Sabanalarga', '3670502', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('261', '20', 'Sabanagrande', '3670513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('262', '20', 'Repelon', '3670874', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('263', '20', 'Puerto Colombia', '3671497', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('264', '20', 'Ponedera', '3671936', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('265', '20', 'Polonuevo', '3671950', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('266', '20', 'Piojo', '3672176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('267', '20', 'Palmar de Varela', '3673220', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('268', '20', 'Manati', '3675512', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('269', '20', 'Malambo', '3675595', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('270', '20', 'Luruaco', '3675826', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('271', '20', 'Juan de Acosta', '3680176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('272', '20', 'Galapa', '3682238', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('273', '20', 'Candelaria', '3687634', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('274', '20', 'Campo de la Cruz', '3687758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('275', '20', 'Barranquilla', '3689147', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('276', '20', 'Baranoa', '3689235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('277', '21', 'Valparaiso', '3666291', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('278', '21', 'Solano', '3667868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('279', '21', 'Puerto Rico', '3671348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('280', '21', 'Morelia', '3674393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('281', '21', 'Milan', '3674784', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('282', '21', 'La Montanita', '3678363', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('283', '21', 'Florencia', '3682426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('284', '21', 'El Paujil', '3683528', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('285', '21', 'El Doncello', '3684276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('286', '21', 'Belen de los Andaquies', '3688991', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('287', '21', 'Albania', '3690262', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('288', '21', 'Curillo', '3733861', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('289', '21', 'Cartagena del Chaira', '3792382', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('290', '22', 'Totoro', '3666834', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('291', '22', 'Toribio', '3666887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('292', '22', 'Timbiqui', '3667070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('293', '22', 'Sucre', '3667732', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('294', '22', 'Suarez', '3667773', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('295', '22', 'Silvia', '3668025', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('296', '22', 'Santander de Quilichao', '3668572', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('297', '22', 'San Bernardo', '3670034', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('298', '22', 'Rosas', '3670595', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('299', '22', 'Puerto Tejada', '3671315', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('300', '22', 'Popayan', '3671916', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('301', '22', 'Patia', '3672761', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('302', '22', 'Paispamba', '3673368', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('303', '22', 'Belalcazar', '3673398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('304', '22', 'Padilla', '3673407', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('305', '22', 'Miranda', '3674702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('306', '22', 'Mercaderes', '3674851', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('307', '22', 'Lopez', '3676417', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('308', '22', 'La Vega', '3676868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('309', '22', 'La Sierra', '3677457', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('310', '22', 'La Cruz', '3679379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('311', '22', 'Jambalo', '3680393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('312', '22', 'Inza', '3680554', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('313', '22', 'Guapi', '3681505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('314', '22', 'Genova', '3682070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('315', '22', 'Florencia', '3682425', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('316', '22', 'El Tambo', '3682963', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('317', '22', 'El Bordo', '3684860', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('318', '22', 'Corinto', '3685871', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('319', '22', 'Cartago', '3687231', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('320', '22', 'Caloto', '3687880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('321', '22', 'Caldono', '3687933', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('322', '22', 'Cajibio', '3688009', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('323', '22', 'Buenos Aires', '3688357', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('324', '22', 'Balboa', '3689292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('325', '22', 'Argelia', '3689615', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('326', '22', 'Almaguer', '3690136', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('327', '22', 'Morales', '3770718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('328', '22', 'Villa Rica', '3770955', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('329', '23', 'Valledupar', '3666304', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('330', '23', 'Tamalameque', '3667528', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('331', '23', 'San Diego', '3669947', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('332', '23', 'San Alberto', '3670242', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('333', '23', 'Rio de Oro', '3670756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('334', '23', 'Pelaya', '3672599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('335', '23', 'Pailitas', '3673379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('336', '23', 'La Paz', '3678186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('337', '23', 'La Jagua de Ibirico', '3678674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('338', '23', 'La Gloria', '3678907', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('339', '23', 'Gonzalez', '3681990', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('340', '23', 'Gamarra', '3682182', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('341', '23', 'El Paso', '3683538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('342', '23', 'El Copey', '3684452', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('343', '23', 'Curumani', '3685335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('344', '23', 'Chiriguana', '3686479', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('345', '23', 'Chimichagua', '3686585', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('346', '23', 'Becerril', '3689026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('347', '23', 'Astrea', '3689458', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('348', '23', 'Ariguani', '3689589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('349', '23', 'Aguachica', '3690465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('350', '23', 'Agustin Codazzi', '3792383', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('351', '23', 'Manaure Balcon del Cesar', '3792384', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('352', '23', 'San Martin', '3792385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('353', '24', 'Unguia', '3666475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('354', '24', 'Tado', '3667579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('355', '24', 'San Jose del Palmar', '3669549', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('356', '24', 'Riosucio', '3670718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('357', '24', 'Quibdo', '3671116', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('358', '24', 'Pizarro', '3672086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('359', '24', 'Pie de Pato', '3672327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('360', '24', 'Nuqui', '3673690', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('361', '24', 'Novita', '3673783', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('362', '24', 'Lloro', '3676477', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('363', '24', 'Jurado', '3680090', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('364', '24', 'Istmina', '3680453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('365', '24', 'El Carmen', '3684692', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('366', '24', 'Condoto', '3686002', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('367', '24', 'Certegui', '3686883', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('368', '24', 'Mutis', '3689325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('369', '24', 'Bagado', '3689336', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('370', '24', 'Acandi', '3690572', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('371', '24', 'Bellavista', '3766939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('372', '24', 'El Canton de San Pablo', '3792386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('373', '24', 'Santa Genoveva de Docorodo', '3792408', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('374', '25', 'Valencia', '3666326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('375', '25', 'Tierralta', '3667158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('376', '25', 'San Pelayo', '3669084', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('377', '25', 'San Carlos', '3669997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('378', '25', 'San Bernardo del Viento', '3670018', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('379', '25', 'San Antero', '3670199', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('380', '25', 'Sahagun', '3670419', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('381', '25', 'Purisima', '3671203', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('382', '25', 'Puerto Escondido', '3671470', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('383', '25', 'Pueblo Nuevo', '3671655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('384', '25', 'Planeta Rica', '3672068', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('385', '25', 'Monteria', '3674453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('386', '25', 'Montelibano', '3674470', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('387', '25', 'Monitos', '3674569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('388', '25', 'Momil', '3674603', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('389', '25', 'Los Cordobas', '3676205', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('390', '25', 'Lorica', '3676397', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('391', '25', 'Cotorra', '3685724', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('392', '25', 'Cienaga de Oro', '3686272', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('393', '25', 'Chinu', '3686540', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('394', '25', 'Chima', '3686605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('395', '25', 'Cerete', '3686922', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('396', '25', 'Buenavista', '3688397', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('397', '25', 'Ayapel', '3689381', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('398', '25', 'Canalete', '3779399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('399', '25', 'San Carlos', '3783663', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('400', '26', 'Miraflores', '3674740', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('401', '26', 'Calamar', '3687975', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('402', '26', 'El Retorno', '3792387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('403', '26', 'San Jose del Guaviare', '3828545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('404', '27', 'Inirida', '3671450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('405', '28', 'Yaguara', '3665803', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('406', '28', 'Villavieja', '3665898', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('407', '28', 'Timana', '3667082', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('408', '28', 'Tesalia', '3667244', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('409', '28', 'Teruel', '3667247', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('410', '28', 'Tello', '3667323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('411', '28', 'Tarqui', '3667386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('412', '28', 'Suaza', '3667764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('413', '28', 'Santa Maria', '3668635', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('414', '28', 'San Agustin', '3670260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('415', '28', 'Saladoblanco', '3670383', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('416', '28', 'Rivera', '3670692', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('417', '28', 'Pitalito', '3672110', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('418', '28', 'Pital', '3672123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('419', '28', 'Palestina', '3673275', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('420', '28', 'Palermo', '3673286', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('421', '28', 'Paicol', '3673386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('422', '28', 'Oporapa', '3673578', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('423', '28', 'Neiva', '3673899', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('424', '28', 'Nataga', '3674012', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('425', '28', 'La Plata', '3678097', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('426', '28', 'Iquira', '3680531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('427', '28', 'Hobo', '3680854', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('428', '28', 'Guadalupe', '3681733', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('429', '28', 'Gigante', '3682047', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('430', '28', 'Garzon', '3682108', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('431', '28', 'Elias', '3684029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('432', '28', 'Colombia', '3686120', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('433', '28', 'Campoalegre', '3687806', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('434', '28', 'Baraya', '3689232', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('435', '28', 'Altamira', '3690102', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('436', '28', 'Algeciras', '3690160', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('437', '28', 'Aipe', '3690287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('438', '28', 'Agrado', '3690520', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('439', '28', 'Acevedo', '3690552', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('440', '28', 'Isnos', '3792389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('441', '28', 'La Argentina', '3792743', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('442', '29', 'Villanueva', '3665934', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('443', '29', 'Urumita', '3666381', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('444', '29', 'Uribia', '3666409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('445', '29', 'San Juan del Cesar', '3669469', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('446', '29', 'Riohacha', '3670745', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('447', '29', 'Manaure', '3675504', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('448', '29', 'Maicao', '3675657', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('449', '29', 'Fonseca', '3682374', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('450', '29', 'El Molino', '3683778', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('451', '29', 'Distraccion', '3685200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('452', '29', 'Dibulla', '3685223', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('453', '29', 'Barrancas', '3689162', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('454', '29', 'Albania', '3690250', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('455', '30', 'Vista Hermosa', '3665860', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('456', '30', 'Villavicencio', '3665900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('457', '30', 'San Martin', '3669332', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('458', '30', 'San Luis de Cubarral', '3669358', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('459', '30', 'San Juan de Arama', '3669482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('460', '30', 'San Carlos de Guaroa', '3669987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('461', '30', 'Restrepo', '3670855', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('462', '30', 'Puerto Rico', '3671346', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('463', '30', 'Puerto Lopez', '3671418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('464', '30', 'Puerto Lleras', '3671424', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('465', '30', 'Guamal', '3681605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('466', '30', 'Granada', '3681957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('467', '30', 'Fuente de Oro', '3682299', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('468', '30', 'El Castillo', '3684662', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('469', '30', 'Cumaral', '3685442', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('470', '30', 'Castilla La Nueva', '3687084', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('471', '30', 'Cabuyaro', '3688151', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('472', '30', 'Barranca de Upia', '3689167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('473', '30', 'Acacias', '3690577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('474', '30', 'Lejanias', '3732964', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('475', '30', 'El Dorado', '3733434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('476', '30', 'Mesetas', '3763578', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('477', '30', 'Puerto Gaitan', '3769976', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('478', '30', 'Mapiripan', '3792394', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('479', '30', 'Puerto Concordia', '3792395', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('480', '30', 'La Macarena', '3827693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('481', '31', 'Yacuanquer', '3665811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('482', '31', 'Tuquerres', '3666582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('483', '31', 'Tumaco', '3666640', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('484', '31', 'Tangua', '3667447', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('485', '31', 'Taminango', '3667471', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('486', '31', 'Sotomayor', '3667791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('487', '31', 'Sapuyes', '3668268', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('488', '31', 'San Pablo', '3669214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('489', '31', 'San Lorenzo', '3669440', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('490', '31', 'San Jose', '3669654', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('491', '31', 'Sandona', '3669938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('492', '31', 'Samaniego', '3670293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('493', '31', 'Ricaurte', '3670816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('494', '31', 'Pupiales', '3671228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('495', '31', 'Puerres', '3671576', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('496', '31', 'Providencia', '3671714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('497', '31', 'Potosi', '3671848', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('498', '31', 'Policarpa', '3671961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('499', '31', 'Francisco Pizarro', '3672087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('500', '31', 'Piedrancha', '3672295', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('501', '31', 'Payan', '3672665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('502', '31', 'Pasto', '3672778', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('503', '31', 'Ospina', '3673482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('504', '31', 'Olaya Herrera', '3673609', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('505', '31', 'Narino', '3674031', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('506', '31', 'Mosquera', '3674293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('507', '31', 'Linares', '3676540', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('508', '31', 'Leiva', '3676661', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('509', '31', 'La Union', '3676934', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('510', '31', 'La Llanada', '3678575', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('511', '31', 'La Florida', '3679007', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('512', '31', 'Iscuande', '3680491', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('513', '31', 'Ipiales', '3680539', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('514', '31', 'Imues', '3680601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('515', '31', 'Iles', '3680616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('516', '31', 'Gualmatan', '3681619', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('517', '31', 'Guaitarilla', '3681644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('518', '31', 'Guachucal', '3681756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('519', '31', 'Funes', '3682283', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('520', '31', 'El Tambo', '3682965', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('521', '31', 'El Tablon', '3682981', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('522', '31', 'El Rosario', '3683149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('523', '31', 'El Penol', '3683508', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('524', '31', 'El Charco', '3684579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('525', '31', 'Cumbitara', '3685428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('526', '31', 'Cumbal', '3685432', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('527', '31', 'Cordoba', '3685903', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('528', '31', 'Contadero', '3685974', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('529', '31', 'Consaca', '3685984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('530', '31', 'Chachagui', '3686867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('531', '31', 'Carlosama', '3687335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('532', '31', 'Buesaco', '3688266', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('533', '31', 'Arboleda', '3688875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('534', '31', 'Belen', '3689006', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('535', '31', 'Barbacoas', '3689228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('536', '31', 'Ancuya', '3689915', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('537', '31', 'Aldana', '3690226', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('538', '31', 'Santacruz', '3735680', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('539', '31', 'La Tola', '3792396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('540', '32', 'Villa del Rosario', '3665913', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('541', '32', 'Toledo', '3666959', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('542', '32', 'Tibu', '3667202', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('543', '32', 'Silos', '3668033', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('544', '32', 'Sardinata', '3668245', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('545', '32', 'Santiago', '3668396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('546', '32', 'San Cayetano', '3669977', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('547', '32', 'San Calixto', '3670011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('548', '32', 'Ragonvalia', '3671018', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('549', '32', 'Puerto Santander', '3671325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('550', '32', 'Pamplona', '3673045', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('551', '32', 'Ocana', '3673662', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('552', '32', 'Lourdes', '3675857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('553', '32', 'Los Patios', '3675975', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('554', '32', 'La Playa', '3678083', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('555', '32', 'La Esperanza', '3679130', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('556', '32', 'Labateca', '3679780', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('557', '32', 'Herran', '3680886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('558', '32', 'Hacari', '3681168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('559', '32', 'Gramalote', '3681966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('560', '32', 'El Zulia', '3682682', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('561', '32', 'El Carmen', '3684683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('562', '32', 'Durania', '3685069', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('563', '32', 'Cucutilla', '3685529', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('564', '32', 'Cucuta', '3685533', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('565', '32', 'Chitaga', '3686460', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('566', '32', 'Chinacota', '3686574', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('567', '32', 'Cacota', '3688087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('568', '32', 'Cachira', '3688106', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('569', '32', 'Bochalema', '3688705', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('570', '32', 'Arboledas', '3689697', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('571', '32', 'Abrego', '3690584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('572', '32', 'El Tarra', '3738301', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('573', '33', 'Villagarzon', '3665992', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('574', '33', 'Sibundoy', '3668078', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('575', '33', 'Santiago', '3668400', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('576', '33', 'San Miguel', '3669293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('577', '33', 'San Francisco', '3669881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('578', '33', 'Puerto Leguizamo', '3671437', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('579', '33', 'Puerto Asis', '3671549', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('580', '33', 'Mocoa', '3674654', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('581', '33', 'Colon', '3686107', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('582', '33', 'Puerto Guzman', '3792398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('583', '33', 'Valle del Guamuez', '3827723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('584', '33', 'Orito', '3829343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('585', '34', 'Salento', '3670352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('586', '34', 'Quimbaya', '3671098', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('587', '34', 'Pijao', '3672255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('588', '34', 'Montenegro', '3674463', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('589', '34', 'La Tebaida', '3677010', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('590', '34', 'Genova', '3682068', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('591', '34', 'Filandia', '3682473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('592', '34', 'Cordoba', '3685900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('593', '34', 'Circasia', '3686233', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('594', '34', 'Calarca', '3687964', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('595', '34', 'Buenavista', '3688433', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('596', '34', 'Armenia', '3689560', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('597', '35', 'Santuario', '3668324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('598', '35', 'Santa Rosa de Cabal', '3668454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('599', '35', 'Quinchia', '3671091', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('600', '35', 'Pueblo Rico', '3671633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('601', '35', 'Pereira', '3672486', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('602', '35', 'Mistrato', '3674678', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('603', '35', 'Marsella', '3675212', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('604', '35', 'La Virginia', '3676720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('605', '35', 'La Merced', '3678415', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('606', '35', 'La Celia', '3679542', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('607', '35', 'Guatica', '3681353', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('608', '35', 'Dos Quebradas', '3685095', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('609', '35', 'Belen de Umbria', '3688989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('610', '35', 'Balboa', '3689291', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('611', '35', 'Apia', '3689793', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('612', '35', 'Anserma', '3689833', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('613', '36', 'San Andres', '3670218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('614', '36', 'Mountain', '3674272', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('615', '37', 'Zapatoca', '3665587', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('616', '37', 'Villanueva', '3665949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('617', '37', 'Vetas', '3666092', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('618', '37', 'Velez', '3666232', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('619', '37', 'Valle de San Jose', '3666311', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('620', '37', 'Sucre', '3667731', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('621', '37', 'Suaita', '3667783', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('622', '37', 'Socorro', '3667887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('623', '37', 'Simacota', '3668023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('624', '37', 'San Vicente de Chucuri', '3668292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('625', '37', 'San Jose de Miranda', '3669545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('626', '37', 'San Gil', '3669808', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('627', '37', 'San Andres', '3670224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('628', '37', 'Sabana de Torres', '3670520', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('629', '37', 'Puerto Wilches', '3671287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('630', '37', 'Puerto Parra', '3671371', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('631', '37', 'Puente Nacional', '3671591', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('632', '37', 'Piedecuesta', '3672328', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('633', '37', 'Onzaga', '3673590', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('634', '37', 'Oiba', '3673637', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('635', '37', 'Molagavita', '3674618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('636', '37', 'Mogotes', '3674640', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('637', '37', 'Matanza', '3675118', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('638', '37', 'Malaga', '3675605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('639', '37', 'Lebrija', '3676674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('640', '37', 'La Paz', '3678190', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('641', '37', 'Landazuri', '3678328', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('642', '37', 'La Belleza', '3679776', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('643', '37', 'Guepsa', '3681234', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('644', '37', 'Guadalupe', '3681732', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('645', '37', 'Guaca', '3681832', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('646', '37', 'Giron', '3682018', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('647', '37', 'Galan', '3682243', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('648', '37', 'Floridablanca', '3682385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('649', '37', 'Florian', '3682395', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('650', '37', 'El Carmen', '3684689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('651', '37', 'Curiti', '3685345', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('652', '37', 'Coromoro', '3685840', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('653', '37', 'Contratacion', '3685961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('654', '37', 'Concepcion', '3686027', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('655', '37', 'Cimitarra', '3686255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('656', '37', 'Cerrito', '3686907', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('657', '37', 'Capitanejo', '3687490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('658', '37', 'Bucaramanga', '3688465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('659', '37', 'Bolivar', '3688656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('660', '37', 'Betulia', '3688839', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('661', '37', 'Barrancabermeja', '3689169', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('662', '37', 'Barichara', '3689187', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('663', '37', 'Barbosa', '3689206', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('664', '37', 'Aratoca', '3689723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('665', '37', 'Los Santos', '3732273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('666', '37', 'El Playon', '3792399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('667', '38', 'Toluviejo', '3666936', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('668', '38', 'Tolu', '3666939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('669', '38', 'Sucre', '3667728', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('670', '38', 'Sincelejo', '3667983', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('671', '38', 'Since', '3667991', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('672', '38', 'San Pedro', '3669128', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('673', '38', 'San Onofre', '3669218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('674', '38', 'San Marcos', '3669346', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('675', '38', 'San Juan de Betulia', '3669480', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('676', '38', 'San Benito Abad', '3670038', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('677', '38', 'Sampues', '3670280', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('678', '38', 'Palmito', '3673143', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('679', '38', 'Ovejas', '3673455', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('680', '38', 'Morroa', '3674337', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('681', '38', 'Majagual', '3675637', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('682', '38', 'Los Palmitos', '3675987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('683', '38', 'La Union', '3676912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('684', '38', 'Galeras', '3682232', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('685', '38', 'El Roble', '3683180', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('686', '38', 'Corozal', '3685823', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('687', '38', 'Coloso', '3686065', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('688', '38', 'Chalan', '3686835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('689', '38', 'Caimito', '3688030', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('690', '39', 'Villarrica', '3665910', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('691', '39', 'Villahermosa', '3665986', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('692', '39', 'Venadillo', '3666226', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('693', '39', 'Valle de San Juan', '3666309', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('694', '39', 'Suarez', '3667772', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('695', '39', 'San Luis', '3669399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('696', '39', 'San Antonio', '3670162', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('697', '39', 'Saldana', '3670357', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('698', '39', 'Rovira', '3670587', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('699', '39', 'Roncesvalles', '3670629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('700', '39', 'Rioblanco', '3670764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('701', '39', 'Purificacion', '3671208', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('702', '39', 'Prado', '3671765', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('703', '39', 'Planadas', '3672077', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('704', '39', 'Piedras', '3672290', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('705', '39', 'Palocabildo', '3673126', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('706', '39', 'Ortega', '3673511', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('707', '39', 'Natagaima', '3674010', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('708', '39', 'Murillo', '3674166', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('709', '39', 'Melgar', '3674885', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('710', '39', 'Mariquita', '3675252', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('711', '39', 'Libano', '3676604', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('712', '39', 'Lerida', '3676626', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('713', '39', 'Icononzo', '3680641', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('714', '39', 'Ibague', '3680656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('715', '39', 'Honda', '3680840', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('716', '39', 'Herveo', '3680880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('717', '39', 'Guamo', '3681563', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('718', '39', 'Fresno', '3682330', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('719', '39', 'Flandes', '3682458', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('720', '39', 'Falan', '3682510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('721', '39', 'Espinal', '3682573', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('722', '39', 'Cunday', '3685418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('723', '39', 'Coyaima', '3685708', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('724', '39', 'Chaparral', '3686793', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('725', '39', 'Casabianca', '3687213', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('726', '39', 'Carmen de Apicala', '3687324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('727', '39', 'Cajamarca', '3688021', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('728', '39', 'Ataco', '3689450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('729', '39', 'Guayabal', '3689551', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('730', '39', 'Anzoategui', '3689802', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('731', '39', 'Ambalema', '3689979', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('732', '39', 'Alvarado', '3690030', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('733', '40', 'Zarzal', '3665559', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('734', '40', 'Yumbo', '3665657', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('735', '40', 'Yotoco', '3665678', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('736', '40', 'Vijes', '3666025', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('737', '40', 'Versalles', '3666102', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('738', '40', 'Ulloa', '3666502', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('739', '40', 'Tulua', '3666645', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('740', '40', 'Trujillo', '3666680', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('741', '40', 'Toro', '3666881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('742', '40', 'Sevilla', '3668132', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('743', '40', 'San Pedro', '3669156', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('744', '40', 'Roldanillo', '3670644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('745', '40', 'Riofrio', '3670754', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('746', '40', 'Restrepo', '3670856', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('747', '40', 'Pradera', '3671772', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('748', '40', 'Palmira', '3673164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('749', '40', 'Obando', '3673676', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('750', '40', 'La Victoria', '3676791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('751', '40', 'La Union', '3676928', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('752', '40', 'Jamundi', '3680387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('753', '40', 'Guacari', '3681797', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('754', '40', 'Ginebra', '3682039', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('755', '40', 'Florida', '3682393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('756', '40', 'El Dovio', '3684266', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('757', '40', 'El Cerrito', '3684615', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('758', '40', 'El Cairo', '3684785', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('759', '40', 'El Aguila', '3685027', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('760', '40', 'Dagua', '3685292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('761', '40', 'Cartago', '3687230', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('762', '40', 'Candelaria', '3687644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('763', '40', 'Cali', '3687925', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('764', '40', 'Caicedonia', '3688071', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('765', '40', 'Bugalagrande', '3688254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('766', '40', 'Buga', '3688256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('767', '40', 'Buenaventura', '3688451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('768', '40', 'Buenaventura', '3688452', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('769', '40', 'Bolivar', '3688659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('770', '40', 'Argelia', '3689613', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('771', '40', 'Ansermanuevo', '3689831', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('772', '40', 'Andalucia', '3689905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('773', '40', 'Alcala', '3690237', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('774', '40', 'La Cumbre', '3778835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('775', '41', 'Mitu', '3674676', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('776', '42', 'Puerto Carreno', '3671519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('777', '42', 'La Primavera', '3678000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('778', '43', 'Yopal', '3665688', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('779', '43', 'Villanueva', '3665951', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('780', '43', 'Trinidad', '3666719', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('781', '43', 'Tauramena', '3667355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('782', '43', 'Tamara', '3667516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('783', '43', 'San Luis de Palenque', '3669352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('784', '43', 'Pore', '3671901', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('785', '43', 'Pajarito', '3673352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('786', '43', 'Orocue', '3673536', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('787', '43', 'Nunchia', '3673695', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('788', '43', 'Mani', '3675452', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('789', '43', 'Municipio Hato Corozal', '3681008', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('790', '43', 'Aguazul', '3690316', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('791', '43', 'Monterrey', '3769932', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('792', '43', 'Sabanalarga', '3769988', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('793', '44', 'Zipaquira', '3665542', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('794', '44', 'Zipacon', '3665544', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('795', '44', 'Yacopi', '3665813', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('796', '44', 'Viota', '3665881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('797', '44', 'Villeta', '3665895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('798', '44', 'Villapinzon', '3665924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('799', '44', 'Viani', '3666087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('800', '44', 'Vergara', '3666111', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('801', '44', 'Venecia', '3666203', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('802', '44', 'Utica', '3666363', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('803', '44', 'Une', '3666481', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('804', '44', 'Umbita', '3666493', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('805', '44', 'Ubate', '3666519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('806', '44', 'Ubaque', '3666522', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('807', '44', 'Ubala', '3666526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('808', '44', 'Topaipi', '3666903', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('809', '44', 'Tocancipa', '3666997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('810', '44', 'Tocaima', '3667003', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('811', '44', 'Tenza', '3667288', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('812', '44', 'Tenjo', '3667290', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('813', '44', 'Tabio', '3667629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('814', '44', 'Sutatausa', '3667649', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('815', '44', 'Susa', '3667665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('816', '44', 'Supata', '3667701', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('817', '44', 'Suesca', '3667717', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('818', '44', 'Subachoque', '3667760', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('819', '44', 'Sopo', '3667807', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('820', '44', 'Soacha', '3667905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('821', '44', 'Simijaca', '3668017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('822', '44', 'Silvania', '3668028', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('823', '44', 'Sibate', '3668087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('824', '44', 'Sesquile', '3668138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('825', '44', 'Sasaima', '3668228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('826', '44', 'San Francisco', '3669860', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('827', '44', 'Ricaurte', '3670812', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('828', '44', 'Apulo', '3671020', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('829', '44', 'Quipile', '3671072', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('830', '44', 'Quetame', '3671119', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('831', '44', 'Puerto Salgar', '3671330', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('832', '44', 'Pasca', '3672813', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('833', '44', 'Pandi', '3672997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('834', '44', 'Pacho', '3673424', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('835', '44', 'Nocaima', '3673826', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('836', '44', 'Nilo', '3673849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('837', '44', 'Nemocon', '3673887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('838', '44', 'Narino', '3674029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('839', '44', 'Mosquera', '3674292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('840', '44', 'Medina', '3674931', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('841', '44', 'Manta', '3675432', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('842', '44', 'Madrid', '3675707', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('843', '44', 'Macheta', '3675757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('844', '44', 'Lenguazaque', '3676644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('845', '44', 'La Vega', '3676864', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('846', '44', 'La Pena', '3678167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('847', '44', 'La Mesa', '3678405', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('848', '44', 'La Calera', '3679660', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('849', '44', 'Junin', '3680113', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('850', '44', 'Guayabetal', '3681303', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('851', '44', 'Guayabal de Siquima', '3681306', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('852', '44', 'Guatavita', '3681360', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('853', '44', 'Guataqui', '3681364', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('854', '44', 'Guasca', '3681404', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('855', '44', 'Guaduas', '3681702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('856', '44', 'Guacheta', '3681767', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('857', '44', 'Granada', '3681953', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('858', '44', 'Girardot', '3682028', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('859', '44', 'Gachancipa', '3682262', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('860', '44', 'Gachala', '3682266', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('861', '44', 'Fusagasuga', '3682274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('862', '44', 'Funza', '3682281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('863', '44', 'Fosca', '3682358', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('864', '44', 'Fomeque', '3682380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('865', '44', 'Facatativa', '3682516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('866', '44', 'El Rosal', '3683155', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('867', '44', 'Cucunuba', '3685540', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('868', '44', 'Cota', '3685733', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('869', '44', 'Cogua', '3686134', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('870', '44', 'Choconta', '3686422', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('871', '44', 'Choachi', '3686441', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('872', '44', 'Chipaque', '3686532', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('873', '44', 'Chia', '3686675', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('874', '44', 'Chaguani', '3686851', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('875', '44', 'Carmen de Carupa', '3687321', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('876', '44', 'Caqueza', '3687476', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('877', '44', 'Caparrapi', '3687505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('878', '44', 'Cajica', '3688006', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('879', '44', 'Cachipay', '3688112', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('880', '44', 'Cabrera', '3688170', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('881', '44', 'Bojaca', '3688673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('882', '44', 'Arbelaez', '3689709', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('883', '44', 'Anolaima', '3689841', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('884', '44', 'Anapoima', '3689941', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('885', '44', 'Alban', '3690264', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('886', '44', 'Agua de Dios', '3690429', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('887', '44', 'Paratebueno', '3769960', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('888', '44', 'Gacheta', '3781883', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('889', '44', 'San Antonio del Tequendama', '3792404', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('890', '44', 'Tibacuy', '3792406', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('891', '45', 'Bogota', '3688689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('892', '46', 'Villanueva', '3665935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('893', '46', 'Turbana', '3666575', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('894', '46', 'Turbaco', '3666577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('895', '46', 'Talaigua Viejo', '3667547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('896', '46', 'Soplaviento', '3667811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('897', '46', 'Simiti', '3668012', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('898', '46', 'San Zenon', '3668286', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('899', '46', 'Santa Rosa', '3668472', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('900', '46', 'Santa Catalina', '3668861', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('901', '46', 'San Pablo', '3669188', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('902', '46', 'San Juan Nepomuceno', '3669454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('903', '46', 'San Jacinto', '3669736', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('904', '46', 'San Fernando', '3669895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('905', '46', 'San Estanislao', '3669929', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('906', '46', 'San Cristobal', '3669956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('907', '46', 'Rio Viejo', '3670709', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('908', '46', 'Regidor', '3670910', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('909', '46', 'Pinillos', '3672197', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('910', '46', 'Morales', '3674412', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('911', '46', 'Montecristo', '3674499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('912', '46', 'Mompos', '3674597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('913', '46', 'Maria la Baja', '3675287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('914', '46', 'Margarita', '3675305', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('915', '46', 'Mahates', '3675668', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('916', '46', 'Magangue', '3675692', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('917', '46', 'Hatillo de Loba', '3681029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('918', '46', 'El Guamo', '3684115', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('919', '46', 'El Carmen de Bolivar', '3684666', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('920', '46', 'Cordoba', '3685893', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('921', '46', 'Clemencia', '3686196', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('922', '46', 'Cicuco', '3686288', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('923', '46', 'Cartagena', '3687238', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('924', '46', 'Cantagallo', '3687541', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('925', '46', 'Barranco de Loba', '3689157', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('926', '46', 'Arroyohondo', '3689507', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('927', '46', 'Arjona', '3689570', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('928', '46', 'Arenal', '3689653', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('929', '46', 'Achi', '3690549', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('930', '46', 'Altos del Rosario', '3792378', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('931', '46', 'Santa Rosa del Sur', '3792379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('932', '46', 'Tiquisio', '3792380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('933', '47', 'Zetaquira', '3665547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('934', '47', 'Villa de Leiva', '3666003', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('935', '47', 'Ventaquemada', '3666163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('936', '47', 'Tuta', '3666550', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('937', '47', 'Turmeque', '3666562', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('938', '47', 'Tunja', '3666608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('939', '47', 'Topaga', '3666905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('940', '47', 'Toca', '3667007', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('941', '47', 'Tipacoque', '3667044', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('942', '47', 'Tibasosa', '3667211', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('943', '47', 'Tibana', '3667218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('944', '47', 'Tasco', '3667373', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('945', '47', 'Sutamarchan', '3667651', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('946', '47', 'Susacon', '3667660', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('947', '47', 'Sotaquira', '3667796', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('948', '47', 'Somondoco', '3667834', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('949', '47', 'Sogamoso', '3667873', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('950', '47', 'Socota', '3667880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('951', '47', 'Socha Viejo', '3667892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('952', '47', 'Soata', '3667901', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('953', '47', 'Siachoque', '3668096', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('954', '47', 'Santa Sofia', '3668434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('955', '47', 'Santa Rosa de Viterbo', '3668447', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('956', '47', 'Santana', '3668594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('957', '47', 'Santa Maria', '3668631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('958', '47', 'San Pablo de Borbur', '3669173', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('959', '47', 'San Mateo', '3669310', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('960', '47', 'San Luis de Gaceno', '3669355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('961', '47', 'Samaca', '3670303', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('962', '47', 'Sachica', '3670431', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('963', '47', 'Saboya', '3670447', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('964', '47', 'Raquira', '3670966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('965', '47', 'Ramiriqui', '3671002', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('966', '47', 'Puerto Boyaca', '3671531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('967', '47', 'Pesca', '3672428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('968', '47', 'Pauna', '3672698', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('969', '47', 'Paipa', '3673369', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('970', '47', 'Paez', '3673397', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('971', '47', 'Otanche', '3673475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('972', '47', 'Nobsa', '3673829', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('973', '47', 'Muzo', '3674121', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('974', '47', 'Moniquira', '3674572', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('975', '47', 'Mongui', '3674576', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('976', '47', 'Mongua', '3674580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('977', '47', 'Miraflores', '3674735', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('978', '47', 'Maripi', '3675255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('979', '47', 'La Uvita', '3676884', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('980', '47', 'La Capilla', '3679622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('981', '47', 'Jenesano', '3680335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('982', '47', 'Guican', '3681222', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('983', '47', 'Guayata', '3681255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('984', '47', 'Guateque', '3681356', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('985', '47', 'Garagoa', '3682160', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('986', '47', 'Gameza', '3682172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('987', '47', 'Floresta', '3682400', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('988', '47', 'Firavitoba', '3682465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('989', '47', 'El Espino', '3684189', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('990', '47', 'El Cocuy', '3684510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('991', '47', 'Duitama', '3685084', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('992', '47', 'Cucaita', '3685569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('993', '47', 'Cubara', '3685571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('994', '47', 'Corrales', '3685794', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('995', '47', 'Combita', '3686051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('996', '47', 'Cienega', '3686262', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('997', '47', 'Chita', '3686464', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('998', '47', 'Chiscas', '3686471', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('999', '47', 'Chiquinquira', '3686513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1000', '47', 'Chinavita', '3686569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1001', '47', 'Cerinza', '3686918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1002', '47', 'Boavita', '3688775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1003', '47', 'Belen', '3689003', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1004', '47', 'Arcabuco', '3689689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1005', '47', 'Aquitania', '3689771', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1006', '47', 'Chivor', '3769623', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1007', '47', 'Quipama', '3775262', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1008', '47', 'Cubara', '6196086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1009', '48', 'Viterbo', '3665851', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1010', '48', 'Villamaria', '3665973', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1011', '48', 'Victoria', '3666075', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1012', '48', 'Supia', '3667697', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1013', '48', 'San Jose', '3669623', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1014', '48', 'Salamina', '3670370', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1015', '48', 'Risaralda', '3670700', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1016', '48', 'Riosucio', '3670719', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1017', '48', 'Pensilvania', '3672521', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1018', '48', 'Palestina', '3673269', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1019', '48', 'Pacora', '3673413', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1020', '48', 'Norcasia', '3673811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1021', '48', 'Neira', '3673902', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1022', '48', 'Marulanda', '3675191', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1023', '48', 'Marquetalia', '3675234', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1024', '48', 'Marmato', '3675242', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1025', '48', 'Manzanares', '3675409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1026', '48', 'Manizales', '3675443', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1027', '48', 'La Dorada', '3679277', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1028', '48', 'Filadelfia', '3682481', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1029', '48', 'Chinchina', '3686561', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1030', '48', 'Belalcazar', '3689012', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1031', '48', 'Aranzazu', '3689740', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1032', '48', 'Aguadas', '3690431', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1033', '49', 'Zambrano', '3665616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1034', '49', 'Santa Marta', '3668605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1035', '49', 'Santa Ana', '3668937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1036', '49', 'San Antonio', '3670107', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1037', '49', 'Salamina', '3670368', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1038', '49', 'Remolino', '3670884', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1039', '49', 'Puebloviejo', '3671615', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1040', '49', 'Pivijay', '3672093', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1041', '49', 'Pijino', '3672249', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1042', '49', 'Pedraza', '3672633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1043', '49', 'Nueva Granada', '3673756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1044', '49', 'Guamal', '3681596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1045', '49', 'Fundacion', '3682292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1046', '49', 'El Reten', '3683233', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1047', '49', 'El Pinon', '3683463', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1048', '49', 'El Penon', '3683497', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1049', '49', 'El Banco', '3684917', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1050', '49', 'Concordia', '3686011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1051', '49', 'Cienaga', '3686279', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1052', '49', 'Chivolo', '3686445', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1053', '49', 'Cerro de San Antonio', '3686894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1054', '49', 'Calamar', '3687972', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1055', '49', 'Buenavista', '3688396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1056', '49', 'Aracataca', '3689759', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1057', '49', 'Algarrobo', '3690172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1058', '49', 'Plato', '3792392', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1059', '50', 'Zarcero', '3620994', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1060', '50', 'Upala', '3621153', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1061', '50', 'Santiago', '3621520', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1062', '50', 'San Ramon', '3621644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1063', '50', 'San Rafael', '3621679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1064', '50', 'San Rafael', '3621687', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1065', '50', 'San Juan', '3621817', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1066', '50', 'San Jose', '3621841', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1067', '50', 'Sabanilla', '3622022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1068', '50', 'Rio Segundo', '3622074', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1069', '50', 'Quesada', '3622190', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1070', '50', 'Pocosol', '3622323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1071', '50', 'Pital', '3622382', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1072', '50', 'Orotina', '3622660', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1073', '50', 'Naranjo', '3622751', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1074', '50', 'Los Chiles', '3623008', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1075', '50', 'Fortuna', '3623716', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1076', '50', 'Esquipulas', '3623755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1077', '50', 'Desamparados', '3623935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1078', '50', 'Carrillos', '3624379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1079', '50', 'Bijagua', '3624702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1080', '50', 'Atenas', '3624842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1081', '50', 'Alajuela', '3624955', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1082', '51', 'Turrialba', '3621184', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1083', '51', 'Tucurrique', '3621200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1084', '51', 'Tres Rios', '3621224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1085', '51', 'Tobosi', '3621265', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1086', '51', 'San Diego', '3621926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1087', '51', 'Pejibaye', '3622466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1088', '51', 'Paraiso', '3622547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1089', '51', 'Pacayas', '3622648', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1090', '51', 'Orosi', '3622663', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1091', '51', 'La Suiza', '3623112', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1092', '51', 'Cot', '3624057', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1093', '51', 'Concepcion', '3624142', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1094', '51', 'Cartago', '3624370', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1095', '52', 'Tilaran', '3621278', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1096', '52', 'Sardinal', '3621490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1097', '52', 'Santa Cruz', '3621607', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1098', '52', 'Samara', '3621990', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1099', '52', 'Nicoya', '3622716', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1100', '52', 'Nandayure', '3622765', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1101', '52', 'Liberia', '3623076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1102', '52', 'La Cruz', '3623258', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1103', '52', 'Juntas', '3623307', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1104', '52', 'Hojancha', '3623454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1105', '52', 'Fortuna', '3623715', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1106', '52', 'Canas', '3624468', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1107', '52', 'Belen', '3624718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1108', '52', 'Bagaces', '3624822', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1109', '53', 'Santo Domingo', '3621515', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1110', '53', 'San Rafael', '3621683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1111', '53', 'San Pablo', '3621729', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1112', '53', 'San Josecito', '3621831', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1113', '53', 'San Francisco', '3621911', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1114', '53', 'San Antonio', '3621967', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1115', '53', 'Mercedes', '3622881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1116', '53', 'Llorente', '3623032', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1117', '53', 'La Asuncion', '3623287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1118', '53', 'Heredia', '3623486', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1119', '53', 'Colon', '3624171', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1120', '53', 'Angeles', '3624908', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1121', '54', 'Sixaola', '3621430', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1122', '54', 'Siquirres', '3621440', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1123', '54', 'Roxana', '3622036', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1124', '54', 'Puerto Limon', '3622247', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1125', '54', 'Pocora', '3622325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1126', '54', 'Matina', '3622895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1127', '54', 'Guapiles', '3623580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1128', '54', 'Guacimo', '3623601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1129', '54', 'Batan', '3624730', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1130', '55', 'San Vito', '3621501', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1131', '55', 'Quepos', '3622193', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1132', '55', 'Puntarenas', '3622228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1133', '55', 'Parrita', '3622537', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1134', '55', 'Paquera', '3622561', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1135', '55', 'Miramar', '3622854', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1136', '55', 'Jaco', '3623369', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1137', '55', 'Golfito', '3623656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1138', '55', 'Esparza', '3623781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1139', '55', 'Corredor', '3624066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1140', '55', 'Ciudad Cortes', '3624198', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1141', '55', 'Chacarita', '3624288', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1142', '55', 'Canoas', '3624436', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1143', '55', 'Buenos Aires', '3624593', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1144', '56', 'Tejar', '3621335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1145', '56', 'San Vicente', '3621505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1146', '56', 'Santiago', '3621524', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1147', '56', 'Santa Ana', '3621630', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1148', '56', 'San Rafael Arriba', '3621655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1149', '56', 'San Rafael Abajo', '3621659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1150', '56', 'San Rafael', '3621689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1151', '56', 'San Pedro', '3621717', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1152', '56', 'San Miguel', '3621753', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1153', '56', 'San Marcos', '3621762', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1154', '56', 'San Juan de Dios', '3621804', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1155', '56', 'San Juan', '3621819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1156', '56', 'San Jose', '3621849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1157', '56', 'San Isidro', '3621889', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1158', '56', 'San Ignacio', '3621890', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1159', '56', 'San Felipe', '3621922', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1160', '56', 'Salitrillos', '3621997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1161', '56', 'Salitral', '3622005', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1162', '56', 'Sabanilla', '3622023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1163', '56', 'Purral', '3622217', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1164', '56', 'Patarra', '3622507', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1165', '56', 'Palmichal', '3622602', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1166', '56', 'Mercedes', '3622884', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1167', '56', 'Ipis', '3623394', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1168', '56', 'Guadalupe', '3623593', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1169', '56', 'Granadilla', '3623643', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1170', '56', 'Escazu', '3623787', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1171', '56', 'Daniel Flores', '3623961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1172', '56', 'Curridabat', '3623977', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1173', '56', 'Colima', '3624174', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1174', '56', 'Calle Blancos', '3624509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1175', '56', 'Aserri', '3624848', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1176', '56', 'Alajuelita', '3624951', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1177', '56', 'San Vicente de Moravia', '6612154', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1178', '57', 'San Cristobal', '3651949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1179', '57', 'Puerto Baquerizo Moreno', '3652758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1180', '57', 'Puerto Ayora', '3652764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1181', '58', 'Gualaceo', '3657670', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1182', '58', 'Cuenca', '3658666', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1183', '59', 'San Miguel', '3651639', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1184', '59', 'Guaranda', '3657571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1185', '60', 'La Troncal', '3654853', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1186', '60', 'Canar', '3659852', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1187', '60', 'Azogues', '3660434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1188', '61', 'San Gabriel', '3651868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1189', '61', 'El Angel', '3658379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1190', '62', 'Riobamba', '3652350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1191', '62', 'Guano', '3657594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1192', '62', 'Alausi', '3660798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1193', '63', 'Saquisili', '3651251', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1194', '63', 'San Miguel de Salcedo', '3651613', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1195', '63', 'Pujili', '3652684', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1196', '63', 'Latacunga', '3654870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1197', '63', 'La Mana', '3655117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1198', '64', 'Zaruma', '3649914', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1199', '64', 'Santa Rosa', '3651356', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1200', '64', 'Puerto Bolivar', '3652757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1201', '64', 'Portovelo', '3652943', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1202', '64', 'Pinas', '3653130', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1203', '64', 'Pasaje', '3653403', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1204', '64', 'Machala', '3654533', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1205', '64', 'Huaquillas', '3655720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1206', '65', 'Valdez', '3650312', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1207', '65', 'San Lorenzo de Esmeraldas', '3651694', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1208', '65', 'Rosa Zarate', '3652257', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1209', '65', 'Propicia', '3652881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1210', '65', 'Muisne', '3653967', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1211', '66', 'Yaguachi', '3650121', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1212', '66', 'Velasco Ibarra', '3650273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1213', '66', 'Santa Lucia', '3651411', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1214', '66', 'Samborondon', '3652065', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1215', '66', 'Salinas', '3652100', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1216', '66', 'Playas', '3653015', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1217', '66', 'Pedro Carbo', '3653295', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1218', '66', 'Palestina', '3653581', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1219', '66', 'Naranjito', '3653873', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1220', '66', 'Naranjal', '3653882', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1221', '66', 'Lomas de Sargentillo', '3654650', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1222', '66', 'La Libertad', '3655131', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1223', '66', 'Guayaquil', '3657509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1224', '66', 'El Triunfo', '3658053', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1225', '66', 'Duran', '3658192', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1226', '66', 'Coronel Marcelino Mariduena', '3658822', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1227', '66', 'Colimes', '3658948', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1228', '66', 'Balzar', '3660361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1229', '66', 'Balao', '3660387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1230', '66', 'Alfredo Baquerizo Moreno', '3660773', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1231', '67', 'Pimampiro', '3653146', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1232', '67', 'Otavalo', '3653693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1233', '67', 'Ibarra', '3655673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1234', '67', 'Cotacachi', '3658781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1235', '67', 'Atuntaqui', '3660478', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1236', '68', 'Macara', '3654545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1237', '68', 'Loja', '3654667', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1238', '68', 'Celica', '3659544', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1239', '68', 'Catamayo', '3659599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1240', '68', 'Catacocha', '3659602', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1241', '68', 'Cariamanga', '3659711', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1242', '69', 'Vinces', '3650186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1243', '69', 'Ventanas', '3650267', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1244', '69', 'Quevedo', '3652567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1245', '69', 'Palenque', '3653587', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1246', '69', 'Montalvo', '3654064', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1247', '69', 'Catarama', '3659592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1248', '69', 'Babahoyo', '3660418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1249', '70', 'Tosagua', '3650554', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1250', '70', 'Sucre', '3650960', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1251', '70', 'Santa Ana', '3651495', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1252', '70', 'Rocafuerte', '3652315', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1253', '70', 'Portoviejo', '3652941', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1254', '70', 'Pedernales', '3653307', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1255', '70', 'Pajan', '3653609', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1256', '70', 'Montecristi', '3654055', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1257', '70', 'Manta', '3654410', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1258', '70', 'Junin', '3655385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1259', '70', 'Jipijapa', '3655446', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1260', '70', 'Chone', '3659139', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1261', '70', 'Calceta', '3659926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1262', '70', 'Bahia de Caraquez', '3660401', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1263', '71', 'Sucua', '3650956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1264', '71', 'Palora', '3653523', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1265', '71', 'Macas', '3654541', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1266', '71', 'Gualaquiza', '3657661', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1267', '72', 'Puyo', '3652584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1268', '73', 'Santo Domingo de los Colorados', '3651297', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1269', '73', 'Sangolqui', '3651857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1270', '73', 'Quito', '3652462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1271', '73', 'Machachi', '3654536', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1272', '73', 'Cayambe', '3659578', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1273', '74', 'Pillaro', '3653159', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1274', '74', 'Pelileo', '3653287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1275', '74', 'Banos', '3660346', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1276', '74', 'Ambato', '3660689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1277', '75', 'Zamora', '3649959', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1278', '75', 'Yantzaza', '3650053', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1279', '76', 'Nueva Loja', '3655185', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1280', '77', 'Tena', '3650721', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1281', '77', 'Archidona', '3660573', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1282', '78', 'Boca Suno', '3660152', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1283', '79', 'Santa Elena', '3651438', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1284', '81', 'Banjul', '2413876', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1285', '81', 'Bakau', '2413920', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1286', '82', 'Wellingara Ba', '2411692', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1287', '82', 'Toniataba', '2411765', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1288', '82', 'Sutukung', '2411862', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1289', '82', 'Soma', '2411905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1290', '82', 'Si Kunda', '2411970', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1291', '82', 'Sankwia', '2412158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1292', '82', 'Nioro', '2412408', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1293', '82', 'Mansa Konko', '2412605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1294', '82', 'Keneba', '2413023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1295', '82', 'Karantaba', '2413073', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1296', '82', 'Kaiaf', '2413160', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1297', '82', 'Jifarong', '2413235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1298', '82', 'Jenoi', '2413246', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1299', '82', 'Jali', '2413344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1300', '82', 'Bureng', '2413703', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1301', '82', 'Baro Kunda', '2413830', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1302', '83', 'Wassu', '2411703', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1303', '83', 'Sukuta', '2411877', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1304', '83', 'Saruja', '2411999', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1305', '83', 'Sami', '2412199', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1306', '83', 'Pateh Sam', '2412279', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1307', '83', 'Kunting', '2412775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1308', '83', 'Kuntaur', '2412778', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1309', '83', 'Kass Wollof', '2413052', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1310', '83', 'Karantaba', '2413070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1311', '83', 'Jarreng', '2413265', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1312', '83', 'Jakhaly', '2413365', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1313', '83', 'Georgetown', '2413437', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1314', '83', 'Galleh Manda', '2413456', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1315', '83', 'Denton', '2413588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1316', '83', 'Dankunku', '2413645', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1317', '83', 'Brikama Nding', '2413746', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1318', '83', 'Bantanto', '2413856', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1319', '83', 'Bansang', '2413866', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1320', '84', 'Sutukoba', '2411863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1321', '84', 'Sun Kunda', '2411866', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1322', '84', 'Sudowol', '2411885', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1323', '84', 'Sabi', '2412248', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1324', '84', 'Perai', '2412272', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1325', '84', 'Nyamanari', '2412344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1326', '84', 'Kumbija', '2412807', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1327', '84', 'Koina', '2412868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1328', '84', 'Gunjur Kuta', '2413417', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1329', '84', 'Diabugu Basilla', '2413579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1330', '84', 'Diabugu', '2413580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1331', '84', 'Demba Kunda', '2413598', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1332', '84', 'Daba Kunda', '2413653', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1333', '84', 'Brifu', '2413755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1334', '84', 'Basse Santa Su', '2413818', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1335', '84', 'Bakadagy', '2413926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1336', '85', 'Sukuta', '2411880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1337', '85', 'Somita', '2411903', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1338', '85', 'Gunjur', '2413419', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1339', '85', 'Brikama', '2413753', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1340', '85', 'Abuko', '2413990', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1341', '86', 'Sara Kunda', '2412135', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1342', '86', 'Saba', '2412252', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1343', '86', 'No Kunda', '2412355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1344', '86', 'Lamin', '2412749', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1345', '86', 'Kerewan', '2412992', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1346', '86', 'Katchang', '2413041', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1347', '86', 'Gunjur', '2413418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1348', '86', 'Farafenni', '2413515', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1349', '86', 'Essau', '2413533', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1350', '86', 'Daru Rilwan', '2413623', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1351', '86', 'Chilla', '2413660', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1352', '86', 'Barra', '2413827', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1353', '86', 'Bambali', '2413895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1354', '87', 'Tepezala', '3981944', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1355', '87', 'Rincon de Romos', '3988651', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1356', '87', 'Palo Alto', '3993763', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1357', '87', 'Pabellon de Arteaga', '3993984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1358', '87', 'Margaritas', '3996585', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1359', '87', 'Cosio', '4012699', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1360', '87', 'Calvillo', '4016086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1361', '87', 'Asientos', '4018100', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1362', '87', 'Aguascalientes', '4019233', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1363', '87', 'San Jose de Gracia', '4021223', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1364', '87', 'Villa Juarez', '4021449', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1365', '88', 'Camalu', '3979216', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1366', '88', 'Primo Tapia', '3979430', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1367', '88', 'Progreso', '3979439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1368', '88', 'Estacion Coahuila', '3979494', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1369', '88', 'Alberto Oviedo Mota', '3979497', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1370', '88', 'Guadalupe Victoria', '3979505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1371', '88', 'Delta', '3979510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1372', '88', 'Tijuana', '3981609', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1373', '88', 'Tecolots', '3982215', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1374', '88', 'Tecate', '3982266', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1375', '88', 'Santa Isabel', '3984237', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1376', '88', 'San Quintin', '3984997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1377', '88', 'San Luis', '3985665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1378', '88', 'San Felipe', '3987224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1379', '88', 'Rosarito', '3988392', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1380', '88', 'Mulege', '3995236', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1381', '88', 'Mexicali', '3996069', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1382', '88', 'Maneadero', '3996737', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1383', '88', 'Los Algodones', '3998214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1384', '88', 'Ensenada', '4006702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1385', '88', 'El Sauzal', '4007503', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1386', '88', 'Puebla', '4011469', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1387', '88', 'Hermosillo', '4011587', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1388', '88', 'Colonia Vicente Guerrero', '4013292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1389', '89', 'Todos Santos', '3981432', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1390', '89', 'Santa Rosalia', '3983805', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1391', '89', 'Cabo San Lucas', '3985710', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1392', '89', 'San Jose del Cabo', '3986172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1393', '89', 'Loreto', '3998287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1394', '89', 'La Paz', '4000900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1395', '89', 'Villa Insurgentes', '4011574', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1396', '89', 'Ciudad Constitucion', '4013723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1397', '90', 'Tenabo', '3516017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1398', '90', 'Seybaplaya', '3516685', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1399', '90', 'Sabancuy', '3520161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1400', '90', 'Pomuch', '3521283', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1401', '90', 'Palizada', '3522156', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1402', '90', 'Nunkini', '3522514', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1403', '90', 'Isla de Aguada', '3526766', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1404', '90', 'Hopelchen', '3527065', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1405', '90', 'Hecelchakan', '3527149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1406', '90', 'Escarcega', '3527795', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1407', '90', 'Dzitbalche', '3529650', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1408', '90', 'Ciudad del Carmen', '3530599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1409', '90', 'China', '3530840', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1410', '90', 'Champoton', '3531177', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1411', '90', 'Campeche', '3531732', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1412', '90', 'Calkini', '3531793', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1413', '90', 'Becal', '3532326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1414', '91', 'Zinacantan', '3514026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1415', '91', 'Yajalon', '3514349', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1416', '91', 'Villa Corzo', '3514684', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1417', '91', 'Villa Comaltitlan', '3514685', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1418', '91', 'Venustiano Carranza', '3514785', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1419', '91', 'Veinte de Noviembre', '3514833', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1420', '91', 'Tzimol', '3514972', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1421', '91', 'Tuxtla Gutierrez', '3515001', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1422', '91', 'Tuxtla Chico', '3515002', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1423', '91', 'Tres Picos', '3515120', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1424', '91', 'Totolapa', '3515202', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1425', '91', 'Tila', '3515600', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1426', '91', 'Teopisca', '3515938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1427', '91', 'Tenango', '3516005', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1428', '91', 'Tecpatan', '3516125', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1429', '91', 'Tapilula', '3516252', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1430', '91', 'Tapachula', '3516266', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1431', '91', 'Suchiate', '3516497', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1432', '91', 'Suchiapa', '3516499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1433', '91', 'Soyalo', '3516511', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1434', '91', 'Socoltenango', '3516614', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1435', '91', 'Simojovel de Allende', '3516651', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1436', '91', 'Santa Catarina Pantelho', '3517659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1437', '91', 'San Pedro Buenavista', '3518014', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1438', '91', 'San Fernando', '3519396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1439', '91', 'San Cristobal de Las Casas', '3519537', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1440', '91', 'Salto de Agua', '3520020', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1441', '91', 'Rayon', '3520428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1442', '91', 'Puerto Madero', '3520989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1443', '91', 'Pueblo Nuevo Solistahuacan', '3521070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1444', '91', 'Pijijiapan', '3521476', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1445', '91', 'Pichucalco', '3521574', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1446', '91', 'Petalcingo', '3521610', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1447', '91', 'Paredon', '3521894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1448', '91', 'Palenque', '3522164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1449', '91', 'Oxchuc', '3522256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1450', '91', 'Ostuacan', '3522293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1451', '91', 'Ocozocuautla', '3522444', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1452', '91', 'Ocotepec', '3522468', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1453', '91', 'Ocosingo', '3522484', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1454', '91', 'Nueva Palestina', '3522605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1455', '91', 'Nicolas Ruiz', '3522731', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1456', '91', 'Motozintla de Mendoza', '3522926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1457', '91', 'Mazatan', '3523418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1458', '91', 'Mapastepec', '3523590', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1459', '91', 'La Trinitaria', '3524527', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1460', '91', 'Las Margaritas', '3524744', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1461', '91', 'La Libertad', '3525491', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1462', '91', 'Jitotol', '3526486', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1463', '91', 'Jiquipilas', '3526488', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1464', '91', 'Ixtapa', '3526687', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1465', '91', 'Ixtacomitan', '3526698', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1466', '91', 'Ishuatan', '3526769', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1467', '91', 'Huixtla', '3526855', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1468', '91', 'Huehuetan', '3526966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1469', '91', 'Frontera Hidalgo', '3527541', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1470', '91', 'Frontera Comalapa', '3527543', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1471', '91', 'Escuintla', '3527768', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1472', '91', 'El Zapotal', '3527920', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1473', '91', 'El Bosque', '3529372', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1474', '91', 'Cristobal Obregon', '3530097', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1475', '91', 'Copoya', '3530248', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1476', '91', 'Copainala', '3530267', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1477', '91', 'Comitan de Dominguez', '3530367', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1478', '91', 'Cintalapa de Figueroa', '3530617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1479', '91', 'Chilon', '3530871', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1480', '91', 'Chicomuselo', '3530935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1481', '91', 'Chiapilla', '3531010', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1482', '91', 'Chiapa de Corzo', '3531013', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1483', '91', 'Chanal', '3531168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1484', '91', 'Chamula', '3531172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1485', '91', 'Cancuc', '3531674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1486', '91', 'Cacahoatan', '3531904', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1487', '91', 'Bochil', '3532182', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1488', '91', 'Berriozabal', '3532254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1489', '91', 'Angel Albino Corzo', '3532856', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1490', '91', 'Amatenango del Valle', '3532925', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1491', '91', 'Amatan', '3532930', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1492', '91', 'Alvaro Obregon', '3532958', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1493', '91', 'Altamirano', '3532996', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1494', '91', 'Acapetagua', '3533466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1495', '91', 'Acala', '3533483', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1496', '91', 'Acacoyagua', '3533491', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1497', '91', 'Pueblo Juarez', '3815479', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1498', '91', 'Catazaja', '3815525', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1499', '91', 'Pueblo Nuevo Sitala', '3815723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1500', '91', 'Benemerito de las Americas', '3816362', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1501', '91', 'Tonala', '3816721', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1502', '91', 'Arriaga', '3816739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1503', '92', 'Praxedis Guerrero', '3974771', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1504', '92', 'Adolfo Lopez Mateos', '3976161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1505', '92', 'Villa Ahumada', '3980207', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1506', '92', 'Valle de Allende', '3980627', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1507', '92', 'Valentin Gomez Farias', '3980683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1508', '92', 'Saucillo', '3983312', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1509', '92', 'Santa Barbara', '3984629', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1510', '92', 'Rosales', '3988430', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1511', '92', 'Puerto Palomas', '3991350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1512', '92', 'Ojinaga', '3994469', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1513', '92', 'Nuevo Casas Grandes', '3994616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1514', '92', 'Naica', '3995142', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1515', '92', 'Meoqui', '3996234', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1516', '92', 'Madera', '3996956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1517', '92', 'Jimenez', '4003938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1518', '92', 'Ignacio Zaragoza', '4004419', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1519', '92', 'Hidalgo del Parral', '4004867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1520', '92', 'Guadalupe y Calvo', '4005370', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1521', '92', 'Ejido El Largo', '4011631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1522', '92', 'Cuauhtemoc', '4012406', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1523', '92', 'Creel', '4012593', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1524', '92', 'Colonia Lazaro Cardenas', '4013377', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1525', '92', 'Ciudad Juarez', '4013708', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1526', '92', 'Ciudad Delicias', '4013720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1527', '92', 'Ciudad Camargo', '4013724', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1528', '92', 'Chihuahua', '4014338', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1529', '92', 'Casas Grandes', '4015076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1530', '92', 'Buenaventura', '4016722', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1531', '92', 'Benito Juarez', '4017154', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1532', '92', 'Ascencion', '4018109', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1533', '92', 'Anahuac', '4018543', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1534', '93', 'Minas de Barroteran', '3977811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1535', '93', 'Zaragoza', '3979706', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1536', '93', 'Villa Union', '3980123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1537', '93', 'Villa Frontera', '3980180', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1538', '93', 'Viesca', '3980230', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1539', '93', 'Venustiano Carranza', '3980387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1540', '93', 'Torreon', '3981254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1541', '93', 'San Pedro', '3985129', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1542', '93', 'San Buenaventura', '3987500', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1543', '93', 'Saltillo', '3988086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1544', '93', 'Sabinas', '3988333', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1545', '93', 'Ramos Arizpe', '3991043', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1546', '93', 'Piedras Negras', '3992619', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1547', '93', 'Parras de la Fuente', '3993335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1548', '93', 'Palau', '3993893', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1549', '93', 'Ocampo', '3994534', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1550', '93', 'Nueva Rosita', '3994667', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1551', '93', 'Nava', '3995050', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1552', '93', 'Monclova', '3995523', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1553', '93', 'Melchor Muzquiz', '3996271', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1554', '93', 'Matamoros', '3996426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1555', '93', 'General Cepeda', '4005870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1556', '93', 'El Coyote', '4010155', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1557', '93', 'Concordia', '4013024', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1558', '93', 'Ciudad Acuna', '4013728', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1559', '93', 'Castanos', '4015022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1560', '93', 'Arteaga', '4018127', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1561', '93', 'Allende', '4018761', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1562', '94', 'Villa de Alvarez', '3980194', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1563', '94', 'Tecoman', '3982213', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1564', '94', 'Suchitlan', '3982766', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1565', '94', 'Minatitlan', '3995794', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1566', '94', 'Manzanillo', '3996663', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1567', '94', 'Madrid', '3996933', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1568', '94', 'La Queseria', '4000524', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1569', '94', 'El Colomo', '4010273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1570', '94', 'Cuauhtemoc', '4012408', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1571', '94', 'Coquimatlan', '4012905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1572', '94', 'Comala', '4013130', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1573', '94', 'Colima', '4013516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1574', '94', 'Cofradia', '4013567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1575', '94', 'Armeria', '4018227', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1576', '95', 'Xochimilco', '3514450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1577', '95', 'Alvaro Obregon', '3514663', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1578', '95', 'Gustavo A. Madero', '3514674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1579', '95', 'Tlalpan', '3515428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1580', '95', 'Tlahuac', '3515463', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1581', '95', 'Polanco', '3521305', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1582', '95', 'Milpa Alta', '3523202', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1583', '95', 'Magdalena Contreras', '3523760', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1584', '95', 'Iztapalapa', '3526683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1585', '95', 'Iztacalco', '3526700', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1586', '95', 'Cuajimalpa', '3530049', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1587', '95', 'Coyoacan', '3530139', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1588', '95', 'Mexico City', '3530597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1589', '95', 'Azcapotzalco', '3532497', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1590', '95', 'Benito Juarez', '3827406', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1591', '95', 'Venustiano Carranza', '3827407', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1592', '95', 'Miguel Hidalgo', '3827408', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1593', '95', 'Cuauhtemoc', '3827409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1594', '95', 'Colonia del Valle', '7280708', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1595', '95', 'Col. Bosques de las Lomas', '7280712', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1596', '95', 'Colonia Nativitas', '7280718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1597', '96', 'Villa Ocampo', '3980135', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1598', '96', 'Tlahualilo de Zaragoza', '3981469', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1599', '96', 'Tayoltita', '3982292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1600', '96', 'Santa Maria del Oro', '3984078', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1601', '96', 'Santa Clara', '3984558', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1602', '96', 'Santa Catarina de Tepehuanes', '3984571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1603', '96', 'San Pedro de los Naranjos', '3985031', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1604', '96', 'San Miguel de Papasquiaro', '3985327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1605', '96', 'Rodeo', '3988515', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1606', '96', 'Poanas', '3992278', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1607', '96', 'Penon Blanco', '3992967', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1608', '96', 'Panuco de Coronado', '3993492', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1609', '96', 'Nuevo Ideal', '3994607', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1610', '96', 'Nombre de Dios', '3994863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1611', '96', 'Nazas', '3995005', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1612', '96', 'Nazareno', '3995010', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1613', '96', 'Mapimi', '3996647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1614', '96', 'Guadalupe Victoria', '4005380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1615', '96', 'Gomez Palacio', '4005775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1616', '96', 'General Vicente Guerrero', '4005857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1617', '96', 'El Salto', '4007676', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1618', '96', 'Durango', '4011743', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1619', '96', 'Cuencame', '4012344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1620', '96', 'Ciudad Lerdo', '4013706', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1621', '96', 'Canatlan', '4015683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1622', '96', 'Bermejillo', '4017144', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1623', '96', 'Juarez', '4020386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1624', '97', 'Yuriria', '3979855', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1625', '97', 'Yerbabuena', '3979923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1626', '97', 'Villagran', '3980174', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1627', '97', 'Valtierrilla', '3980580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1628', '97', 'Valle de Santiago', '3980605', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1629', '97', 'Uriangato', '3980777', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1630', '97', 'Teneria', '3982051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1631', '97', 'Tarimoro', '3982364', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1632', '97', 'Tarandacuao', '3982401', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1633', '97', 'Silao', '3983058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1634', '97', 'Santiago de Cuenda', '3983641', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1635', '97', 'Santa Teresa', '3983764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1636', '97', 'Santa Ana Pacueco', '3984690', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1637', '97', 'San Roque', '3984832', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1638', '97', 'San Miguel Octopan', '3985307', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1639', '97', 'San Miguel de Allende', '3985344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1640', '97', 'San Luis de la Paz', '3985620', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1641', '97', 'San Juan de la Vega', '3985878', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1642', '97', 'San Jose Temascatio', '3986082', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1643', '97', 'San Jose Iturbide', '3986088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1644', '97', 'San Francisco del Rincon', '3986984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1645', '97', 'San Felipe', '3987246', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1646', '97', 'San Diego de la Union', '3987309', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1647', '97', 'San Cristobal', '3987383', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1648', '97', 'Salvatierra', '3988050', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1649', '97', 'Salamanca', '3988214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1650', '97', 'Romita', '3988462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1651', '97', 'Rincon de Tamayo', '3988648', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1652', '97', 'Pueblo Nuevo', '3991567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1653', '97', 'Penjamo', '3992986', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1654', '97', 'Paracuaro', '3993455', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1655', '97', 'Ocampo', '3994535', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1656', '97', 'Moroleon', '3995343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1657', '97', 'Medina', '3996299', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1658', '97', 'Marfil', '3996595', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1659', '97', 'Leon', '3998655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1660', '97', 'La Moncada', '4001301', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1661', '97', 'La Calera', '4003270', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1662', '97', 'La Aldea', '4003618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1663', '97', 'Juventino Rosas', '4003662', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1664', '97', 'Jerecuaro', '4004026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1665', '97', 'Jaral del Progreso', '4004092', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1666', '97', 'Irapuato', '4004330', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1667', '97', 'Iramuco', '4004331', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1668', '97', 'Huanimaro', '4004688', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1669', '97', 'Guanajuato', '4005270', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1670', '97', 'Empalme Escobedo', '4006804', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1671', '97', 'Duarte', '4011755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1672', '97', 'Cueramaro', '4012341', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1673', '97', 'Cortazar', '4012721', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1674', '97', 'Coroneo', '4012842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1675', '97', 'Comonfort', '4013094', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1676', '97', 'Ciudad Manuel Doblado', '4013705', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1677', '97', 'Cerro Gordo', '4014740', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1678', '97', 'Cerano', '4014842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1679', '97', 'Celaya', '4014875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1680', '97', 'Apaseo el Grande', '4018403', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1681', '97', 'Apaseo el Alto', '4018404', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1682', '97', 'Aldama', '4018835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1683', '97', 'Acambaro', '4019827', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1684', '97', 'Abasolo', '4019869', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1685', '97', 'Victoria', '4022970', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1686', '97', 'Doctor Mora', '4022983', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1687', '97', 'Dolores Hidalgo', '4023117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1688', '97', 'Maravatio del Encinal', '4023835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1689', '97', 'C. Militar Sarabia', '4024263', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1690', '97', 'Nuevo Mexico', '4024597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1691', '97', 'La Ermita', '4024861', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1692', '98', 'Zumpango del Rio', '3513967', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1693', '98', 'Zitlala', '3514021', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1694', '98', 'Xochistlahuaca', '3514440', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1695', '98', 'Xochihuehuetlan', '3514454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1696', '98', 'Xaltianguis', '3514583', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1697', '98', 'Xalpatlahuac', '3514592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1698', '98', 'Tlapa de Comonfort', '3515384', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1699', '98', 'Tlamacazapa', '3515410', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1700', '98', 'Tlacotepec', '3515477', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1701', '98', 'Tixtla de Guerrero', '3515510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1702', '98', 'Tierra Colorada', '3515643', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1703', '98', 'Tepecoacuilco de Trujano', '3515900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1704', '98', 'Teloloapan', '3516060', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1705', '98', 'Tecoanapa', '3516171', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1706', '98', 'Taxco de Alarcon', '3516225', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1707', '98', 'San Marcos', '3518461', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1708', '98', 'Quechultenango', '3520922', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1709', '98', 'Petaquillas', '3521607', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1710', '98', 'Ometepec', '3522343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1711', '98', 'Olinala', '3522364', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1712', '98', 'Mazatlan', '3523412', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1713', '98', 'Iguala de la Independencia', '3526798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1714', '98', 'Huitzuco de los Figueroa', '3526864', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1715', '98', 'Huitziltepec', '3526877', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1716', '98', 'Huamuxtitlan', '3527017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1717', '98', 'El Ocotito', '3528601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1718', '98', 'Cuautepec', '3529994', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1719', '98', 'Cuajinicuilapa', '3530046', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1720', '98', 'Cruz Grande', '3530066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1721', '98', 'Copalillo', '3530259', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1722', '98', 'Copala', '3530264', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1723', '98', 'Cocula', '3530482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1724', '98', 'Chilpancingo de los Bravos', '3530870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1725', '98', 'Chilapa de Alvarez', '3530886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1726', '98', 'Chichihualco', '3530955', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1727', '98', 'Buenavista de Cuellar', '3531972', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1728', '98', 'Bajos del Ejido', '3532446', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1729', '98', 'Azoyu', '3532490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1730', '98', 'Ayutla de los Libres', '3532499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1731', '98', 'Atliaca', '3532597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1732', '98', 'Apaxtla de Castrejon', '3532802', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1733', '98', 'Apango', '3532813', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1734', '98', 'Alpoyeca', '3533022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1735', '98', 'Acapulco de Juarez', '3533462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1736', '98', 'Acamixtla', '3533473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1737', '98', 'Marquelia', '3822029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1738', '98', 'San Luis Acatlan', '3822167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1739', '98', 'Zirandaro', '3979647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1740', '98', 'Zihuatanejo', '3979673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1741', '98', 'Zacualpan', '3979821', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1742', '98', 'Tres Palos', '3981069', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1743', '98', 'Tlapehuala', '3981462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1744', '98', 'Tlalchapa', '3981466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1745', '98', 'Tecpan de Galeana', '3982170', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1746', '98', 'San Luis de la Paz', '3985621', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1747', '98', 'San Jeronimo de Juarez', '3986553', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1748', '98', 'San Jeronimito', '3986600', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1749', '98', 'Petatlan', '3992842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1750', '98', 'La Union', '3998919', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1751', '98', 'Ixtapa', '4004294', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1752', '98', 'El Coacoyul', '4010311', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1753', '98', 'Cutzamala de Pinzon', '4012085', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1754', '98', 'Coyuca de Catalan', '4012607', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1755', '98', 'Coyuca de Benitez', '4012608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1756', '98', 'Ciudad Altamirano', '4013727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1757', '98', 'Atoyac de Alvarez', '4017984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1758', '98', 'Arcelia', '4018320', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1759', '98', 'Ajuchitlan del Progreso', '4019039', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1760', '99', 'Zimapan', '3514031', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1761', '99', 'Zempoala', '3514043', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1762', '99', 'Zapotlan de Juarez', '3514060', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1763', '99', 'Zacualtipan', '3514134', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1764', '99', 'Tulancingo', '3515062', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1765', '99', 'Tula de Allende', '3515064', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1766', '99', 'Tolcayuca', '3515321', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1767', '99', 'Tlaxcoapan', '3515351', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1768', '99', 'Tlanchinol', '3515397', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1769', '99', 'Tlanalapan', '3515399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1770', '99', 'Tlahuelilpan', '3515459', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1771', '99', 'Tizayuca', '3515505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1772', '99', 'Tezontepec de Aldama', '3515690', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1773', '99', 'Tezontepec', '3515691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1774', '99', 'Tetepango', '3515751', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1775', '99', 'Tepepa', '3515876', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1776', '99', 'Tepeji de Ocampo', '3515887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1777', '99', 'Tepeapulco', '3515902', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1778', '99', 'Tepatepec', '3515909', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1779', '99', 'Tecozautla', '3516127', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1780', '99', 'Tasquillo', '3516236', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1781', '99', 'Singuilucan', '3516642', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1782', '99', 'Santiago Tulantepec', '3516982', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1783', '99', 'Santa Ana Hueytlalpan', '3517735', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1784', '99', 'San Marcos', '3518453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1785', '99', 'San Juan Tepa', '3518617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1786', '99', 'San Agustin Tlaxiaca', '3519972', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1787', '99', 'Progreso de Obregon', '3521103', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1788', '99', 'Pachuquilla', '3522208', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1789', '99', 'Pachuca de Soto', '3522210', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1790', '99', 'Orizatlan', '3522302', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1791', '99', 'Molango', '3523078', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1792', '99', 'Mixquiahuala', '3523127', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1793', '99', 'Mineral del Monte', '3523180', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1794', '99', 'Los Reyes', '3523905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1795', '99', 'Jaltocan', '3526591', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1796', '99', 'Jacala', '3526646', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1797', '99', 'Ixmiquilpan', '3526708', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1798', '99', 'Huichapan', '3526923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1799', '99', 'Huejutla de Reyes', '3526952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1800', '99', 'Huautla', '3526989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1801', '99', 'Emiliano Zapata', '3527876', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1802', '99', 'El Llano', '3528788', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1803', '99', 'El Arenal', '3529437', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1804', '99', 'Doxey', '3529689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1805', '99', 'Cuautepec de Hinojosa', '3529989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1806', '99', 'Ciudad Sahagun', '3530587', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1807', '99', 'Chapulhuacan', '3531118', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1808', '99', 'Cardonal', '3531571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1809', '99', 'Calnali', '3531789', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1810', '99', 'Atotonilco el Grande', '3532577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1811', '99', 'Atitalaquia', '3532627', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1812', '99', 'Atengo', '3532634', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1813', '99', 'Apan', '3532815', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1814', '99', 'Almoloya', '3533036', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1815', '99', 'Actopan', '3533389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1816', '99', 'Acayuca', '3533428', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1817', '99', 'Acaxochitlan', '3533432', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1818', '99', 'Ajacuba', '3761012', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1819', '99', 'San Miguel Vindho', '3827537', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1820', '100', 'Amacuzac', '3532951', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1821', '100', 'Cihuatlan', '3976999', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1822', '100', 'Zapotlanejo', '3979717', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1823', '100', 'Zapotiltic', '3979727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1824', '100', 'Zapote', '3979755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1825', '100', 'Zapopan', '3979770', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1826', '100', 'Zacoalco de Torres', '3979822', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1827', '100', 'Yahualica', '3979982', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1828', '100', 'Villa Hidalgo', '3980169', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1829', '100', 'Villa Guerrero', '3980172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1830', '100', 'Villa Corona', '3980198', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1831', '100', 'Valle de Juarez', '3980614', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1832', '100', 'Valle de Guadalupe', '3980617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1833', '100', 'Usmajac', '3980756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1834', '100', 'Union de Tula', '3980798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1835', '100', 'Union de San Antonio', '3980799', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1836', '100', 'Tuxpan', '3980844', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1837', '100', 'Tototlan', '3981165', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1838', '100', 'Tonila', '3981362', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1839', '100', 'Tonaya', '3981365', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1840', '100', 'Tonala', '3981369', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1841', '100', 'Tomatlan', '3981391', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1842', '100', 'Tlaquepaque', '3981461', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1843', '100', 'Tlajomulco de Zuniga', '3981467', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1844', '100', 'Tizapan el Alto', '3981491', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1845', '100', 'Teuchitlan', '3981727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1846', '100', 'Tesistan', '3981791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1847', '100', 'Tequila', '3981885', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1848', '100', 'Tepatitlan de Morelos', '3981984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1849', '100', 'Teocuitatlan de Corona', '3982028', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1850', '100', 'Teocaltiche', '3982034', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1851', '100', 'Tenamaxtlan', '3982065', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1852', '100', 'Tecolotlan', '3982217', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1853', '100', 'Tecalitlan', '3982269', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1854', '100', 'Tapalpa', '3982461', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1855', '100', 'Tamazula de Gordiano', '3982567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1856', '100', 'Talpa de Allende', '3982589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1857', '100', 'Tala', '3982616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1858', '100', 'Sayula', '3983216', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1859', '100', 'Santa Cruz del Valle', '3984437', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1860', '100', 'Santa Cruz de las Flores', '3984444', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1861', '100', 'Santa Anita', '3984679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1862', '100', 'San Sebastian el Grande', '3984791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1863', '100', 'San Pedro Itzican', '3985024', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1864', '100', 'San Patricio', '3985168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1865', '100', 'San Miguel el Alto', '3985323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1866', '100', 'San Martin Hidalgo', '3985504', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1867', '100', 'San Marcos', '3985573', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1868', '100', 'San Julian', '3985797', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1869', '100', 'San Juan de los Lagos', '3985865', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1870', '100', 'San Juan de Abajo', '3985912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1871', '100', 'San Juan Cosala', '3985913', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1872', '100', 'San Jose del Castillo', '3986165', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1873', '100', 'San Jose de Gracia', '3986228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1874', '100', 'San Gabriel', '3986954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1875', '100', 'San Diego de Alejandria', '3987310', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1876', '100', 'San Andres Ixtlan', '3987923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1877', '100', 'San Agustin', '3988025', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1878', '100', 'Purificacion', '3991246', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1879', '100', 'Puerto Vallarta', '3991328', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1880', '100', 'Poncitlan', '3992212', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1881', '100', 'Pihuamo', '3992599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1882', '100', 'Ojuelos de Jalisco', '3994216', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1883', '100', 'Ocotlan', '3994489', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1884', '100', 'Nuevo Mexico', '3994604', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1885', '100', 'Mezcala', '3996038', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1886', '100', 'Mexticacan', '3996047', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1887', '100', 'Mazamitla', '3996336', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1888', '100', 'Mascota', '3996472', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1889', '100', 'Lo Arado', '3998473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1890', '100', 'La Venta del Astillero', '3998858', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1891', '100', 'La Tijera', '3999056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1892', '100', 'Las Pintas de Arriba', '3999325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1893', '100', 'Las Juntas', '3999741', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1894', '100', 'La Huerta', '4001947', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1895', '100', 'Lagos de Moreno', '4002224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1896', '100', 'La Barca', '4003526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1897', '100', 'La Aurora', '4003574', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1898', '100', 'Juchitlan', '4003737', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1899', '100', 'Juanacatlan', '4003810', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1900', '100', 'Jocotepec', '4003908', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1901', '100', 'Jamay', '4004126', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1902', '100', 'Jalostotitlan', '4004153', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1903', '100', 'Ixtlahuacan del Rio', '4004274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1904', '100', 'Ixtlahuacan de los Membrillos', '4004275', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1905', '100', 'Ixtapa', '4004293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1906', '100', 'Huejuquilla el Alto', '4004616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1907', '100', 'Huejucar', '4004618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1908', '100', 'Hostotipaquillo', '4004738', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1909', '100', 'Guadalajara', '4005539', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1910', '100', 'Etzatlan', '4006380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1911', '100', 'Encarnacion de Diaz', '4006783', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1912', '100', 'El Verde', '4006971', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1913', '100', 'El Salto', '4007684', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1914', '100', 'El Refugio', '4008080', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1915', '100', 'El Quince', '4008224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1916', '100', 'El Limon', '4009465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1917', '100', 'El Grullo', '4009697', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1918', '100', 'El Arenal', '4011119', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1919', '100', 'Degollado', '4012045', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1920', '100', 'Cuyutlan', '4012080', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1921', '100', 'Cuitzeo', '4012196', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1922', '100', 'El Crucero de Santa Maria', '4012559', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1923', '100', 'Coyula', '4012606', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1924', '100', 'Concepcion de Buenos Aires', '4013045', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1925', '100', 'Colotlan', '4013136', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1926', '100', 'Cocula', '4013579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1927', '100', 'Ciudad Guzman', '4013714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1928', '100', 'Chiquilistlan', '4014178', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1929', '100', 'Chapala', '4014553', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1930', '100', 'Casimiro Castillo', '4015040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1931', '100', 'Capilla de Guadalupe', '4015546', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1932', '100', 'Cajititlan', '4016272', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1933', '100', 'Bellavista', '4017199', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1934', '100', 'Ayutla', '4017924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1935', '100', 'Autlan de Navarro', '4017957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1936', '100', 'Atoyac', '4017987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1937', '100', 'Atotonilquillo', '4017990', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1938', '100', 'Atotonilco el Alto', '4017992', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1939', '100', 'Atequiza', '4018027', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1940', '100', 'Arandas', '4018348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1941', '100', 'Antonio Escobedo', '4018435', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1942', '100', 'Ameca', '4018582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1943', '100', 'Amatitan', '4018597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1944', '100', 'Ajijic', '4019054', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1945', '100', 'Ahualulco de Mercado', '4019082', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1946', '100', 'Acatic', '4019807', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1947', '100', 'Zapopan2', '6692163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1948', '101', 'Zumpango de Ocampo', '3513966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1949', '101', 'Zumpahuacan', '3513969', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1950', '101', 'Zolotepec', '3514013', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1951', '101', 'Zaragoza de Guadalupe', '3514052', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1952', '101', 'Zacualpan', '3514138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1953', '101', 'Xonacatlan', '3514409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1954', '101', 'Xometla', '3514414', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1955', '101', 'Xico', '3514519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1956', '101', 'Vista Hermosa', '3514633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1957', '101', 'Villa Victoria', '3514658', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1958', '101', 'Villa Guerrero', '3514675', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1959', '101', 'Villa Cuauhtemoc', '3514683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1960', '101', 'Tultitlan', '3515042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1961', '101', 'Tultepec', '3515044', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1962', '101', 'Totocuitlapilco', '3515205', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1963', '101', 'Toluca', '3515302', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1964', '101', 'Tlalnepantla', '3515431', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1965', '101', 'Tlalmanalco de Velazquez', '3515438', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1966', '101', 'Tianguistenco', '3515679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1967', '101', 'Texcoco de Mora', '3515715', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1968', '101', 'Tequixquiac', '3515794', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1969', '101', 'Cuautitlan Izcalli', '3515807', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1970', '101', 'Tepotzotlan', '3515827', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1971', '101', 'Tepetlaoxtoc de Hidalgo', '3515862', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1972', '101', 'Tepetitlan', '3515868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1973', '101', 'Teoloyucan', '3515942', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1974', '101', 'Tenango del Aire', '3515991', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1975', '101', 'Tenango de Arista', '3515993', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1976', '101', 'Tenancingo de Degollado', '3516006', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1977', '101', 'Temoaya', '3516030', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1978', '101', 'Temascalcingo', '3516049', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1979', '101', 'Temascalapa', '3516050', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1980', '101', 'Temamatla', '3516056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1981', '101', 'San Pedro Techuchulco', '3516174', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1982', '101', 'Sultepec de Pedro Ascencio de Alquisiras', '3516480', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1983', '101', 'Soyaniquilpan', '3516510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1984', '101', 'Santo Domingo de Guzman', '3516881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1985', '101', 'Santiago Acutzilapan', '3516974', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1986', '101', 'Rayon', '3517217', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1987', '101', 'Santa Maria Nopaltepec', '3517225', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1988', '101', 'Santa Maria Nativitas', '3517228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1989', '101', 'Cahuacan', '3517236', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1990', '101', 'Santa Maria del Monte', '3517256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1991', '101', 'Santa Maria Ajoloapan', '3517293', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1992', '101', 'Santa Gertrudis', '3517449', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1993', '101', 'Santa Cruz Tepexpan', '3517521', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1994', '101', 'Santa Cruz Tecamac', '3517524', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1995', '101', 'Santa Cruz Cuauhtenco', '3517543', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1996', '101', 'Santa Catarina Ayotzingo', '3517673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1997', '101', 'Nextlalpan', '3517731', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1998', '101', 'Santa Ana Jilotzingo', '3517733', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('1999', '101', 'San Salvador Atenco', '3517832', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2000', '101', 'San Pedro Los Banos', '3517984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2001', '101', 'San Pedro El Alto', '3517999', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2002', '101', 'San Pablo Tecalco', '3518122', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2003', '101', 'San Pablo de las Salinas', '3518135', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2004', '101', 'San Pablo Autopan', '3518138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2005', '101', 'San Pablo Atlazalpan', '3518139', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2006', '101', 'San Nicolas Coatepec', '3518183', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2007', '101', 'San Miguel Zinacantepec', '3518221', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2008', '101', 'San Miguel Coatlinchan', '3518277', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2009', '101', 'Chapultepec', '3518280', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2010', '101', 'San Miguel Balderas', '3518286', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2011', '101', 'San Miguel Tenochtitlan', '3518326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2012', '101', 'San Mateo Xoloc', '3518361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2013', '101', 'San Mateo Texcalyacac', '3518364', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2014', '101', 'Mexicaltzingo', '3518377', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2015', '101', 'San Mateo Ixtacalco', '3518379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2016', '101', 'San Mateo Atenco', '3518387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2017', '101', 'San Martin de las Piramides', '3518414', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2018', '101', 'San Lorenzo Oyamel', '3518538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2019', '101', 'San Juan Teotihuacan', '3518618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2020', '101', 'San Juan de las Huertas', '3518702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2021', '101', 'San Gaspar Tonatico', '3519227', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2022', '101', 'San Francisco Zacacalco', '3519243', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2023', '101', 'San Francisco Tlalcilalcalpan', '3519249', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2024', '101', 'San Francisco Acuautla', '3519290', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2025', '101', 'San Felipe del Progreso', '3519412', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2026', '101', 'San Dieguito Xochimanca', '3519487', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2027', '101', 'San Buenaventura', '3519601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2028', '101', 'San Bartolo del Llano', '3519642', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2029', '101', 'San Bartolo Cuautlalpan', '3519644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2030', '101', 'Salitrillo', '3520038', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2031', '101', 'Rio Frio', '3520260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2032', '101', 'Pueblo Nuevo', '3521074', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2033', '101', 'Progreso Industrial', '3521111', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2034', '101', 'Papalotla', '3521925', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2035', '101', 'Ozumba de Alzate', '3522232', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2036', '101', 'Otumba de Gomez Farias', '3522265', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2037', '101', 'Ocoyoacac', '3522445', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2038', '101', 'Ocotitlan', '3522459', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2039', '101', 'Nicolas Romero', '3522732', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2040', '101', 'Naucalpan de Juarez', '3522790', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2041', '101', 'Montecillo', '3523034', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2042', '101', 'Metepec', '3523303', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2043', '101', 'Malinalco', '3523686', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2044', '101', 'Los Reyes Acozac', '3523900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2045', '101', 'Los Reyes', '3523908', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2046', '101', 'Lerma de Villada', '3524389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2047', '101', 'La Concepcion', '3525956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2048', '101', 'Juchitepec de Mariano Riva Palacio', '3526355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2049', '101', 'Joquicingo de Leon Guzman', '3526450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2050', '101', 'Jocotitlan', '3526473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2051', '101', 'San Marcos Jilotzingo', '3526499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2052', '101', 'Jilotepec de Abasolo', '3526501', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2053', '101', 'Jesus del Monte', '3526536', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2054', '101', 'Jaltepec', '3526599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2055', '101', 'Jaltenco', '3526600', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2056', '101', 'Jalatlaco', '3526611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2057', '101', 'Ixtapan de la Sal', '3526681', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2058', '101', 'Ixtapaluca', '3526682', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2059', '101', 'Hueypoxtla', '3526928', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2060', '101', 'Huehuetoca', '3526957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2061', '101', 'Ecatzingo de Hidalgo', '3529609', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2062', '101', 'Ecatepec', '3529612', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2063', '101', 'Santiago Cuautlalpan', '3529983', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2064', '101', 'Cuautitlan', '3529986', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2065', '101', 'Coyotepec', '3530123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2066', '101', 'Cocotitlan', '3530494', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2067', '101', 'Coatepec Harinas', '3530527', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2068', '101', 'Coacalco', '3530569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2069', '101', 'Ciudad Nezahualcoyotl', '3530589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2070', '101', 'Cholula', '3530756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2071', '101', 'Chimalpa', '3530852', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2072', '101', 'Chiconcuac', '3530932', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2073', '101', 'Chicoloapan de Juarez', '3530937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2074', '101', 'Chiautla', '3531007', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2075', '101', 'Chalco de Diaz Covarrubias', '3531200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2076', '101', 'Capulhuac', '3531598', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2077', '101', 'Calixtlahuaca', '3531794', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2078', '101', 'Calimaya de Diaz Gonzalez', '3531798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2079', '101', 'Bocanegra', '3532188', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2080', '101', 'Ayotusco', '3532513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2081', '101', 'Axapusco', '3532548', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2082', '101', 'Atlautla', '3532601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2083', '101', 'Atlatongo', '3532602', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2084', '101', 'Atlatlahuaca', '3532604', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2085', '101', 'Atlacomulco', '3532617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2086', '101', 'Ciudad Lopez Mateos', '3532624', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2087', '101', 'Atizapan', '3532625', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2088', '101', 'Apaxco de Ocampo', '3532803', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2089', '101', 'Ameyalco', '3532895', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2090', '101', 'Amecameca de Juarez', '3532899', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2091', '101', 'Almoloya del Rio', '3533037', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2092', '101', 'Almaya', '3533047', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2093', '101', 'Acazulco', '3533422', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2094', '101', 'Acambay', '3533475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2095', '101', 'San Antonio Acahualco', '3533490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2096', '101', 'San Mateo Tezoquipan', '3761194', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2097', '101', 'Santiago Tlacotepec', '3762210', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2098', '101', 'Pilcaya', '3817354', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2099', '101', 'Cerro La Calera', '3817584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2100', '101', 'Tezoyuca', '3817731', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2101', '101', 'Acolman', '3817745', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2102', '101', 'San Agustin Mextepec', '3827000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2103', '101', 'Santiago Citendeje', '3827022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2104', '101', 'San Lorenzo Tlacotepec', '3827030', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2105', '101', 'San Antonio Enchisi', '3827038', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2106', '101', 'Enthavi', '3827219', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2107', '101', 'San Pedro de Abajo', '3827229', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2108', '101', 'Yachihuacaltepec', '3827252', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2109', '101', 'San Mateo Otzacatipan', '3827254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2110', '101', 'San Maria Totoltepec', '3827256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2111', '101', 'San Antonio Buenavista', '3827260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2112', '101', 'San Pedro Tultepec', '3827267', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2113', '101', 'San Bartolome Tlaltelulco', '3827273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2114', '101', 'San Juan Tilapa', '3827274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2115', '101', 'San Pedro Tlaltizapan', '3827278', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2116', '101', 'San Andres Ocotlan', '3827283', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2117', '101', 'San Pedro Zictepec', '3827299', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2118', '101', 'Santa Maria Jajalpa', '3827304', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2119', '101', 'San Antonio La Isla', '3827306', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2120', '101', 'Santiago Tilapa', '3827335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2121', '101', 'San Mateo Atarasquillo', '3827368', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2122', '101', 'Huixquilucan', '3827414', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2123', '101', 'Zacamulpa', '3827416', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2124', '101', 'San Bartolome Coatepec', '3827418', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2125', '101', 'San Jose el Vidrio', '3827476', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2126', '101', 'San Pedro Xalpa', '3827566', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2127', '101', 'Melchor Ocampo', '3827586', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2128', '101', 'Huilango', '3827588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2129', '101', 'Santiago Teyahualco', '3827596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2130', '101', 'Santa Maria Tonatitla', '3827597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2131', '101', 'Santo Tomas Chiconautla', '3827600', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2132', '101', 'Valle de Bravo', '3980621', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2133', '101', 'Tejupilco de Hidalgo', '3982121', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2134', '101', 'San Simon de la Laguna', '3984771', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2135', '101', 'San Bartolo', '3987619', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2136', '101', 'Luvianos', '3997000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2137', '101', 'El Oro de Hidalgo', '4008868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2138', '101', 'Colorines', '4013141', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2139', '101', 'Amanalco de Becerra', '4018625', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2140', '101', 'Almoloya', '4018737', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2141', '101', 'Colonia Lindavista', '7280711', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2142', '102', 'Cacalomacan', '3531889', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2143', '102', 'Zinapecuaro', '3979665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2144', '102', 'Zamora de Hidalgo', '3979802', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2145', '102', 'Zacapu', '3979846', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2146', '102', 'Yurecuaro', '3979856', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2147', '102', 'Vistahermosa de Negrete', '3980037', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2148', '102', 'Villamar', '3980149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2149', '102', 'Villa Madero', '3980152', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2150', '102', 'Villa Escalante', '3980184', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2151', '102', 'Villachuato', '3980201', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2152', '102', 'Venustiano Carranza', '3980390', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2153', '102', 'Uruapan del Progreso', '3980760', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2154', '102', 'Tzintzuntzan', '3980828', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2155', '102', 'Tuxpan', '3980843', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2156', '102', 'Tlazazalca', '3981455', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2157', '102', 'Tlalpujahua de Rayon', '3981464', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2158', '102', 'Tiquicheo', '3981505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2159', '102', 'Tinguindin', '3981516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2160', '102', 'Tingambato', '3981517', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2161', '102', 'Tepalcatepec', '3982007', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2162', '102', 'Tarimbaro', '3982367', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2163', '102', 'Taretan', '3982377', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2164', '102', 'Tanhuato de Guerrero', '3982542', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2165', '102', 'Tangancicuaro de Arista', '3982545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2166', '102', 'Tancitaro', '3982548', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2167', '102', 'Tacambaro de Codallos', '3982693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2168', '102', 'Santiago Tangamandapio', '3983630', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2169', '102', 'Santa Fe de la Laguna', '3984340', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2170', '102', 'Santa Ana Maya', '3984691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2171', '102', 'San Lucas', '3985716', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2172', '102', 'San Francisco Pichataro', '3986970', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2173', '102', 'Sahuayo de Jose Maria Morelos', '3988258', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2174', '102', 'Quiroga', '3991110', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2175', '102', 'Querendaro', '3991169', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2176', '102', 'Puruaran', '3991218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2177', '102', 'Puruandiro', '3991219', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2178', '102', 'Purepero', '3991253', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2179', '102', 'Periban de Ramos', '3992919', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2180', '102', 'Penjamillo de Degollado', '3992987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2181', '102', 'Pedernales', '3993155', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2182', '102', 'Patzcuaro', '3993179', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2183', '102', 'Paracho de Verduzco', '3993457', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2184', '102', 'Panindicuaro de la Reforma', '3993519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2185', '102', 'Pajacuaran', '3993926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2186', '102', 'Opopeo', '3994164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2187', '102', 'Ocampo', '3994536', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2188', '102', 'Numaran', '3994581', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2189', '102', 'Nuevo San Juan Parangaricutiro', '3994594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2190', '102', 'Nuevo Churumuco', '3994614', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2191', '102', 'Nueva Italia de Ruiz', '3994674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2192', '102', 'Nocupetaro', '3994911', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2193', '102', 'Nahuatzen', '3995146', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2194', '102', 'Morelia', '3995402', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2195', '102', 'Mineral de Angangueo', '3995789', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2196', '102', 'Maravatio', '3996626', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2197', '102', 'Los Reyes', '3997220', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2198', '102', 'Lombardia', '3998318', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2199', '102', 'La Piedad Cavadas', '4000821', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2200', '102', 'La Orilla', '4001056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2201', '102', 'La Mira Tumbiscatio', '4001325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2202', '102', 'La Huacana', '4001956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2203', '102', 'Jungapeo', '4003703', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2204', '102', 'Jiquilpan de Juarez', '4003923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2205', '102', 'Ixtlan', '4004271', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2206', '102', 'Indaparapeo', '4004394', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2207', '102', 'Huetamo de Nunez', '4004555', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2208', '102', 'Huandacareo', '4004690', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2209', '102', 'Heroica Zitacuaro', '4004885', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2210', '102', 'Felipe Carrillo Puerto', '4006337', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2211', '102', 'Ecuandureo', '4011703', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2212', '102', 'Cuitzeo del Porvenir', '4012194', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2213', '102', 'Cuitareo', '4012202', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2214', '102', 'Cuanajo', '4012466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2215', '102', 'Cotija de la Paz', '4012685', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2216', '102', 'Copandaro de Galeana', '4012917', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2217', '102', 'Contepec', '4012957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2218', '102', 'Comachuen', '4013131', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2219', '102', 'Cojumatlan de Regules', '4013522', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2220', '102', 'Coeneo', '4013568', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2221', '102', 'Coalcoman de Matamoros', '4013669', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2222', '102', 'Coahuayana', '4013679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2223', '102', 'Ciudad Hidalgo', '4013712', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2224', '102', 'Churintzio', '4013966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2225', '102', 'Chilchota', '4014296', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2226', '102', 'Cheran', '4014409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2227', '102', 'Chavinda', '4014420', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2228', '102', 'Charo', '4014450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2229', '102', 'Charapan', '4014508', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2230', '102', 'Caracuaro', '4015471', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2231', '102', 'Capula', '4015520', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2232', '102', 'Capacuaro', '4015566', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2233', '102', 'Buenos Aires', '4016589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2234', '102', 'Buenavista Tomatlan', '4016599', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2235', '102', 'Brisenas', '4016756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2236', '102', 'Benito Juarez', '4017164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2237', '102', 'Arteaga', '4018128', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2238', '102', 'Ario de Rosales', '4018254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2239', '102', 'Ario de Rayon', '4018255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2240', '102', 'Apatzingan de la Constitucion', '4018400', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2241', '102', 'Antunes', '4018430', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2242', '102', 'Angamacutiro de la Union', '4018518', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2243', '102', 'Angahuan', '4018519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2244', '102', 'Alvaro Obregon', '4018648', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2245', '102', 'Aguililla', '4019152', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2246', '102', 'Acuitzio del Canje', '4019757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2247', '102', 'Irimbo', '4025093', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2248', '102', 'Las Guacamayas', '4026075', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2249', '102', 'Lazaro Cardenas', '4026082', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2250', '102', 'San Juan De Los Platanos', '6618821', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2251', '103', 'Zacatepec', '3514163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2252', '103', 'Yecapixtla', '3514278', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2253', '103', 'Yautepec', '3514321', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2254', '103', 'Xoxocotla', '3514398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2255', '103', 'Xochitepec', '3514437', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2256', '103', 'Totolapan', '3515195', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2257', '103', 'Tlayacapan', '3515343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2258', '103', 'Tlatenchi', '3515369', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2259', '103', 'Tlaquiltenango', '3515373', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2260', '103', 'Tlaltizapan', '3515415', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2261', '103', 'Tlalnepantla', '3515434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2262', '103', 'Tlacotepec', '3515475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2263', '103', 'Tilzapotla', '3515570', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2264', '103', 'Tetela del Volcan', '3515763', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2265', '103', 'Tetecala', '3515767', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2266', '103', 'Tepoztlan', '3515811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2267', '103', 'Tepalcingo', '3515921', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2268', '103', 'Temoac', '3516031', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2269', '103', 'Temixco', '3516035', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2270', '103', 'Telixtac', '3516063', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2271', '103', 'Tehuixtla', '3516098', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2272', '103', 'Santa Catarina', '3517687', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2273', '103', 'Puente de Ixtla', '3521051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2274', '103', 'Ocuituco', '3522439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2275', '103', 'Oaxtepec', '3522505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2276', '103', 'Miacatlan', '3523247', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2277', '103', 'Mazatepec', '3523415', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2278', '103', 'La Joya', '3525570', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2279', '103', 'Jonacatepec', '3526458', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2280', '103', 'Jojutla de Juarez', '3526467', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2281', '103', 'Jiutepec', '3526485', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2282', '103', 'Jantetelco', '3526584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2283', '103', 'Huitzilac', '3526883', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2284', '103', 'Hueyapan', '3526934', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2285', '103', 'Emiliano Zapata', '3527879', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2286', '103', 'Cuernavaca', '3529947', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2287', '103', 'Cuautla Morelos', '3529982', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2288', '103', 'Cocoyoc', '3530492', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2289', '103', 'Coatetelco', '3530523', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2290', '103', 'Ayala', '3532530', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2291', '103', 'Axochiapan', '3532545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2292', '103', 'Atlatlahucan', '3532603', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2293', '103', 'Apatlaco', '3532808', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2294', '103', 'Anenecuilco', '3532858', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2295', '103', 'Amayuca', '3532903', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2296', '103', 'Alpuyeca', '3533020', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2297', '103', 'Ahuehuetzingo', '3533143', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2298', '103', 'Higueron', '3761664', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2299', '103', 'Tres Marias', '3827341', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2300', '104', 'Zacualpan', '3979819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2301', '104', 'Yago', '3979983', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2302', '104', 'Villa Hidalgo', '3980168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2303', '104', 'Valle de Banderas', '3980622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2304', '104', 'Tepic', '3981941', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2305', '104', 'Tecuala', '3982168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2306', '104', 'San Vicente', '3983481', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2307', '104', 'Santiago Ixcuintla', '3983636', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2308', '104', 'Santa Maria del Oro', '3984079', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2309', '104', 'San Pedro Lagunillas', '3985019', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2310', '104', 'San Felipe Aztatan', '3987245', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2311', '104', 'San Blas', '3987544', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2312', '104', 'Ruiz', '3988361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2313', '104', 'Rosamorada', '3988421', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2314', '104', 'Puga', '3991323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2315', '104', 'Las Varas', '3999162', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2316', '104', 'La Jarretadera', '4001882', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2317', '104', 'Jalcocotan', '4004161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2318', '104', 'Jala', '4004170', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2319', '104', 'Ixtlan del Rio', '4004267', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2320', '104', 'Compostela', '4013085', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2321', '104', 'Bucerias', '4016734', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2322', '104', 'Amatlan de Canas', '4018592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2323', '104', 'Ahuacatlan', '4019089', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2324', '104', 'Acaponeta', '4019819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2325', '104', 'La Presa', '4020480', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2326', '105', 'Montemorelos', '3523011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2327', '105', 'Linares', '3524348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2328', '105', 'La Reforma', '3525067', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2329', '105', 'Hualahuises', '3527021', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2330', '105', 'General Teran', '3527451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2331', '105', 'General Bravo', '3527457', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2332', '105', 'China', '3530839', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2333', '105', 'Cadereyta', '3531865', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2334', '105', 'Hidalgo', '3792044', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2335', '105', 'Villa de Garcia', '3980190', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2336', '105', 'Santiago', '3983671', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2337', '105', 'Santa Catarina', '3984583', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2338', '105', 'San Nicolas de los Garza', '3985241', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2339', '105', 'Sabinas Hidalgo', '3988327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2340', '105', 'Pesqueria', '3992857', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2341', '105', 'Monterrey', '3995465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2342', '105', 'Mina', '3995847', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2343', '105', 'Marin', '3996548', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2344', '105', 'Lampazos de Naranjo', '4001240', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2345', '105', 'Juarez', '4003757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2346', '105', 'Guadalupe', '4005492', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2347', '105', 'General Zuazua', '4005856', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2348', '105', 'General Escobedo', '4005867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2349', '105', 'Garza Garcia', '4005937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2350', '105', 'Galeana', '4006081', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2351', '105', 'Doctor Arroyo', '4011873', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2352', '105', 'Ciudad Anahuac', '4013726', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2353', '105', 'Cienega de Flores', '4013892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2354', '105', 'Bustamante', '4016485', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2355', '105', 'Apodaca', '4018390', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2356', '105', 'Allende', '4018762', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2357', '106', 'Zimatlan de Alvarez', '3514027', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2358', '106', 'Union Hidalgo', '3514916', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2359', '106', 'Trinidad de Zaachila', '3515086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2360', '106', 'Tlalixtac de Cabrera', '3515442', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2361', '106', 'Tlacolula de Matamoros', '3515484', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2362', '106', 'San Vicente Coatlan', '3516770', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2363', '106', 'Santo Domingo Zanatepec', '3516837', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2364', '106', 'Santo Domingo Tehuantepec', '3516843', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2365', '106', 'Santiago Yaitepec', '3516909', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2366', '106', 'Santiago Suchilquitongo', '3516923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2367', '106', 'Santiago Pinotepa Nacional', '3516926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2368', '106', 'Santiago Matatlan', '3516937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2369', '106', 'Santiago Juxtlahuaca', '3516945', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2370', '106', 'Santiago Jamiltepec', '3516948', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2371', '106', 'Santa Maria Zacatepec', '3517178', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2372', '106', 'Santa Maria Xadani', '3517191', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2373', '106', 'Santa Maria Petapa', '3517220', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2374', '106', 'Santa Maria Huazolotitlan', '3517250', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2375', '106', 'Huatulco', '3517251', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2376', '106', 'Santa Maria del Tule', '3517254', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2377', '106', 'Santa Maria Ayoquezco de Aldama', '3517281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2378', '106', 'Santa Maria Asuncion Tlaxiaco', '3517285', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2379', '106', 'Santa Cruz Xoxocotlan', '3517517', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2380', '106', 'Santa Cruz Xitla', '3517519', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2381', '106', 'Santa Catarina Mechoacan', '3517665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2382', '106', 'Santa Catarina Juquila', '3517669', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2383', '106', 'San Sebastian Tutla', '3517798', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2384', '106', 'Teitipac', '3517801', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2385', '106', 'San Pedro y San Pablo Etla', '3517937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2386', '106', 'San Pedro Tapanatepec', '3517962', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2387', '106', 'San Pedro Pochutla', '3517970', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2388', '106', 'San Pedro Mixtepec', '3517978', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2389', '106', 'San Pedro Jicayan', '3517988', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2390', '106', 'San Pedro Ixcatlan', '3517993', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2391', '106', 'San Pablo Villa de Mitla', '3518117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2392', '106', 'San Pablo Huixtepec', '3518128', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2393', '106', 'San Pablo Huitzo', '3518129', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2394', '106', 'San Miguel Quetzaltepec', '3518249', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2395', '106', 'San Miguel Panixtlahuaca', '3518253', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2396', '106', 'San Mateo del Mar', '3518382', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2397', '106', 'San Lucas Ojitlan', '3518518', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2398', '106', 'San Juan Guichicovi', '3518676', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2399', '106', 'San Juan Guelavia', '3518677', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2400', '106', 'San Juan Cacahuatepec', '3518720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2401', '106', 'San Juan Bautista Valle Nacional', '3518722', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2402', '106', 'San Juan Bautista Tuxtepec', '3518723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2403', '106', 'San Juan Bautista Cuicatlan', '3518729', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2404', '106', 'San Jose Chiltepec', '3518889', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2405', '106', 'San Jacinto Ocotlan', '3519101', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2406', '106', 'San Gabriel Mixtepec', '3519228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2407', '106', 'San Gabriel Casa Blanca', '3519231', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2408', '106', 'San Francisco Telixtlahuaca', '3519255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2409', '106', 'San Francisco del Mar', '3519274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2410', '106', 'San Felipe Usila', '3519402', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2411', '106', 'San Felipe Jalapa de Diaz', '3519409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2412', '106', 'San Dionisio Ocotepec', '3519480', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2413', '106', 'San Dionisio del Mar', '3519481', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2414', '106', 'San Cristobal Amatlan', '3519539', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2415', '106', 'San Bartolome Ayautla', '3519640', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2416', '106', 'San Baltazar Chichicapan', '3519666', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2417', '106', 'San Andres Huayapan', '3519926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2418', '106', 'San Andres Huaxpaltepec', '3519927', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2419', '106', 'Salina Cruz', '3520064', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2420', '106', 'Rincon Viejo', '3520281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2421', '106', 'Putla de Guerrero', '3520935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2422', '106', 'Puerto Escondido', '3520994', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2423', '106', 'Pinotepa de Don Luis', '3521424', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2424', '106', 'Palomares', '3522013', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2425', '106', 'Oaxaca de Juarez', '3522507', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2426', '106', 'Niltepec', '3522728', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2427', '106', 'Miahuatlan de Porfirio Diaz', '3523240', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2428', '106', 'Matias Romero', '3523450', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2429', '106', 'Magdalena Teitipac', '3523745', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2430', '106', 'Las Amilpas', '3524965', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2431', '106', 'Juchitan de Zaragoza', '3526357', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2432', '106', 'Jalapa', '3526621', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2433', '106', 'San Jeronimo Ixtepec', '3526674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2434', '106', 'Ixhuatan', '3526715', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2435', '106', 'Huajuapan de Leon', '3527023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2436', '106', 'El Espinal', '3528975', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2437', '106', 'Ejutla de Crespo', '3529510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2438', '106', 'Cuilapan de Guerrero', '3529915', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2439', '106', 'Cosolapa', '3530168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2440', '106', 'Comitancillo', '3530369', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2441', '106', 'Chahuite', '3531221', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2442', '106', 'Cacaotepec', '3531875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2443', '106', 'Ayotzintepec', '3532510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2444', '106', 'Asuncion Ocotlan', '3532655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2445', '106', 'Asuncion Nochixtlan', '3532656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2446', '106', 'Asuncion Ixtaltepec', '3532658', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2447', '106', 'San Pedro Amuzgos', '3532878', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2448', '106', 'Acatlan de Perez Figueroa', '3533439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2449', '106', 'San Antonio de la Cal', '3762770', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2450', '106', 'San Agustin de las Juntas', '3762771', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2451', '106', 'Santos Reyes Nopala', '3800500', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2452', '106', 'Tamazulapan del Progreso', '3801045', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2453', '106', 'Teotitlan de Flores Magon', '3801145', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2454', '106', 'Tezonapa', '3801225', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2455', '106', 'Isla Soyaltepec', '3801262', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2456', '106', 'Guadalupe Etla', '3801596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2457', '106', 'Santa Maria Coyotepec', '3801635', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2458', '107', 'Zongozotla', '3514007', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2459', '107', 'Zaragoza', '3514051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2460', '107', 'Zacatlan', '3514148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2461', '107', 'Zacatepec', '3514162', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2462', '107', 'Zacapoaxtla', '3514179', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2463', '107', 'Yehualtepec', '3514272', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2464', '107', 'Yaonahuac', '3514326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2465', '107', 'Xochitlan', '3514433', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2466', '107', 'Xicotepec de Juarez', '3514510', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2467', '107', 'Xaltepec', '3514589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2468', '107', 'Xalmimilulco', '3514597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2469', '107', 'Tulcingo del Valle', '3515056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2470', '107', 'Tochtepec', '3515330', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2471', '107', 'Tochimilco', '3515332', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2472', '107', 'Tlaxco', '3515354', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2473', '107', 'Tlaxcalancingo', '3515358', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2474', '107', 'Tlatlauquitepec', '3515363', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2475', '107', 'Tlanepantla', '3515394', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2476', '107', 'Tlanalapan', '3515401', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2477', '107', 'Tlaltenango', '3515420', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2478', '107', 'Tlacotepec', '3515473', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2479', '107', 'Tlachichuca', '3515496', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2480', '107', 'Teziutlan', '3515696', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2481', '107', 'Tetzoyocan', '3515735', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2482', '107', 'Teteles', '3515757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2483', '107', 'Tetela de Ocampo', '3515762', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2484', '107', 'Tepulco', '3515806', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2485', '107', 'Tepexi de Rodriguez', '3515848', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2486', '107', 'Tepeojuma', '3515877', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2487', '107', 'Tepeaca', '3515904', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2488', '107', 'Tepatlaxco de Hidalgo', '3515906', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2489', '107', 'Tepango de Rodriguez', '3515911', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2490', '107', 'Teopantlan', '3515939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2491', '107', 'Tenango', '3516003', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2492', '107', 'Tehuacan', '3516109', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2493', '107', 'Tecamachalco', '3516188', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2494', '107', 'Tecali de Herrera', '3516191', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2495', '107', 'Soltepec', '3516552', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2496', '107', 'Santo Tomas Hueyotlipan', '3516813', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2497', '107', 'Santo Tomas Chautla', '3516818', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2498', '107', 'Santiago Miahuatlan', '3516936', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2499', '107', 'Santiago Alseseca', '3516973', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2500', '107', 'Santiago Acatlan', '3516975', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2501', '107', 'Santa Rita Tlahuapan', '3517095', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2502', '107', 'Santa Maria Moyotzingo', '3517231', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2503', '107', 'Santa Maria la Alta', '3517241', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2504', '107', 'Santa Maria Ixtiyucan', '3517246', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2505', '107', 'Santa Maria Coronanco', '3517265', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2506', '107', 'Santa Maria Acuexcomac', '3517294', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2507', '107', 'Santa Ines Ahuatempan', '3517426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2508', '107', 'Santa Clara Ocoyucan', '3517618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2509', '107', 'San Sebastian Zinacatepec', '3517795', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2510', '107', 'San Sebastian Villanueva', '3517797', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2511', '107', 'San Salvador el Seco', '3517831', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2512', '107', 'San Nicolas de los Ranchos', '3518181', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2513', '107', 'San Nicolas de Buenos Aires', '3518182', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2514', '107', 'San Miguel Zozutla', '3518220', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2515', '107', 'San Miguel Xoxtla', '3518224', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2516', '107', 'San Miguel Tenextatiloyan', '3518235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2517', '107', 'San Miguel Canoa', '3518281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2518', '107', 'San Matias Tlalancaleca', '3518352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2519', '107', 'San Mateo Tlaixpan', '3518363', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2520', '107', 'San Martin Texmelucan de Labastida', '3518407', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2521', '107', 'San Marcos Tlacoyalco', '3518439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2522', '107', 'San Lorenzo Chiautzingo', '3518542', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2523', '107', 'San Lorenzo Almecatla', '3518543', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2524', '107', 'San Juan Xiutetelco', '3518602', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2525', '107', 'San Juan Tianguismanalco', '3518611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2526', '107', 'San Juan Ixcaquixtla', '3518651', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2527', '107', 'San Juan Amecac', '3518739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2528', '107', 'San Jose Miahuatlan', '3518835', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2529', '107', 'San Jose Chiapa', '3518892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2530', '107', 'San Jose Acateno', '3518905', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2531', '107', 'San Jeronimo Ocotitlan', '3519061', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2532', '107', 'San Hipolito Xochiltenango', '3519207', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2533', '107', 'San Gregorio Atzompa', '3519216', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2534', '107', 'San Gabriel Chilac', '3519230', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2535', '107', 'San Felipe Teotlalcingo', '3519405', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2536', '107', 'Sanctorum', '3519531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2537', '107', 'San Bartolo Teontepec', '3519632', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2538', '107', 'San Aparicio', '3519675', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2539', '107', 'San Andres Calpan', '3519930', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2540', '107', 'Rafael Lara Grajales', '3520875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2541', '107', 'Rafael J. Garcia', '3520876', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2542', '107', 'Quecholac', '3520926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2543', '107', 'Puebla de Zaragoza', '3521081', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2544', '107', 'Palmarito Tochapan', '3522118', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2545', '107', 'Palmar de Bravo', '3522130', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2546', '107', 'Pahuatlan del Valle', '3522198', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2547', '107', 'Oriental', '3522317', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2548', '107', 'Ocotlan', '3522454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2549', '107', 'Nopalucan de la Granja', '3522645', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2550', '107', 'Necaxa', '3522777', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2551', '107', 'Nealtican', '3522781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2552', '107', 'Morelos Canada', '3522959', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2553', '107', 'Momoxpan', '3523061', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2554', '107', 'Metlaltoyuca', '3523296', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2555', '107', 'Malacatepec', '3523697', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2556', '107', 'Magdalena Cuayucatepec', '3523756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2557', '107', 'Libres', '3524374', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2558', '107', 'La Ceiba', '3526056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2559', '107', 'Izucar de Matamoros', '3526657', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2560', '107', 'Hueytamalco', '3526927', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2561', '107', 'Huejotzingo', '3526953', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2562', '107', 'Huautla de Jimenez', '3526987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2563', '107', 'Huauchinango', '3526992', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2564', '107', 'Huaquechula', '3527006', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2565', '107', 'Esperanza', '3527748', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2566', '107', 'Domingo Arenas', '3529730', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2567', '107', 'Cuetzalan del Progreso', '3529932', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2568', '107', 'Cuautlancingo', '3529981', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2569', '107', 'Cuapiaxtla de Madero', '3530032', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2570', '107', 'Cuanala', '3530040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2571', '107', 'Cuacnopalan', '3530056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2572', '107', 'Coxcatlan', '3530150', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2573', '107', 'Coatepec', '3530532', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2574', '107', 'Ciudad Serdan', '3530584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2575', '107', 'Cholula', '3530757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2576', '107', 'Chignautla', '3530907', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2577', '107', 'Chignahuapan', '3530908', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2578', '107', 'Chietla', '3530913', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2579', '107', 'Chiautla de Tapia', '3531006', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2580', '107', 'Caxhuacan', '3531398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2581', '107', 'Caltenco', '3531782', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2582', '107', 'Calmeca', '3531790', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2583', '107', 'Cacalosuchil', '3531888', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2584', '107', 'Benito Juarez', '3532278', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2585', '107', 'Ayutla', '3532506', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2586', '107', 'Atzitzintla', '3532560', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2587', '107', 'Atoyatempan', '3532569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2588', '107', 'Atlixco', '3532592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2589', '107', 'Atencingo', '3532636', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2590', '107', 'Atempan', '3532639', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2591', '107', 'Amozoc de Mota', '3532881', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2592', '107', 'Altepexi', '3532989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2593', '107', 'Aljojuca', '3533058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2594', '107', 'Ajalpan', '3533126', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2595', '107', 'Acatzingo de Hidalgo', '3533433', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2596', '107', 'Acatlan de Osorio', '3533440', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2597', '107', 'Acajete', '3533486', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2598', '107', 'Guadalupe Victoria', '3818786', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2599', '107', 'Chapuco', '3818819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2600', '107', 'Actipan', '3818846', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2601', '107', 'Raboso', '3818912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2602', '107', 'Huehuetlan El Chico', '3818938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2603', '107', 'Tlancualpican', '3818940', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2604', '107', 'Caipan', '3819040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2605', '107', 'Jolalpan', '3819050', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2606', '107', 'francisco villa', '6620235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2607', '108', 'Tequisquiapan', '3515796', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2608', '108', 'San Nicolas', '3518200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2609', '108', 'San Juan del Rio', '3518692', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2610', '108', 'Jalpan', '3526601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2611', '108', 'Ezequiel Montes', '3527656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2612', '108', 'Cadereyta de Montes', '3531863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2613', '108', 'La Llave', '3825948', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2614', '108', 'Tlacote el Bajo', '3981483', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2615', '108', 'Santa Rosa de Jauregui', '3983820', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2616', '108', 'San Jose el Alto', '3986090', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2617', '108', 'Queretaro', '3991164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2618', '108', 'Pedro Escobedo', '3993126', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2619', '108', 'La Lira', '4001597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2620', '108', 'La Estancia', '4002462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2621', '108', 'La Canada', '4003211', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2622', '108', 'Huimilpan', '4004529', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2623', '108', 'El Sauz', '4007554', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2624', '108', 'El Pueblito', '4008303', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2625', '108', 'El Colorado', '4010260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2626', '108', 'Colon', '4013487', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2627', '108', 'Amealco', '4018584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2628', '108', 'Amascala', '4018601', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2629', '108', 'Ajuchitlan', '4019042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2630', '109', 'Tulum', '3515040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2631', '109', 'Playa del Carmen', '3521342', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2632', '109', 'Nicolas Bravo', '3522742', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2633', '109', 'Isla Mujeres', '3526756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2634', '109', 'Felipe Carrillo Puerto', '3527639', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2635', '109', 'San Miguel de Cozumel', '3530103', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2636', '109', 'Coba', '3530506', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2637', '109', 'Chunhuhub', '3530691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2638', '109', 'Chetumal', '3531023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2639', '109', 'Cancun', '3531673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2640', '109', 'Calderitas', '3531816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2641', '109', 'Bacalar', '3532465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2642', '109', 'Kantunilkin', '3822702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2643', '109', 'Alfredo V. Bonfil', '3822723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2644', '109', 'Leona Vicario', '3822745', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2645', '110', 'Xilitla', '3514502', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2646', '110', 'Tanquian Escobedo', '3516281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2647', '110', 'Tamuin', '3516347', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2648', '110', 'Tamazunchale', '3516385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2649', '110', 'Tamasopo', '3516396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2650', '110', 'San Vicente Tancuayalab', '3516764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2651', '110', 'San Ciro de Acosta', '3519570', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2652', '110', 'Rio Verde', '3520235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2653', '110', 'Rayon', '3520427', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2654', '110', 'General Pedro Antonio Santos', '3527454', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2655', '110', 'El Naranjo', '3528643', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2656', '110', 'Ciudad Valles', '3530582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2657', '110', 'Ciudad Fernandez', '3530596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2658', '110', 'Ciudad del Maiz', '3530598', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2659', '110', 'Cardenas', '3531574', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2660', '110', 'Alfredo M. Terrazas', '3533067', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2661', '110', 'Villa Juarez', '3973756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2662', '110', 'Los Zacatones', '3974149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2663', '110', 'Dulce Grande', '3974329', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2664', '110', 'Zaragoza', '3979714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2665', '110', 'Villa de Reyes', '3980186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2666', '110', 'Tierranueva', '3981652', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2667', '110', 'Soledad Diez Gutierrez', '3982912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2668', '110', 'Santa Maria del Rio', '3984074', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2669', '110', 'San Luis Potosi', '3985606', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2670', '110', 'Salitral de Carreras', '3988153', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2671', '110', 'Salinas de Hidalgo', '3988169', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2672', '110', 'Matehuala', '3996387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2673', '110', 'La Pila', '4000811', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2674', '110', 'Escalerillas', '4006677', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2675', '110', 'Charcas', '4014501', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2676', '110', 'Cerritos', '4014795', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2677', '110', 'Ahualulco', '4019085', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2678', '111', 'Isla del Bosque', '3976232', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2679', '111', 'Concordia', '3976324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2680', '111', 'Gabriel Leyva Solano', '3976775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2681', '111', 'Villa Union', '3980125', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2682', '111', 'Topolobampo', '3981345', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2683', '111', 'Teacapan', '3982287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2684', '111', 'Sinaloa de Leyva', '3983032', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2685', '111', 'San Miguel Zapotitlan', '3985301', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2686', '111', 'San Ignacio', '3986862', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2687', '111', 'San Blas', '3987538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2688', '111', 'Quila', '3991148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2689', '111', 'Navolato', '3995017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2690', '111', 'Mocorito', '3995652', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2691', '111', 'Mochicahui', '3995671', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2692', '111', 'Mazatlan', '3996322', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2693', '111', 'Los Mochis', '3997479', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2694', '111', 'La Trinidad', '3998956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2695', '111', 'La Reforma', '4000490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2696', '111', 'La Cruz', '4002745', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2697', '111', 'Higuera de Zaragoza', '4004850', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2698', '111', 'Guasave', '4005219', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2699', '111', 'Guamuchil', '4005297', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2700', '111', 'General Juan Jose Rios', '4005864', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2701', '111', 'Escuinapa de Hidalgo', '4006622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2702', '111', 'El Rosario', '4007812', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2703', '111', 'El Fuerte', '4009788', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2704', '111', 'El Dorado', '4009984', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2705', '111', 'El Carrizo', '4010589', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2706', '111', 'El Burrion', '4010897', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2707', '111', 'Culiacancito', '4012173', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2708', '111', 'Culiacan', '4012176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2709', '111', 'Costa Rica', '4012693', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2710', '111', 'Cosala', '4012707', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2711', '111', 'Constancia', '4012966', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2712', '111', 'Compuertas', '4013076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2713', '111', 'Choix', '4014109', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2714', '111', 'Campo Gobierno', '4015938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2715', '111', 'Bagojo', '4017739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2716', '111', 'Badiraguato', '4017743', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2717', '111', 'Angostura', '4018499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2718', '111', 'Ahome', '4019098', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2719', '111', 'Agua Verde', '4019219', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2720', '111', 'Adolfo Ruiz Cortines', '4019727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2721', '112', 'Rio Muerto', '3970558', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2722', '112', 'Vicam', '3970634', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2723', '112', 'Yavaros', '3979962', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2724', '112', 'Villa Juarez', '3980161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2725', '112', 'Ures', '3980782', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2726', '112', 'Sonoyta', '3982837', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2727', '112', 'Santa Ana', '3984717', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2728', '112', 'San Luis Rio Colorado', '3985604', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2729', '112', 'Sahuaripa', '3988265', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2730', '112', 'Puerto Penasco', '3991347', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2731', '112', 'Pueblo Yaqui', '3991547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2732', '112', 'Providencia', '3991622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2733', '112', 'Potam', '3992154', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2734', '112', 'Pitiquito', '3992405', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2735', '112', 'Nacozari Viejo', '3995155', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2736', '112', 'Naco', '3995171', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2737', '112', 'Moctezuma', '3995647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2738', '112', 'Magdalena de Kino', '3996893', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2739', '112', 'La Union', '3998913', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2740', '112', 'Imuris', '4004399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2741', '112', 'Huatabampo', '4004647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2742', '112', 'Heroica Nogales', '4004886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2743', '112', 'Heroica Caborca', '4004887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2744', '112', 'Hermosillo', '4004898', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2745', '112', 'Guaymas', '4005143', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2746', '112', 'Etchoropo', '4006387', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2747', '112', 'Etchojoa', '4006388', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2748', '112', 'Esqueda', '4006532', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2749', '112', 'Empalme', '4006806', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2750', '112', 'El Tobarito', '4007210', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2751', '112', 'Cumpas', '4012143', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2752', '112', 'Cocorit', '4013593', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2753', '112', 'Ciudad Obregon', '4013704', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2754', '112', 'Cananea', '4015700', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2755', '112', 'Campo Sesenta', '4015842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2756', '112', 'Benjamin Hill', '4017152', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2757', '112', 'Bahia Kino', '4017728', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2758', '112', 'Bacum', '4017758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2759', '112', 'Altar', '4018700', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2760', '112', 'Alamos', '4018904', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2761', '112', 'Agua Prieta', '4019260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2762', '113', 'Villahermosa', '3514670', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2763', '113', 'Villa el Triunfo', '3514678', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2764', '113', 'Tenosique de Pino Suarez', '3515956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2765', '113', 'Tecolutilla', '3516149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2766', '113', 'Teapa', '3516210', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2767', '113', 'Tamulte de las Sabanas', '3516344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2768', '113', 'Tacotalpa', '3516439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2769', '113', 'Santa Rosalia', '3517029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2770', '113', 'San Carlos', '3519588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2771', '113', 'Paraiso', '3521912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2772', '113', 'Nacajuca', '3522865', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2773', '113', 'Miguel Hidalgo', '3523212', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2774', '113', 'Macuspana', '3523791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2775', '113', 'Macultepec', '3523794', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2776', '113', 'Luis Gil Perez', '3523828', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2777', '113', 'Jonuta', '3526453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2778', '113', 'Jalpa de Mendez', '3526603', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2779', '113', 'Huimanguillo', '3526908', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2780', '113', 'Frontera', '3527545', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2781', '113', 'Emiliano Zapata', '3527880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2782', '113', 'Cunduacan', '3529886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2783', '113', 'Comalcalco', '3530385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2784', '113', 'Ciudad Pemex', '3530588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2785', '113', 'Chontalpa', '3530749', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2786', '113', 'Cardenas', '3531576', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2787', '113', 'Buenavista', '3532053', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2788', '113', 'Belen', '3532310', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2789', '113', 'Balancan de Dominguez', '3532443', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2790', '113', 'Ayapa', '3532526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2791', '113', 'Aquiles Serdan', '3532779', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2792', '113', 'Villa La Venta', '3802196', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2793', '113', 'El Tular', '3802287', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2794', '113', 'Parrilla', '3802710', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2795', '113', 'Rio de Teapa', '3802739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2796', '113', 'Jalapa', '3803064', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2797', '113', 'Huapinol', '6690612', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2798', '114', 'Cuauhtemoc', '3482886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2799', '114', 'Xicotencatl', '3483063', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2800', '114', 'San Fernando', '3483197', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2801', '114', 'Gustavo Diaz Ordaz', '3483393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2802', '114', 'Valle Hermoso', '3514868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2803', '114', 'Tula', '3515068', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2804', '114', 'Tampico', '3516355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2805', '114', 'Soto la Marina', '3516522', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2806', '114', 'Santander Jimenez', '3517151', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2807', '114', 'Guillermo Zuniga', '3517482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2808', '114', 'Rio Bravo', '3520271', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2809', '114', 'Reynosa', '3520339', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2810', '114', 'Ocampo', '3522493', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2811', '114', 'Nuevo Progreso', '3522526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2812', '114', 'Nuevo Padilla', '3522531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2813', '114', 'Nuevo Laredo', '3522551', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2814', '114', 'Nueva Ciudad Guerrero', '3522617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2815', '114', 'Miramar', '3523149', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2816', '114', 'Mier', '3523222', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2817', '114', 'Matamoros', '3523466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2818', '114', 'Manuel', '3523608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2819', '114', 'Llera de Canales', '3524292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2820', '114', 'Jaumave', '3526564', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2821', '114', 'Hidalgo', '3527117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2822', '114', 'Graciano Sanchez', '3527413', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2823', '114', 'El Mante', '3528756', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2824', '114', 'Ciudad Victoria', '3530580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2825', '114', 'Ciudad Miguel Aleman', '3530590', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2826', '114', 'Ciudad Madero', '3530594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2827', '114', 'Camargo', '3531764', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2828', '114', 'Antiguo Morelos', '3532824', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2829', '114', 'Altamira', '3533005', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2830', '114', 'Aldama', '3533079', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2831', '114', 'Abasolo', '3533505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2832', '115', 'Tocatlan', '3515333', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2833', '115', 'Tlaxco de Morelos', '3515349', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2834', '115', 'Terrenate', '3515782', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2835', '115', 'Tepetitla', '3515870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2836', '115', 'San Vicente Xiloxochitla', '3516763', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2837', '115', 'Santiago Tetla', '3516919', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2838', '115', 'Santa Ana Huiloac', '3517734', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2839', '115', 'Santa Ana Chiautempan', '3517742', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2840', '115', 'San Pablo Apetatitlan', '3518140', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2841', '115', 'San Martin Xaltocan', '3518403', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2842', '115', 'San Luis Teolocholco', '3518475', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2843', '115', 'San Francisco Atezcatzinco', '3519289', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2844', '115', 'San Felipe Ixtacuixtla', '3519410', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2845', '115', 'Sanctorum', '3519530', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2846', '115', 'San Bernabe Amaxac de Guerrero', '3519622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2847', '115', 'Panotla', '3521951', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2848', '115', 'Nativitas', '3522795', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2849', '115', 'Nanacamilpa', '3522855', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2850', '115', 'Hueyotlipan de Hidalgo', '3526929', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2851', '115', 'Cuapiaxtla', '3530033', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2852', '115', 'Contla', '3530276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2853', '115', 'Calpulalpan', '3531784', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2854', '115', 'Benito Juarez', '3532279', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2855', '115', 'Ayometitla', '3532521', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2856', '115', 'Apizaco', '3532792', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2857', '115', 'Actlzayanca de Hidalgo', '3533393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2858', '115', 'Tequixquitla', '3815299', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2859', '115', 'Huamantla', '3815324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2860', '115', 'Ixtenco', '3815326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2861', '115', 'Zitlaltepec', '3815329', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2862', '115', 'Tetlanohcan', '3815359', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2863', '115', 'Mazatecochco', '3815362', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2864', '115', 'Xicohtzinco', '3815363', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2865', '115', 'Tlaltelulco', '3815375', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2866', '115', 'Tepeyanco', '3815389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2867', '115', 'Zacatelco', '3815392', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2868', '115', 'Teacalco', '3815405', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2869', '115', 'Tlaxcala', '3815415', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2870', '115', 'Totolac', '3815419', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2871', '115', 'Papalotla', '3815447', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2872', '115', 'Tenancingo', '3815451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2873', '115', 'Vicente Guerrero', '3815453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2874', '115', 'Texcalac', '3815459', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2875', '116', 'Zozocolco de Hidalgo', '3513976', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2876', '116', 'Zongolica', '3514008', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2877', '116', 'Zempoala', '3514044', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2878', '116', 'Zaragoza', '3514049', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2879', '116', 'Yecuatla', '3514277', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2880', '116', 'Yanga', '3514329', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2881', '116', 'Xocotla', '3514424', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2882', '116', 'Xico', '3514518', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2883', '116', 'Villa Cuauhtemoc', '3514682', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2884', '116', 'Villa Azueta', '3514686', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2885', '116', 'Veracruz', '3514783', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2886', '116', 'Vega de Alatorre', '3514843', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2887', '116', 'Ursulo Galvan', '3514906', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2888', '116', 'Tuzamapan', '3514998', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2889', '116', 'Tuxpan de Rodriguez Cano', '3515011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2890', '116', 'Totutla', '3515184', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2891', '116', 'Totolapa', '3515200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2892', '116', 'Tomatlan', '3515290', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2893', '116', 'Tocuila', '3515326', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2894', '116', 'Tlapacoyan', '3515386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2895', '116', 'Tlacotalpan', '3515479', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2896', '116', 'Tlacojalpan', '3515487', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2897', '116', 'Tihuatlan', '3515603', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2898', '116', 'Texistepec', '3515710', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2899', '116', 'Tetelzingo', '3515753', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2900', '116', 'Tequila', '3515799', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2901', '116', 'Tepetzintla', '3515853', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2902', '116', 'Teocelo', '3515946', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2903', '116', 'Tempoal de Sanchez', '3516019', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2904', '116', 'Temapache', '3516053', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2905', '116', 'Tecolutla', '3516148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2906', '116', 'Tatahuicapan', '3516234', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2907', '116', 'Tantoyuca', '3516271', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2908', '116', 'Tamiahua', '3516376', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2909', '116', 'Tamalin', '3516410', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2910', '116', 'Soteapan', '3516526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2911', '116', 'Soledad de Doblado', '3516563', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2912', '116', 'Soconusco', '3516611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2913', '116', 'Sayula de Aleman', '3516723', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2914', '116', 'Santiago Tuxtla', '3516912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2915', '116', 'Santiago de la Pena', '3516956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2916', '116', 'San Rafael', '3517915', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2917', '116', 'San Pedro Tlanisco', '3517954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2918', '116', 'San Marcos', '3518451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2919', '116', 'San Juan Evangelista', '3518679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2920', '116', 'San Andres Tuxtla', '3519907', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2921', '116', 'Saltabarranca', '3520026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2922', '116', 'Rio Blanco', '3520274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2923', '116', 'Rinconada', '3520319', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2924', '116', 'Rafael Lucio', '3520874', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2925', '116', 'Rafael Delgado', '3520877', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2926', '116', 'Poza Rica de Hidalgo', '3521168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2927', '116', 'Potrero del Llano', '3521207', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2928', '116', 'Playa Vicente', '3521334', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2929', '116', 'Platon Sanchez', '3521344', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2930', '116', 'Piedras Negras', '3521482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2931', '116', 'Perote', '3521628', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2932', '116', 'Paso de Ovejas', '3521825', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2933', '116', 'Paso del Toro', '3521830', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2934', '116', 'Paso del Macho', '3521833', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2935', '116', 'Papantla de Olarte', '3521922', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2936', '116', 'Panuco', '3521941', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2937', '116', 'Pajapan', '3522186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2938', '116', 'Ozuluama', '3522235', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2939', '116', 'Oteapan', '3522279', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2940', '116', 'Otatitlan', '3522280', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2941', '116', 'Orizaba', '3522307', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2942', '116', 'Omealca', '3522347', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2943', '116', 'Oluta', '3522350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2944', '116', 'Nogales', '3522696', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2945', '116', 'Nautla', '3522788', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2946', '116', 'Naranjos', '3522804', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2947', '116', 'Naolinco', '3522836', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2948', '116', 'Nanchital', '3522845', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2949', '116', 'Mundo Nuevo', '3522880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2950', '116', 'Motzorongo', '3522923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2951', '116', 'Moralillo', '3522973', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2952', '116', 'Monte Blanco', '3523040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2953', '116', 'Misantla', '3523141', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2954', '116', 'Minatitlan', '3523183', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2955', '116', 'Mecayapan', '3523397', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2956', '116', 'Martinez de La Torre', '3523513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2957', '116', 'Mariano Escobedo', '3523559', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2958', '116', 'Manlio Fabio Altamirano', '3523616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2959', '116', 'Maltrata', '3523670', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2960', '116', 'Los Altos', '3524186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2961', '116', 'Lerdo de Tejada', '3524391', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2962', '116', 'Las Vigas', '3524580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2963', '116', 'Las Choapas', '3524903', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2964', '116', 'La Poza', '3525158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2965', '116', 'La Perla', '3525203', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2966', '116', 'La Isla', '3525596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2967', '116', 'Jilotepec', '3526505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2968', '116', 'Jesus Carranza', '3526538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2969', '116', 'Jamapa', '3526588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2970', '116', 'Jalapilla', '3526613', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2971', '116', 'Jalapa Enriquez', '3526617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2972', '116', 'Jalacingo', '3526625', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2973', '116', 'Ixtaczoquitlan', '3526696', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2974', '116', 'Ixhuatlancillo', '3526714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2975', '116', 'Ixcatepec', '3526726', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2976', '116', 'Ignacio de la Llave', '3526808', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2977', '116', 'Huiloapan', '3526916', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2978', '116', 'Hueyapan de Ocampo', '3526932', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2979', '116', 'Huatusco de Chicuellar', '3526993', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2980', '116', 'Hidalgotitlan', '3527113', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2981', '116', 'Hidalgo', '3527121', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2982', '116', 'Gutierrez Zamora', '3527186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2983', '116', 'Fortin de las Flores', '3527596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2984', '116', 'Filomeno Mata', '3527624', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2985', '116', 'Estero', '3527679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2986', '116', 'Emilio Carranza', '3527869', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2987', '116', 'El Tejar', '3528046', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2988', '116', 'El Higo', '3528894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2989', '116', 'El Castillo', '3529243', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2990', '116', 'Cuitlahuac', '3529911', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2991', '116', 'Cuichapa', '3529918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2992', '116', 'Cuautlapan', '3529980', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2993', '116', 'Coyutla', '3530110', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2994', '116', 'Coxquihui', '3530144', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2995', '116', 'Cosoleacaque', '3530167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2996', '116', 'Coscomatepec de Bravo', '3530175', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2997', '116', 'Cosautlan de Carbajal', '3530176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2998', '116', 'Cosamaloapan de Carpio', '3530177', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('2999', '116', 'Corral Nuevo', '3530200', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3000', '116', 'Cordoba', '3530240', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3001', '116', 'Comoapan', '3530362', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3002', '116', 'Coatzintla', '3530513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3003', '116', 'Coatzacoalcos', '3530517', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3004', '116', 'Coatepec', '3530531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3005', '116', 'Coacoatzintla', '3530564', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3006', '116', 'Ciudad Mendoza', '3530592', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3007', '116', 'Chocaman', '3530778', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3008', '116', 'Chinampa de Gorostiza', '3530834', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3009', '116', 'Chinameca', '3530836', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3010', '116', 'Chicontepec', '3530926', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3011', '116', 'Chacaltianguis', '3531258', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3012', '116', 'Cerro Azul', '3531321', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3013', '116', 'Cazones', '3531391', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3014', '116', 'Catemaco', '3531416', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3015', '116', 'Castillo de Teayo', '3531434', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3016', '116', 'Carlos A. Carrillo', '3531556', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3017', '116', 'Boca del Rio', '3532193', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3018', '116', 'Boca del Monte', '3532197', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3019', '116', 'Benito Juarez', '3532276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3020', '116', 'Banderilla', '3532414', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3021', '116', 'Atzacan', '3532565', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3022', '116', 'Anton Lizardo', '3532821', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3023', '116', 'Angel R. Cabada', '3532852', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3024', '116', 'Anahuac', '3532870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3025', '116', 'Amatlan de los Reyes', '3532909', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3026', '116', 'Alvarado', '3532964', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3027', '116', 'Altotonga', '3532969', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3028', '116', 'Alto Lucero', '3532975', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3029', '116', 'Allende', '3533056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3030', '116', 'Alamo', '3533107', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3031', '116', 'Agua Dulce', '3533268', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3032', '116', 'Agua Dulce', '3533269', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3033', '116', 'Acultzingo', '3533376', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3034', '116', 'Actopan', '3533390', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3035', '116', 'Acayucan', '3533426', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3036', '116', 'Paraje Nuevo', '3823818', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3037', '116', 'Coacotla', '3824081', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3038', '116', 'Mecatlan', '3824674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3039', '116', 'Juan Rodriguez Clara', '3825174', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3040', '117', 'Valladolid', '3514876', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3041', '117', 'Uman', '3514929', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3042', '117', 'Tzucacab', '3514961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3043', '117', 'Tunkas', '3515026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3044', '117', 'Tizimin', '3515504', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3045', '117', 'Tixpehual', '3515512', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3046', '117', 'Tixkokob', '3515521', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3047', '117', 'Timucuy', '3515567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3048', '117', 'Ticul', '3515665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3049', '117', 'Tetiz', '3515744', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3050', '117', 'Temozon', '3516022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3051', '117', 'Temax', '3516048', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3052', '117', 'Telchac', '3516066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3053', '117', 'Tekit', '3516072', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3054', '117', 'Tekax de Alvaro Obregon', '3516076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3055', '117', 'Tekanto', '3516078', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3056', '117', 'Tecoh', '3516168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3057', '117', 'Teabo', '3516212', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3058', '117', 'Tahmek', '3516425', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3059', '117', 'Sucila', '3516488', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3060', '117', 'Sotuta', '3516515', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3061', '117', 'Seye', '3516683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3062', '117', 'Santa Elena', '3517498', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3063', '117', 'Sacalum', '3520120', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3064', '117', 'Rio Lagartos', '3520249', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3065', '117', 'Progreso', '3521108', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3066', '117', 'Piste', '3521411', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3067', '117', 'Peto', '3521596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3068', '117', 'Panaba', '3521972', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3069', '117', 'Oxkutzcab', '3522251', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3070', '117', 'Opichen', '3522328', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3071', '117', 'Muna', '3522886', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3072', '117', 'Motul de Felipe Carrillo Puerto', '3522924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3073', '117', 'Merida', '3523349', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3074', '117', 'Maxcanu', '3523436', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3075', '117', 'Mani', '3523619', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3076', '117', 'Mama', '3523663', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3077', '117', 'Kinchil', '3526284', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3078', '117', 'Kantunil', '3526301', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3079', '117', 'Kanasin', '3526323', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3080', '117', 'Izamal', '3526662', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3081', '117', 'Ixil', '3526711', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3082', '117', 'Idzincab', '3526816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3083', '117', 'Hunucma', '3526838', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3084', '117', 'Huhi', '3526924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3085', '117', 'Homun', '3527080', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3086', '117', 'Hoctun', '3527092', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3087', '117', 'Hocaba', '3527094', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3088', '117', 'Halacho', '3527164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3089', '117', 'Espita', '3527720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3090', '117', 'Dzitas', '3529652', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3091', '117', 'Dzilam Gonzalez', '3529654', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3092', '117', 'Dzidzantun', '3529660', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3093', '117', 'Dzemul', '3529669', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3094', '117', 'Dzan', '3529672', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3095', '117', 'Cuzama', '3529863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3096', '117', 'Conkal', '3530295', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3097', '117', 'Chumayel', '3530718', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3098', '117', 'Cholul', '3530759', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3099', '117', 'Chochola', '3530775', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3100', '117', 'Chicxulub', '3530916', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3101', '117', 'Chichimila', '3530948', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3102', '117', 'Chichen-Itza', '3530978', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3103', '117', 'Chemax', '3531042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3104', '117', 'Cenotillo', '3531362', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3105', '117', 'Celestun', '3531368', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3106', '117', 'Caucel', '3531406', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3107', '117', 'Cansahcab', '3531632', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3108', '117', 'Cacalchen', '3531892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3109', '117', 'Buctzotz', '3532089', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3110', '117', 'Baca', '3532467', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3111', '117', 'Akil', '3533117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3112', '117', 'Acanceh', '3533472', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3113', '118', 'General Panfilo Natera', '3972429', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3114', '118', 'General Enrique Estrada', '3972702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3115', '118', 'Zacatecas', '3979844', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3116', '118', 'Villanueva', '3980140', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3117', '118', 'Villa Hidalgo', '3980167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3118', '118', 'Villa Gonzalez Ortega', '3980175', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3119', '118', 'Villa Garcia', '3980177', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3120', '118', 'Villa de Cos', '3980192', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3121', '118', 'Valparaiso', '3980586', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3122', '118', 'Trancoso', '3981145', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3123', '118', 'Teul de Gonzalez Ortega', '3981725', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3124', '118', 'Tepechitlan', '3981981', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3125', '118', 'Tacualeche', '3982668', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3126', '118', 'Tabasco', '3982729', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3127', '118', 'Sombrerete', '3982887', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3128', '118', 'San Pedro Piedra Gorda', '3985008', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3129', '118', 'Sanchez Roman', '3987402', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3130', '118', 'Sain Alto', '3988251', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3131', '118', 'Rio Grande', '3988594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3132', '118', 'Pozo Gamboa', '3991930', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3133', '118', 'Plateros', '3992327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3134', '118', 'Pinos', '3992485', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3135', '118', 'Nochistlan', '3994912', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3136', '118', 'Nieves', '3994939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3137', '118', 'Morelos', '3995398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3138', '118', 'Monte Escobedo', '3995490', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3139', '118', 'Miguel Auza', '3995943', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3140', '118', 'Luis Moya', '3997017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3141', '118', 'Loreto', '3998291', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3142', '118', 'Juchipila', '4003739', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3143', '118', 'Juan Aldama', '4003804', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3144', '118', 'Jerez de Garcia Salinas', '4004024', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3145', '118', 'Jalpa', '4004148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3146', '118', 'Hacienda Toribio', '4004949', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3147', '118', 'Guadalupe', '4005509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3148', '118', 'Fresnillo de Gonzalez Echeverria', '4006163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3149', '118', 'Concepcion del Oro', '4013039', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3150', '118', 'Chalchihuites', '4014603', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3151', '118', 'Canitas de Felipe Pescador', '4015633', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3152', '118', 'Calera Victor Rosales', '4016132', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3153', '118', 'Banon', '4017546', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3154', '118', 'Apozol', '4018380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3155', '119', 'Guabito', '3708989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3156', '119', 'Cusapin', '3711694', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3157', '119', 'Chiriqui Grande', '3712401', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3158', '119', 'Changuinola', '3712560', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3159', '119', 'Bocas del Toro', '3713959', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3160', '119', 'Isla Bastimentos', '3714260', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3161', '119', 'Barranco', '3714336', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3162', '119', 'Almirante', '3714896', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3163', '120', 'Volcan', '3700017', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3164', '120', 'Tijera', '3700620', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3165', '120', 'Sortova', '3700871', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3166', '120', 'Siogui Arriba', '3700931', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3167', '120', 'Siogui Abajo', '3700933', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3168', '120', 'Santo Domingo', '3701101', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3169', '120', 'Santa Marta', '3701163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3170', '120', 'San Felix', '3701491', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3171', '120', 'San Andres', '3701578', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3172', '120', 'Rio Sereno', '3701810', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3173', '120', 'Quebrada Canoa', '3702269', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3174', '120', 'Punta de Burica', '3702342', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3175', '120', 'Puerto Armuelles', '3702431', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3176', '120', 'Pueblo Viejo', '3702448', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3177', '120', 'Pueblo Nuevo', '3702464', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3178', '120', 'Progreso', '3702509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3179', '120', 'Potrerillos Arriba', '3702548', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3180', '120', 'Potrerillos Abajo', '3702550', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3181', '120', 'Plaza de Caisan', '3702637', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3182', '120', 'Pedregal', '3703229', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3183', '120', 'Palmira', '3703505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3184', '120', 'Monte Lirio', '3704138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3185', '120', 'Mata del Nance', '3704460', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3186', '120', 'Los Anastacios', '3705549', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3187', '120', 'Los Algarrobos', '3705562', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3188', '120', 'La Victoria', '3705989', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3189', '120', 'Las Lomas', '3706410', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3190', '120', 'La Esperanza', '3707758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3191', '120', 'La Concepcion', '3707899', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3192', '120', 'Guarumal', '3708892', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3193', '120', 'Gualaca', '3708948', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3194', '120', 'Gomez', '3709228', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3195', '120', 'Finca Corredor', '3709561', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3196', '120', 'Finca Blanco Numero Uno', '3709569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3197', '120', 'El Quiteno', '3710066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3198', '120', 'Dolega', '3711618', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3199', '120', 'Divala', '3711631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3200', '120', 'David', '3711668', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3201', '120', 'Chiriqui', '3712419', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3202', '120', 'Cerro Punta', '3712636', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3203', '120', 'Bugaba', '3713667', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3204', '120', 'Boquete', '3713860', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3205', '120', 'Boqueron', '3713873', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3206', '120', 'Aserrio de Gariche', '3714611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3207', '120', 'Alanje', '3714939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3208', '121', 'Vista Hermosa', '3700033', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3209', '121', 'Rio Hato', '3701861', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3210', '121', 'Rio Grande', '3701868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3211', '121', 'Pocri', '3702631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3212', '121', 'Penonome', '3703068', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3213', '121', 'Nata', '3703938', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3214', '121', 'Llano Marin', '3705691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3215', '121', 'Las Lomas', '3706409', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3216', '121', 'La Pintada', '3706931', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3217', '121', 'La Loma', '3707311', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3218', '121', 'Juan Diaz', '3708307', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3219', '121', 'El Roble', '3710026', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3220', '121', 'El Entradero', '3710910', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3221', '121', 'El Cristo', '3710961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3222', '121', 'El Cortezo', '3710978', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3223', '121', 'El Cope', '3711009', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3224', '121', 'El Coco', '3711059', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3225', '121', 'El Cano', '3711240', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3226', '121', 'Cocle', '3712164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3227', '121', 'Churuquita Grande', '3712280', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3228', '121', 'Churuquita Chiquita', '3712281', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3229', '121', 'Chigore', '3712462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3230', '121', 'Capellania', '3713051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3231', '121', 'Anton', '3714710', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3232', '121', 'Alto de la Estancia', '3714849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3233', '121', 'Aguadulce', '3715042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3234', '122', 'Sabanitas', '3701682', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3235', '122', 'Rio Rita', '3701816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3236', '122', 'Rio Gatun', '3701870', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3237', '122', 'Rio Duque', '3701874', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3238', '122', 'Rio Alejandro', '3701914', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3239', '122', 'Quebrada Bonita Adentro', '3702276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3240', '122', 'Puerto Pilon', '3702384', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3241', '122', 'Puerto Escondido', '3702412', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3242', '122', 'Portobelo', '3702577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3243', '122', 'Palmas Bellas', '3703523', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3244', '122', 'Nuevo Vigia', '3703818', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3245', '122', 'Nuevo San Juan', '3703820', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3246', '122', 'Maria Chiquita', '3704547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3247', '122', 'Margarita', '3704571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3248', '122', 'Escobal', '3709742', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3249', '122', 'El Giral', '3710808', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3250', '122', 'Colon', '3712076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3251', '122', 'Cativa', '3712884', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3252', '122', 'Buena Vista', '3713715', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3253', '122', 'Santa Rita Arriba', '3764343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3254', '123', 'Yaviza', '3699980', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3255', '123', 'Santa Fe', '3701195', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3256', '123', 'Meteti', '3704327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3257', '123', 'La Palma', '3707058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3258', '123', 'Jaque', '3708432', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3259', '123', 'Garachine', '3709361', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3260', '124', 'Santa Maria', '3701174', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3261', '124', 'Pese', '3703011', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3262', '124', 'Parita', '3703354', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3263', '124', 'Ocu', '3703786', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3264', '124', 'Las Minas', '3706347', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3265', '124', 'El Rincon', '3710040', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3266', '124', 'Chitre', '3712384', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3267', '124', 'Boca de Parita', '3714000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3268', '125', 'Tonosi', '3700538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3269', '125', 'Santo Domingo', '3701103', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3270', '125', 'Pedasi', '3703239', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3271', '125', 'Macaracas', '3704874', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3272', '125', 'Los Santos', '3704964', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3273', '125', 'Llano Largo', '3705710', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3274', '125', 'Llano de Piedra', '3705743', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3275', '125', 'La Tiza', '3706091', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3276', '125', 'Las Tablas', '3706208', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3277', '125', 'La Palma', '3707063', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3278', '125', 'La Espigadilla', '3707752', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3279', '125', 'Guarare', '3708911', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3280', '125', 'El Ejido', '3710923', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3281', '125', 'Bella Vista', '3714176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3282', '125', 'Agua Buena', '3715111', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3283', '126', 'Vista Alegre', '3700038', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3284', '126', 'Villa Rosario', '3700070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3285', '126', 'Villa Carmen', '3700080', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3286', '126', 'Veracruz', '3700164', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3287', '126', 'Tocumen', '3700563', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3288', '126', 'San Vicente de Bique', '3701088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3289', '126', 'Santa Clara', '3701239', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3290', '126', 'San Miguelito', '3701329', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3291', '126', 'Puerto Caimito', '3702427', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3292', '126', 'Potrero Grande', '3702538', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3293', '126', 'Paso Blanco', '3703327', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3294', '126', 'Paraiso', '3703373', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3295', '126', 'Panama', '3703443', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3296', '126', 'Pacora', '3703647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3297', '126', 'Nuevo Emperador', '3703828', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3298', '126', 'Nuevo Arraijan', '3703833', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3299', '126', 'Nueva Gorgona', '3703839', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3300', '126', 'Los Lotes', '3705229', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3301', '126', 'Lidice', '3705894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3302', '126', 'Las Cumbres', '3706567', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3303', '126', 'Las Colinas', '3706590', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3304', '126', 'La Mitra', '3707150', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3305', '126', 'La Mesa', '3707220', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3306', '126', 'La Herradura', '3707568', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3307', '126', 'La Chorrera', '3707961', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3308', '126', 'La Cabima', '3708066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3309', '126', 'Guadalupe', '3708954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3310', '126', 'El Progreso', '3710087', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3311', '126', 'El Espino', '3710875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3312', '126', 'El Coco', '3711056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3313', '126', 'Chilibre', '3712455', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3314', '126', 'Chepo', '3712505', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3315', '126', 'Chame', '3712579', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3316', '126', 'Cerro Cama', '3712765', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3317', '126', 'Cerro Azul', '3712786', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3318', '126', 'Capira', '3713047', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3319', '126', 'Canita', '3713131', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3320', '126', 'Calzada Larga', '3713381', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3321', '126', 'Caimitillo', '3713499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3322', '126', 'Cabra', '3713588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3323', '126', 'Bejuco', '3714201', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3324', '126', 'Arraijan', '3714637', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3325', '126', 'Ancon', '3714734', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3326', '126', 'Alto del Espino', '3714830', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3327', '126', 'Alcaldediaz', '3714932', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3328', '127', 'Ustupo', '3700269', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3329', '127', 'Tubuala', '3700393', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3330', '127', 'San Ignacio de Tupile', '3701466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3331', '127', 'Playon Chico', '3702647', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3332', '127', 'Nargana', '3703946', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3333', '127', 'Mulatupo Sasardi', '3704029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3334', '127', 'El Porvenir', '3710114', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3335', '127', 'Carti Suitupo', '3712951', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3336', '127', 'Ailigandi', '3714956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3337', '127', 'Achutupo Numero Dos', '3715156', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3338', '128', 'Sona', '3700888', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3339', '128', 'Santiago de Veraguas', '3701117', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3340', '128', 'San Francisco', '3701484', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3341', '128', 'Rio de Jesus', '3701882', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3342', '128', 'Montijo', '3704123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3343', '128', 'Los Boquerones', '3705493', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3344', '128', 'Los Algarrobos', '3705563', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3345', '128', 'Las Palmas', '3706292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3346', '128', 'La Pena', '3706974', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3347', '128', 'La Mesa', '3707227', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3348', '128', 'La Colorada', '3707921', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3349', '128', 'El Espino de Santa Rosa', '3710864', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3350', '128', 'Canazas', '3713196', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3351', '128', 'Atalaya', '3714598', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3352', '131', 'La Peca', '3695675', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3353', '131', 'Chachapoyas', '3698540', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3354', '131', 'Cajaruro', '3699078', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3355', '131', 'Bagua Grande', '3699484', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3356', '132', 'Yungay', '3690673', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3357', '132', 'Yauya', '3690733', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3358', '132', 'Puerto Santa', '3693191', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3359', '132', 'Pomabamba', '3693468', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3360', '132', 'Huaraz', '3696378', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3361', '132', 'Coishco', '3697990', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3362', '132', 'Chimbote', '3698304', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3363', '132', 'Carhuaz', '3698814', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3364', '132', 'Caras', '3698841', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3365', '132', 'Huarmey', '3939168', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3366', '133', 'Talavera', '3928043', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3367', '133', 'San Jeronimo', '3929607', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3368', '133', 'Andahuaylas', '3947740', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3369', '133', 'Abancay', '3948642', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3370', '133', 'San Pedro De Cachora', '7535952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3371', '134', 'Yura', '3925467', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3372', '134', 'Vizcachane', '3925955', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3373', '134', 'Punta de Bombon', '3931255', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3374', '134', 'Pucara', '3931656', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3375', '134', 'Orcopampa', '3933986', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3376', '134', 'Mollendo', '3934707', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3377', '134', 'Lluta', '3936088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3378', '134', 'Jatun Orcochiri', '3937765', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3379', '134', 'Cocachacra', '3942957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3380', '134', 'Chivay', '3943626', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3381', '134', 'Camana', '3945985', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3382', '134', 'Arequipa', '3947322', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3383', '134', 'Acari', '3948613', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3384', '134', 'Huarancante', '3951506', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3385', '134', 'Ccolo', '3951550', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3386', '134', 'Huarichancara', '3951691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3387', '134', 'Llongasora', '3951757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3388', '134', 'Jayune', '3951767', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3389', '135', 'Tambo', '3927995', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3390', '135', 'San Miguel', '3929403', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3391', '135', 'Puquio', '3931223', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3392', '135', 'Huanta', '3939386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3393', '135', 'Coracora', '3942259', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3394', '135', 'Ayna', '3946962', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3395', '135', 'Ayacucho', '3947019', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3396', '136', 'San Ignacio', '3692529', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3397', '136', 'Jaen', '3696150', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3398', '136', 'Chota', '3698141', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3399', '136', 'Celendin', '3698608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3400', '136', 'Cascas', '3698705', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3401', '136', 'Cajamarca', '3699088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3402', '136', 'Cajabamba', '3699095', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3403', '136', 'Bellavista', '3699366', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3404', '136', 'Bambamarca', '3699456', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3405', '137', 'Callao', '3946083', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3406', '138', 'Yanaoca', '3925749', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3407', '138', 'Urubamba', '3926438', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3408', '138', 'Urcos', '3926462', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3409', '138', 'Tungasuca', '3926776', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3410', '138', 'Tinta', '3927441', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3411', '138', 'Sicuani', '3928679', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3412', '138', 'Santa Ana', '3929295', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3413', '138', 'San Pablo', '3929375', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3414', '138', 'Pisac', '3932166', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3415', '138', 'Pangoa', '3933104', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3416', '138', 'Pampamarca', '3933218', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3417', '138', 'Oropesa', '3933956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3418', '138', 'Ollantaytambo', '3934055', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3419', '138', 'Marangani', '3935379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3420', '138', 'Layo', '3936541', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3421', '138', 'Langui', '3936963', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3422', '138', 'Cusco', '3941584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3423', '138', 'Combapata', '3942593', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3424', '138', 'Checca', '3944134', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3425', '138', 'Checacupe', '3944138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3426', '138', 'Calca', '3946177', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3427', '138', 'Anta', '3947634', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3428', '138', 'Mosoc Llacta', '3948689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3429', '138', 'Santo Tomas', '3948917', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3430', '138', 'Callanca', '3952849', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3431', '138', 'Cullcuyre', '3952867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3432', '138', 'Cahuanuyo', '3953301', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3433', '138', 'Ccaquiracunca', '3953343', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3434', '138', 'Chignayhua', '3953385', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3435', '138', 'Ccuntuma', '3953594', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3436', '138', 'Lima Pampa', '3953687', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3437', '138', 'Jayobamba', '3953711', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3438', '138', 'Queromarca', '3953732', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3439', '138', 'Qquea', '3953762', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3440', '138', 'Conchopata', '3953918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3441', '138', 'Mosoc Cancha', '3954288', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3442', '138', 'Huayna Alcalde', '3954291', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3443', '139', 'Pampas', '3933185', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3444', '139', 'Huancavelica', '3939470', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3445', '140', 'Tingo Maria', '3691348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3446', '140', 'Llata', '3695320', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3447', '140', 'La Union', '3695465', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3448', '140', 'Huanuco', '3696417', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3449', '140', 'Yanacancha', '3925863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3450', '140', 'San Miguel de Cauri', '3929389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3451', '140', 'Ambo', '3947956', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3452', '141', 'Villa Tupac Amaru', '3926119', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3453', '141', 'Subtanjalla', '3928365', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3454', '141', 'Santiago', '3929051', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3455', '141', 'San Juan Bautista', '3929493', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3456', '141', 'San Clemente', '3929768', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3457', '141', 'Rio Grande', '3930348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3458', '141', 'Pisco', '3932145', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3459', '141', 'Paracas', '3933058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3460', '141', 'Palpa', '3933345', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3461', '141', 'Nazca', '3934356', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3462', '141', 'Minas de Marcona', '3935288', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3463', '141', 'Los Aquijes', '3935969', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3464', '141', 'Ica', '3938527', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3465', '141', 'Chincha Alta', '3943789', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3466', '142', 'Tarma', '3927758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3467', '142', 'Sicaya', '3928691', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3468', '142', 'Satipo', '3928924', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3469', '142', 'San Ramon', '3929314', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3470', '142', 'San Pedro de Cajas', '3929335', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3471', '142', 'San Jeronimo', '3929611', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3472', '142', 'San Agustin', '3929888', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3473', '142', 'Pilcomay', '3932282', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3474', '142', 'Perene', '3932502', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3475', '142', 'Orcotuna', '3933981', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3476', '142', 'Morococha', '3934586', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3477', '142', 'Mazamari', '3935102', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3478', '142', 'La Oroya', '3936952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3479', '142', 'Junin', '3937486', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3480', '142', 'Jauja', '3937733', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3481', '142', 'Huayucachi', '3938819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3482', '142', 'Huasahuasi', '3939123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3483', '142', 'Huancayo', '3939459', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3484', '142', 'Concepcion', '3942548', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3485', '142', 'Chupaca', '3943186', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3486', '142', 'Carhuamayo', '3945466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3487', '142', 'Acolla', '3948448', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3488', '143', 'Viru', '3690875', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3489', '143', 'Trujillo', '3691175', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3490', '143', 'Santiago de Chuco', '3692072', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3491', '143', 'Santiago de Cao', '3692073', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3492', '143', 'San Pedro de Lloc', '3692310', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3493', '143', 'Salaverry', '3692747', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3494', '143', 'Quiruvilca', '3692994', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3495', '143', 'Pueblo Nuevo', '3693302', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3496', '143', 'Paijan', '3694119', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3497', '143', 'Pacasmayo', '3694178', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3498', '143', 'Pacanga', '3694183', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3499', '143', 'Otuzco', '3694212', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3500', '143', 'Moche', '3694725', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3501', '143', 'Laredo', '3695617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3502', '143', 'Huamachuco', '3696509', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3503', '143', 'Guadalupe', '3696847', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3504', '143', 'Chocope', '3698194', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3505', '143', 'Chicama', '3698359', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3506', '143', 'Chepen', '3698390', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3507', '143', 'Ascope', '3699544', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3508', '144', 'Tucume', '3691161', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3509', '144', 'Santa Rosa', '3692116', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3510', '144', 'San Jose', '3692482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3511', '144', 'Zana', '3692667', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3512', '144', 'Reque', '3692900', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3513', '144', 'Pueblo Nuevo', '3693305', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3514', '144', 'Pimentel', '3693584', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3515', '144', 'Picsi', '3693645', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3516', '144', 'Oyotun', '3694197', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3517', '144', 'Olmos', '3694256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3518', '144', 'Motupe', '3694569', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3519', '144', 'Morrope', '3694586', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3520', '144', 'Monsefu', '3694666', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3521', '144', 'Mochumi', '3694720', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3522', '144', 'Lambayeque', '3695754', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3523', '144', 'Jayanca', '3696104', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3524', '144', 'Ferrenafe', '3697033', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3525', '144', 'Eten', '3697083', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3526', '144', 'Chongoyape', '3698176', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3527', '144', 'Chiclayo', '3698350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3528', '145', 'Vegueta', '3926328', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3529', '145', 'Supe', '3928274', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3530', '145', 'Sayan', '3928867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3531', '145', 'San Vicente de Canete', '3928993', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3532', '145', 'Santa Maria', '3929172', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3533', '145', 'Santa Eulalia', '3929213', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3534', '145', 'San Luis', '3929438', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3535', '145', 'San Isidro', '3929631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3536', '145', 'San Bartolo', '3929805', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3537', '145', 'Ricardo Palma', '3930382', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3538', '145', 'Quilmana', '3930817', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3539', '145', 'Puerto Supe', '3931453', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3540', '145', 'Pativilca', '3932687', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3541', '145', 'Paramonga', '3933024', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3542', '145', 'Oyon', '3933867', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3543', '145', 'Nuevo Imperial', '3934239', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3544', '145', 'Nicolas de Pierola', '3934290', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3545', '145', 'Matucana', '3935155', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3546', '145', 'Mala', '3935572', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3547', '145', 'Lima', '3936456', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3548', '145', 'Independencia', '3938324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3549', '145', 'Imperial', '3938396', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3550', '145', 'Huaura', '3939023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3551', '145', 'Huaral', '3939285', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3552', '145', 'Hualmay', '3939761', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3553', '145', 'Huacho', '3940002', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3554', '145', 'Chosica', '3943423', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3555', '145', 'Chilca', '3943957', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3556', '145', 'Chancay', '3944399', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3557', '145', 'Caleta de Carquin', '3946147', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3558', '145', 'Barranca', '3946820', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3559', '146', 'Yurimaguas', '3690654', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3560', '146', 'Saquena', '3692020', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3561', '146', 'Ramon Castilla', '3692953', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3562', '146', 'Lagunas', '3695844', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3563', '146', 'Iquitos', '3696183', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3564', '146', 'Contamana', '3697838', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3565', '146', 'Barranca', '3699427', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3566', '147', 'Tambopata', '3927942', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3567', '147', 'Puerto Maldonado', '3931470', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3568', '147', 'Iberia', '3938531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3569', '148', 'Torata', '3927158', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3570', '148', 'Pacocha', '3933659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3571', '148', 'Moquegua', '3934608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3572', '148', 'Ilo', '3938415', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3573', '149', 'Yanahuanca', '3925809', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3574', '149', 'Villa Rica', '3926120', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3575', '149', 'Tinyahuarco', '3927420', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3576', '149', 'Oxapampa', '3933874', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3577', '149', 'Chaupimarca', '3944179', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3578', '149', 'Cerro de Pasco', '3944797', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3579', '150', 'Vice', '3690935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3580', '150', 'Tambo Grande', '3691530', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3581', '150', 'Talara', '3691582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3582', '150', 'Sullana', '3691674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3583', '150', 'Sechura', '3691954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3584', '150', 'Salitral', '3692727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3585', '150', 'Salinera Colan', '3692729', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3586', '150', 'Querecotillo', '3693057', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3587', '150', 'Piura', '3693528', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3588', '150', 'Paita', '3694112', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3589', '150', 'Morropon', '3694582', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3590', '150', 'Marcavelica', '3694939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3591', '150', 'Mancora', '3695000', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3592', '150', 'La Union', '3695466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3593', '150', 'Las Lomas', '3695552', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3594', '150', 'La Huaca', '3695829', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3595', '150', 'Huancabamba', '3696466', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3596', '150', 'El Alto', '3697441', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3597', '150', 'Chulucanas', '3698105', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3598', '150', 'Catacaos', '3698658', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3599', '150', 'Buenos Aires', '3699223', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3600', '150', 'Bernal', '3699350', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3601', '150', 'Ayabaca', '3699502', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3602', '150', 'La Breita', '3814568', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3603', '151', 'Yunguyo', '3925476', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3604', '151', 'Taquile', '3927803', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3605', '151', 'Santa Lucia', '3929188', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3606', '151', 'Putina', '3931137', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3607', '151', 'Puno', '3931276', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3608', '151', 'Nunoa', '3934233', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3609', '151', 'Macusani', '3935624', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3610', '151', 'Lampa', '3936996', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3611', '151', 'Juliaca', '3937513', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3612', '151', 'Juli', '3937516', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3613', '151', 'Ilave', '3938451', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3614', '151', 'Hacienda Huancane', '3939531', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3615', '151', 'Desaguadero', '3941492', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3616', '151', 'Azangaro', '3946937', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3617', '151', 'Ayaviri', '3946985', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3618', '151', 'Atuncolla', '3947110', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3619', '152', 'Uchiza', '3691094', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3620', '152', 'Tocache Nuevo', '3691324', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3621', '152', 'Tabalosos', '3691638', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3622', '152', 'Soritor', '3691712', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3623', '152', 'Saposoa', '3692029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3624', '152', 'San Jose de Sisa', '3692464', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3625', '152', 'Rioja', '3692863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3626', '152', 'Picota', '3693646', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3627', '152', 'Moyobamba', '3694564', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3628', '152', 'Lamas', '3695757', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3629', '152', 'Juanjui', '3696057', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3630', '152', 'Jepelacio', '3696096', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3631', '152', 'Huicungo', '3696267', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3632', '152', 'Chazuta', '3698414', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3633', '152', 'Bellavista', '3699364', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3634', '153', 'Totoral', '3927023', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3635', '153', 'Tarata', '3927774', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3636', '153', 'Tacna', '3928128', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3637', '153', 'Quilahuani', '3930871', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3638', '153', 'Pujocucho', '3931427', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3639', '153', 'Ilabaya', '3938455', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3640', '153', 'Chipispaya', '3943699', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3641', '153', 'Candarave', '3945808', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3642', '153', 'Chuquitira', '3952372', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3643', '154', 'Zorritos', '3690608', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3644', '154', 'Tumbes', '3691148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3645', '154', 'Aguas Verdes', '3699832', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3646', '154', 'Papayal', '3814639', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3647', '154', 'Zarumilla', '3818398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3648', '155', 'Pucallpa', '3693345', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3649', '155', 'Campoverde', '3733380', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3650', '157', 'Santa Rita', '3436968', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3651', '157', 'San Alberto', '3437136', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3652', '157', 'Presidente Franco', '3437444', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3653', '157', 'Naranjal', '3437689', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3654', '157', 'Los Cedrales', '3437815', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3655', '157', 'Itaquyry', '3437920', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3656', '157', 'Doctor Juan Leon Mallorquin', '3438754', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3657', '157', 'Colonia Yguazu', '3438872', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3658', '157', 'Colonia Minga Pora', '3438977', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3659', '158', 'Capitan Bado', '3439189', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3660', '158', 'Bella Vista', '3439353', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3661', '159', 'Yhu', '3436595', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3662', '159', 'San Jose', '3437074', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3663', '159', 'San Joaquin', '3437086', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3664', '159', 'Repatriacion', '3437197', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3665', '159', 'Mbutuy', '3437748', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3666', '159', 'Doctor Juan Manuel Frutos', '3438753', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3667', '159', 'Doctor Cecilio Baez', '3438755', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3668', '159', 'Coronel Oviedo', '3438819', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3669', '159', 'Colonia General Alfredo Stroessner', '3439032', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3670', '159', 'Carayao', '3439163', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3671', '159', 'Caaguazu', '3439317', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3672', '160', 'Yuty', '3436547', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3673', '160', 'Yegros', '3436617', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3674', '160', 'San Juan Nepomuceno', '3437059', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3675', '160', 'General Higinio Morinigo', '3438066', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3676', '160', 'Buena Vista', '3439325', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3677', '160', 'Abai', '3439483', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3678', '161', 'Ypacarai', '3436585', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3679', '161', 'Villa Elisa', '3436728', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3680', '161', 'San Lorenzo', '3437056', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3681', '161', 'San Antonio', '3437127', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3682', '161', 'Nueva Italia', '3437652', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3683', '161', 'Nemby', '3437665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3684', '161', 'Limpio', '3437842', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3685', '161', 'Lambare', '3437863', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3686', '161', 'Itaugua', '3437918', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3687', '161', 'Ita', '3437954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3688', '161', 'Guarambare', '3438043', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3689', '161', 'Fernando de la Mora', '3438115', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3690', '161', 'Colonia Mariano Roque Alonso', '3438995', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3691', '161', 'Capiata', '3439214', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3692', '161', 'Aregua', '3439403', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3693', '162', 'Concepcion', '3438834', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3694', '162', 'Belen', '3439355', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3695', '162', 'Horqueta', '3480780', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3696', '163', 'Tobati', '3436812', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3697', '163', 'Santa Elena', '3436987', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3698', '163', 'San Bernardino', '3437120', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3699', '163', 'Piribebuy', '3437495', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3700', '163', 'Itacurubi de la Cordillera', '3437936', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3701', '163', 'Isla Pucu', '3437962', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3702', '163', 'Eusebio Ayala', '3438123', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3703', '163', 'Emboscada', '3438738', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3704', '163', 'Caraguatay', '3439175', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3705', '163', 'Caacupe', '3439320', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3706', '163', 'Atyra', '3439386', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3707', '163', 'Arroyos y Esteros', '3439395', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3708', '163', 'Altos', '3439439', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3709', '164', 'Villarrica', '3436714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3710', '164', 'Natalicio Talavera', '3437682', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3711', '164', 'Mbocayaty', '3437763', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3712', '164', 'Iturbe', '3437909', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3713', '164', 'Itape', '3437927', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3714', '164', 'Independencia', '3437982', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3715', '164', 'Coronel Martinez', '3438822', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3716', '164', 'Colonia Mauricio Jose Troche', '3438991', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3717', '165', 'Trinidad', '3436776', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3718', '165', 'San Pedro del Parana', '3437022', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3719', '165', 'San Juan del Parana', '3437062', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3720', '165', 'San Cosme y Damian', '3437107', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3721', '165', 'Puerto Mayor Otano', '3437370', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3722', '165', 'Pirapo', '3437514', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3723', '165', 'Obligado', '3437637', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3724', '165', 'Natalio', '3437681', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3725', '165', 'Jesus', '3437898', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3726', '165', 'Hohenau', '3437997', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3727', '165', 'General Delgado', '3438076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3728', '165', 'General Artigas', '3438080', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3729', '165', 'Fram', '3438106', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3730', '165', 'Encarnacion', '3438735', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3731', '165', 'Edelira', '3438743', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3732', '165', 'Carmen del Parana', '3439156', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3733', '165', 'Carlos Antonio Lopez', '3439159', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3734', '165', 'Capitan Miranda', '3439184', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3735', '165', 'Bella Vista', '3439352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3736', '165', 'Arquitecto Tomas Romero Pereira', '3439402', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3737', '166', 'Villa Florida', '3436727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3738', '166', 'Santiago', '3436943', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3739', '166', 'Santa Rosa', '3436959', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3740', '166', 'Santa Maria', '3436977', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3741', '166', 'San Patricio', '3437029', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3742', '166', 'San Miguel', '3437042', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3743', '166', 'Ayolas', '3439378', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3744', '167', 'Pilar', '3437526', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3745', '167', 'General Jose Eduvigis Diaz', '3438064', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3746', '167', 'Cerrito', '3439133', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3747', '168', 'Ybycui', '3436642', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3748', '168', 'Yaguaron', '3436674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3749', '168', 'Sapucai', '3436927', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3750', '168', 'Quiindy', '3437215', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3751', '168', 'Pirayu', '3437499', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3752', '168', 'Paraguari', '3437600', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3753', '168', 'Mbuyapey', '3437744', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3754', '168', 'La Colmena', '3437868', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3755', '168', 'Carapegua', '3439167', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3756', '168', 'Caapucu', '3439304', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3757', '168', 'Acahay', '3439482', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3758', '169', 'Nanawa', '3437696', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3759', '169', 'Benjamin Aceval', '3439348', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3760', '170', 'Yataity del Norte', '3436655', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3761', '170', 'Union', '3436763', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3762', '170', 'Tacuati', '3436880', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3763', '170', 'San Pedro de Ycuamandiyu', '3437021', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3764', '170', 'Puerto Rosario', '3437342', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3765', '170', 'Nueva Germania', '3437653', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3766', '170', 'Itacurubi del Rosario', '3437935', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3767', '170', 'Guayaybi', '3438034', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3768', '170', 'General Elizardo Aquino', '3438070', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3769', '170', 'Capiibary', '3439208', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3770', '170', 'Antequera', '3439423', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3771', '171', 'Ygatimi', '3436616', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3772', '171', 'San Isidro de Curuguaty', '3437088', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3773', '171', 'Salto del Guaira', '3437148', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3774', '171', 'Las Palomas', '3437853', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3775', '171', 'Corpus Christi', '3438816', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3776', '171', 'Colonia Catuete', '3439062', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3777', '172', 'Asuncion', '3439389', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3778', '173', 'Capitan Pablo Lagerenza', '3867427', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3779', '174', 'Fuerte Olimpo', '3438102', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3780', '174', 'Colonia Menno', '3438981', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3781', '174', 'Filadelfia', '3867291', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3782', '174', 'Colonia Neuland', '3867411', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3783', '175', 'Tomas Gomensoro', '3439831', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3784', '175', 'Las Piedras', '3442058', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3785', '175', 'Bella Union', '3443631', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3786', '175', 'Baltasar Brum', '3443697', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3787', '175', 'Artigas', '3443758', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3788', '176', 'Toledo', '3439838', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3789', '176', 'Tala', '3440021', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3790', '176', 'Soca', '3440076', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3791', '176', 'Sauce', '3440379', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3792', '176', 'Santa Rosa', '3440554', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3793', '176', 'Santa Lucia', '3440571', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3794', '176', 'San Ramon', '3440596', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3795', '176', 'San Jacinto', '3440654', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3796', '176', 'San Bautista', '3440698', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3797', '176', 'San Antonio', '3440705', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3798', '176', 'Progreso', '3440963', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3799', '176', 'Paso de Carrasco', '3441292', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3800', '176', 'Pando', '3441354', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3801', '176', 'Montes', '3441577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3802', '176', 'Migues', '3441674', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3803', '176', 'Los Cerrillos', '3441954', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3804', '176', 'Las Toscas', '3442050', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3805', '176', 'Las Piedras', '3442057', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3806', '176', 'La Paz', '3442098', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3807', '176', 'La Floresta', '3442138', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3808', '176', 'Joaquin Suarez', '3442236', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3809', '176', 'Joanico', '3442238', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3810', '176', 'Empalme Olmos', '3442683', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3811', '176', 'Canelones', '3443413', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3812', '176', 'Atlantida', '3443737', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3813', '176', 'Aguas Corrientes', '3443928', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3814', '176', 'Colonia Nicolich', '3480820', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3815', '176', 'Barra de Carrasco', '3480822', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3816', '177', 'Rio Branco', '3440791', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3817', '177', 'Melo', '3441702', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3818', '177', 'Isidoro Noblia', '3442299', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3819', '177', 'Acegua', '3443952', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3820', '178', 'Tarariras', '3439902', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3821', '178', 'Rosario', '3440747', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3822', '178', 'Ombues de Lavalle', '3441442', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3823', '178', 'Nueva Palmira', '3441481', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3824', '178', 'Nueva Helvecia', '3441483', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3825', '178', 'Juan L. Lacaze', '3442206', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3826', '178', 'Florencio Sanchez', '3442597', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3827', '178', 'Colonia del Sacramento', '3443013', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3828', '178', 'Carmelo', '3443341', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3829', '179', 'Villa del Carmen', '3439598', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3830', '179', 'Sarandi del Yi', '3440400', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3831', '179', 'Santa Bernardina', '3440581', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3832', '179', 'Paso de los Toros', '3441273', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3833', '179', 'La Paloma', '3442106', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3834', '179', 'Durazno', '3442727', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3835', '179', 'Carlos Reyles', '3443342', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3836', '179', 'Blanquillo', '3443588', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3837', '180', 'Trinidad', '3439749', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3838', '181', 'Veinticinco de Mayo', '3439659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3839', '181', 'Veinticinco de Agosto', '3439661', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3840', '181', 'Sarandi Grande', '3440394', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3841', '181', 'Florida', '3442585', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3842', '181', 'Cerro Colorado', '3443183', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3843', '181', 'Casupa', '3443280', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3844', '181', 'Cardal', '3443356', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3845', '182', 'Solis de Mataojo', '3440063', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3846', '182', 'Minas', '3441665', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3847', '182', 'Mariscala', '3441803', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3848', '182', 'Jose Pedro Varela', '3442221', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3849', '182', 'Jose Batlle y Ordonez', '3442233', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3850', '183', 'San Carlos', '3440696', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3851', '183', 'Punta del Este', '3440939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3852', '183', 'Piriapolis', '3441074', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3853', '183', 'Pan de Azucar', '3441358', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3854', '183', 'Maldonado', '3441894', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3855', '183', 'Aigua', '3443909', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3856', '184', 'Santiago Vazquez', '3440541', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3857', '184', 'Montevideo', '3441575', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3858', '184', 'Pajas Blancas', '3480825', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3859', '185', 'San Felix', '3440684', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3860', '185', 'Quebracho', '3440925', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3861', '185', 'Porvenir', '3440985', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3862', '185', 'Piedras Coloradas', '3441114', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3863', '185', 'Paysandu', '3441243', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3864', '185', 'Guichon', '3442398', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3865', '186', 'Young', '3439525', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3866', '186', 'San Javier', '3440653', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3867', '186', 'Nuevo Berlin', '3441476', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3868', '186', 'Fray Bentos', '3442568', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3869', '187', 'Vichadero', '3439619', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3870', '187', 'Tranqueras', '3439787', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3871', '187', 'Rivera', '3440781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3872', '187', 'Minas de Corrales', '3441659', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3873', '188', 'Velazquez', '3439652', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3874', '188', 'Rocha', '3440777', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3875', '188', 'Lascano', '3442071', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3876', '188', 'La Paloma', '3442105', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3877', '188', 'Dieciocho de Julio', '3442766', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3878', '188', 'Chuy', '3443061', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3879', '188', 'Cebollati', '3443256', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3880', '188', 'Castillos', '3443289', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3881', '189', 'Salto', '3440714', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3882', '189', 'Constitucion', '3442939', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3883', '189', 'Belen', '3443644', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3884', '190', 'San Jose de Mayo', '3440639', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3885', '190', 'Rodriguez', '3440762', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3886', '190', 'Rafael Perazza', '3440879', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3887', '190', 'Libertad', '3441988', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3888', '190', 'Ecilda Paullier', '3442716', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3889', '190', 'Delta del Tigre', '3442778', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3890', '190', 'Puntas de Valdez', '3480812', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3891', '191', 'Soriano', '3440055', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3892', '191', 'Santa Catalina', '3440580', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3893', '191', 'Palmitas', '3441377', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3894', '191', 'Mercedes', '3441684', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3895', '191', 'Jose Enrique Rodo', '3442231', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3896', '191', 'Dolores', '3442750', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3897', '191', 'Cardona', '3443352', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3898', '192', 'Tacuarembo', '3440034', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3899', '192', 'Curtina', '3442803', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3900', '193', 'Villa Sara', '3439590', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3901', '193', 'Vergara', '3439622', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3902', '193', 'Tupambae', '3439725', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3903', '193', 'Treinta y Tres', '3439781', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `city` VALUES ('3904', '193', 'Santa Clara de Olimar', '3440577', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'Venezuela', 'VE', '0', '2015-08-06 15:16:56', '2015-08-26 17:22:22');
INSERT INTO `country` VALUES ('2', 'Mexico', 'MX', '1', '2015-08-26 17:21:14', '2015-08-28 10:27:21');
INSERT INTO `country` VALUES ('3', 'Colombia', 'CO', '0', '2015-08-26 17:21:45', '2016-05-27 09:07:07');
INSERT INTO `country` VALUES ('4', 'Peru', 'PE', '0', '2015-08-26 17:22:13', '2016-05-27 09:07:08');
INSERT INTO `country` VALUES ('5', 'Chile', 'CL', '0', '2015-08-26 17:22:50', '2016-05-27 09:07:08');
INSERT INTO `country` VALUES ('6', 'Costa Rica', 'CR', '0', '2015-08-26 17:23:44', '2016-05-27 09:07:08');
INSERT INTO `country` VALUES ('7', 'Panama', 'PA', '0', '2015-08-26 17:45:45', '2016-05-27 09:07:08');
INSERT INTO `country` VALUES ('8', 'Guatemala', 'GM', '0', '2015-08-26 17:46:11', '2016-05-27 09:07:09');
INSERT INTO `country` VALUES ('9', 'Uruguay', 'UY', '0', '2015-08-26 17:46:36', '2016-05-27 09:07:09');
INSERT INTO `country` VALUES ('10', 'Paraguay', 'PY', '0', '2015-08-26 17:46:57', '2016-05-27 09:07:09');
INSERT INTO `country` VALUES ('11', 'Ecuador', 'EC', '0', '2015-08-26 17:47:13', '2016-05-27 09:07:09');

-- ----------------------------
-- Table structure for deal
-- ----------------------------
DROP TABLE IF EXISTS `deal`;
CREATE TABLE `deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_usd` decimal(10,2) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `date_end` datetime DEFAULT NULL,
  `is_close_to_expired_notified` tinyint(1) NOT NULL DEFAULT '0',
  `deal_invoice_id` int(11) DEFAULT NULL,
  `deal_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E3FEC116C8975018` (`deal_invoice_id`),
  KEY `IDX_E3FEC11643745B1D` (`deal_user_id`),
  CONSTRAINT `FK_E3FEC11643745B1D` FOREIGN KEY (`deal_user_id`) REFERENCES `fos_user` (`id`),
  CONSTRAINT `FK_E3FEC116C8975018` FOREIGN KEY (`deal_invoice_id`) REFERENCES `deal_invoice` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal
-- ----------------------------
INSERT INTO `deal` VALUES ('38', '85000.00', 'WON_STATE', '2016-06-06 10:23:54', '2016-07-21 16:30:24', '0', '2017-01-31 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('39', '32000.00', 'WON_STATE', '2016-06-06 17:55:05', '2016-07-21 16:59:34', '0', '2016-11-23 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('40', '9.00', 'WON_STATE', '2016-06-08 11:35:39', '2016-07-21 17:29:55', '0', '2016-06-26 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('41', '3.00', 'WON_STATE', '2016-07-21 18:02:58', '2016-07-21 17:23:22', '0', '2016-07-23 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('42', '3.00', 'WON_STATE', '2016-07-21 18:11:46', '2016-07-21 17:59:29', '0', '2016-08-20 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('43', '3.00', 'APPROVED_STATE', '2016-07-21 18:22:17', '2016-08-01 16:37:43', '0', '2016-10-14 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('44', '138.00', 'REGISTERED_STATE', '2016-07-28 10:07:24', '2016-07-28 09:27:00', '0', '2016-12-30 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('45', '138.00', 'REGISTERED_STATE', '2016-07-28 11:18:42', '2016-07-28 10:38:19', '0', '2016-11-25 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('46', '138.00', 'REGISTERED_STATE', '2016-07-28 11:34:24', '2016-07-28 10:54:01', '0', '2016-10-14 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('47', '138.00', 'WON_STATE', '2016-08-01 17:23:17', '2016-09-05 11:17:42', '1', '2016-11-25 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('48', '1000000.00', 'REJECTED_STATE', '2016-08-04 11:43:15', '2016-08-04 15:33:53', '0', '2016-08-01 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('49', '0.00', 'CANCELED_STATE', '2016-08-04 11:49:32', '2016-08-04 15:40:39', '0', '2016-08-31 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('50', '3.00', 'WON_STATE', '2016-08-04 11:53:09', '2016-08-04 15:58:47', '1', '2016-08-25 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('51', '150.00', 'LOSS_STATE', '2016-08-04 11:56:15', '2016-08-04 15:44:06', '0', '2016-08-04 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('52', '125.00', 'WON_STATE', '2016-08-04 12:01:46', '2016-08-04 16:02:50', '1', '2016-08-20 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('53', '3.00', 'REGISTERED_STATE', '2016-08-12 14:57:10', '2016-08-12 14:16:46', '0', '2016-08-26 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('54', '3.00', 'WON_STATE', '2016-08-12 17:34:26', '2016-09-05 11:09:35', '1', '2016-08-31 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('55', '138.00', 'WON_STATE', '2016-08-15 10:19:33', '2016-08-15 09:51:14', '1', '2017-01-31 00:00:00', '0', null, null);
INSERT INTO `deal` VALUES ('56', null, 'REGISTERED_STATE', '2017-09-08 11:14:54', null, '0', null, '0', '1', '1');
INSERT INTO `deal` VALUES ('57', null, 'REGISTERED_STATE', '2017-09-08 11:15:27', null, '0', null, '0', '2', '1');
INSERT INTO `deal` VALUES ('58', null, 'REGISTERED_STATE', '2017-09-08 11:16:57', null, '0', null, '0', '3', '1');
INSERT INTO `deal` VALUES ('59', null, 'REGISTERED_STATE', '2017-09-08 11:18:49', null, '0', null, '0', '4', '1');
INSERT INTO `deal` VALUES ('60', null, 'REGISTERED_STATE', '2017-09-08 11:19:26', null, '0', null, '0', '5', '1');
INSERT INTO `deal` VALUES ('61', null, 'REGISTERED_STATE', '2017-09-08 11:20:11', null, '0', null, '0', '6', '1');
INSERT INTO `deal` VALUES ('62', null, 'REGISTERED_STATE', '2017-09-08 11:20:21', null, '0', null, '0', '7', '1');
INSERT INTO `deal` VALUES ('63', null, 'REGISTERED_STATE', '2017-09-08 11:20:57', null, '0', null, '0', '8', '1');
INSERT INTO `deal` VALUES ('64', null, 'REGISTERED_STATE', '2017-09-08 11:21:34', null, '0', null, '0', '9', '1');
INSERT INTO `deal` VALUES ('65', null, 'CANCELED_STATE', '2017-09-09 22:21:04', '2017-09-09 22:22:14', '0', null, '0', '10', '8');
INSERT INTO `deal` VALUES ('66', null, 'CANCELED_STATE', '2017-09-12 18:54:22', '2017-09-15 16:37:42', '0', null, '0', '11', '11');
INSERT INTO `deal` VALUES ('67', null, 'APPROVED_STATE', '2017-09-13 15:57:06', '2017-09-20 18:15:45', '0', null, '0', '12', '1');
INSERT INTO `deal` VALUES ('68', null, 'CANCELED_STATE', '2017-09-14 17:47:41', '2017-09-20 18:14:19', '0', null, '0', '13', '1');
INSERT INTO `deal` VALUES ('69', null, 'APPROVED_STATE', '2017-09-15 10:16:34', '2017-09-15 10:16:15', '0', null, '0', '7', '14');
INSERT INTO `deal` VALUES ('70', null, 'REGISTERED_STATE', '2017-09-15 10:21:34', null, '0', null, '0', '8', '14');
INSERT INTO `deal` VALUES ('71', null, 'REGISTERED_STATE', '2017-09-15 15:42:10', null, '0', null, '0', '9', '14');
INSERT INTO `deal` VALUES ('72', null, 'APPROVED_STATE', '2017-09-15 16:15:55', '2017-09-15 16:36:48', '0', null, '0', '10', '15');
INSERT INTO `deal` VALUES ('73', null, 'APPROVED_STATE', '2017-09-15 16:28:05', '2017-09-15 16:37:01', '0', null, '0', '11', '15');
INSERT INTO `deal` VALUES ('74', null, 'APPROVED_STATE', '2017-09-15 16:33:24', '2017-09-15 16:33:05', '0', null, '0', '12', '15');
INSERT INTO `deal` VALUES ('75', null, 'APPROVED_STATE', '2017-09-18 08:51:01', '2017-09-20 18:14:36', '0', null, '0', '13', '15');
INSERT INTO `deal` VALUES ('76', null, 'CANCELED_STATE', '2017-09-18 08:52:05', '2017-09-20 18:15:16', '0', null, '0', '14', '15');
INSERT INTO `deal` VALUES ('77', null, 'APPROVED_STATE', '2017-09-29 17:40:45', '2017-09-29 17:40:26', '0', null, '0', '15', '1');
INSERT INTO `deal` VALUES ('78', null, 'APPROVED_STATE', '2017-10-11 16:42:18', '2017-10-11 16:41:58', '0', null, '0', '16', '1');
INSERT INTO `deal` VALUES ('79', null, 'APPROVED_STATE', '2017-10-20 14:45:38', '2017-10-20 14:45:19', '0', null, '0', '17', '1');
INSERT INTO `deal` VALUES ('80', null, 'APPROVED_STATE', '2017-10-20 14:46:08', '2017-10-20 14:45:49', '0', null, '0', '18', '1');
INSERT INTO `deal` VALUES ('81', null, 'APPROVED_STATE', '2018-11-16 19:36:12', '2018-11-16 19:35:37', '0', null, '0', '19', '1');

-- ----------------------------
-- Table structure for deal_approver
-- ----------------------------
DROP TABLE IF EXISTS `deal_approver`;
CREATE TABLE `deal_approver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `approver_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6B047CD6F60E2305` (`deal_id`),
  CONSTRAINT `FK_6B047CD6F60E2305` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_approver
-- ----------------------------
INSERT INTO `deal_approver` VALUES ('1', '46', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('2', '43', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('3', '47', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('4', '48', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('5', '49', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('6', '50', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('7', '51', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('8', '52', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('9', '53', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('10', '54', '11081', '59', 'HP Admin Optime');
INSERT INTO `deal_approver` VALUES ('11', '55', '11081', '59', 'HP Admin Optime');

-- ----------------------------
-- Table structure for deal_bussines_unit
-- ----------------------------
DROP TABLE IF EXISTS `deal_bussines_unit`;
CREATE TABLE `deal_bussines_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_bussines_unit
-- ----------------------------
INSERT INTO `deal_bussines_unit` VALUES ('1', 'Cómputo Comercial', '1');
INSERT INTO `deal_bussines_unit` VALUES ('2', 'Servicios / Care Packs', '1');
INSERT INTO `deal_bussines_unit` VALUES ('3', 'Productos de impresión A3', '1');
INSERT INTO `deal_bussines_unit` VALUES ('4', 'Impresoras y Multifuncionales HP LaserJet y PageWide Pro, Enterprise & Managed', '1');
INSERT INTO `deal_bussines_unit` VALUES ('5', 'Consumibles', '1');
INSERT INTO `deal_bussines_unit` VALUES ('6', 'Laser Jet Managed', '0');

-- ----------------------------
-- Table structure for deal_comments
-- ----------------------------
DROP TABLE IF EXISTS `deal_comments`;
CREATE TABLE `deal_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ancestors` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `depth` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `state` int(11) NOT NULL,
  `author_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_profile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_external_user_id` int(11) NOT NULL,
  `author_external_company_id` int(11) NOT NULL,
  `author_external_profile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC1987B0E2904019` (`thread_id`),
  CONSTRAINT `FK_BC1987B0E2904019` FOREIGN KEY (`thread_id`) REFERENCES `deal_threads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_comments
-- ----------------------------
INSERT INTO `deal_comments` VALUES ('6', '38', 'Comentario', '', '0', '2016-06-06 10:24:29', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '0', '0', '0');
INSERT INTO `deal_comments` VALUES ('7', '38', 'Comentario 2', '', '0', '2016-06-06 11:45:08', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '0', '0', '0');
INSERT INTO `deal_comments` VALUES ('8', '38', 'nuevo comentario', '', '0', '2016-07-21 17:43:32', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '0', '0', '0');
INSERT INTO `deal_comments` VALUES ('9', '46', 'Primer comentario', '', '0', '2016-07-29 12:05:15', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('10', '46', 'Prueba de comentario', '', '0', '2016-07-29 12:08:13', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('11', '44', 'Mi primer comentario :)', '', '0', '2016-07-29 15:03:25', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('12', '43', 'Primer comentario', '', '0', '2016-07-29 15:04:11', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('13', '43', 'Respuesta 1', '12', '1', '2016-07-29 15:04:22', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('14', '43', 'Otro comentario', '', '0', '2016-07-29 15:04:30', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('15', '38', 'No debe notificar a nadie', '', '0', '2016-08-01 15:51:26', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('16', '38', 'otro comentario', '', '0', '2016-08-01 16:00:32', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('17', '38', 'mmm', '', '0', '2016-08-01 16:02:00', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('18', '38', 'ahora si, please XD', '', '0', '2016-08-01 16:04:47', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('19', '40', 'Saludos!', '', '0', '2016-08-01 16:06:04', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('20', '45', 'Nuevo comment', '', '0', '2016-08-01 17:03:57', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('21', '40', 'Nuevo comentario!', '', '0', '2016-08-01 17:04:38', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('22', '43', 'tercer usuario', '', '0', '2016-08-01 17:14:25', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('23', '43', 'Hola, aprobada', '', '0', '2016-08-01 17:19:17', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('24', '43', 'Submitter comentando', '', '0', '2016-08-01 17:20:54', '0', 'hpstoreacueducto@lumen.com.mx', 'Alberto  tejeda', '', 'Abastecedora Lumen Sa De Cv', '81257', '39108', '3');
INSERT INTO `deal_comments` VALUES ('25', '47', 'Hola, soy el submitter, este comentario debe llegarle al approver (HP Admin Optime)', '', '0', '2016-08-01 17:24:04', '0', 'hpstoreacueducto@lumen.com.mx', 'Alberto  tejeda', '', 'Abastecedora Lumen Sa De Cv', '81257', '39108', '3');
INSERT INTO `deal_comments` VALUES ('26', '47', 'Otro comentario del submitter', '25', '1', '2016-08-01 17:25:31', '0', 'hpstoreacueducto@lumen.com.mx', 'Alberto  tejeda', '', 'Abastecedora Lumen Sa De Cv', '81257', '39108', '3');
INSERT INTO `deal_comments` VALUES ('27', '47', 'Un tercero comentando :)', '25/26', '2', '2016-08-01 17:26:40', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('28', '47', 'último comentario del approver para este id', '25/26/27', '3', '2016-08-01 17:28:24', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('29', '47', 'Ahora un último comentario de un tercero en el id', '', '0', '2016-08-01 17:28:56', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('30', '52', 'Primer comentario XD!', '', '0', '2016-08-04 12:03:45', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('31', '48', 'Hola Soy el approver', '', '0', '2016-08-04 14:33:03', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('32', '50', 'Otro comentario del approver', '', '0', '2016-08-04 14:36:26', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('33', '52', 'Segundo Comentario', '30', '1', '2016-08-04 14:49:59', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('34', '52', 'tercer comentario!', '', '0', '2016-08-04 15:16:31', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('35', '52', 'Respuesta del approver :)', '30/33', '2', '2016-08-04 15:20:10', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('36', '52', 'Eso no es una respuesta   >:(', '', '0', '2016-08-04 15:21:45', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('37', '52', 'otra respuesta del approver', '', '0', '2016-08-04 16:32:43', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('38', '52', 'r3____', '30/33/35', '3', '2016-08-04 16:33:24', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('39', '52', 'prueba', '30/33/35/38', '4', '2016-08-04 16:33:51', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('40', '52', 'prueba3', '30/33/35/38/39', '5', '2016-08-04 16:34:04', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('41', '52', 'nuevo comentario', '', '0', '2016-08-04 17:14:38', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('42', '52', 'nuevooo', '', '0', '2016-08-04 17:15:30', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('43', '52', 'asdasd', '', '0', '2016-08-04 17:16:13', '0', 'preventa@bpi-consultores.com', 'Gilberto Bravo', '', 'Bpi Consulting Services Sa De Cv', '84414', '39127', '3');
INSERT INTO `deal_comments` VALUES ('44', '52', 'Test', '43', '1', '2016-08-05 15:21:03', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('45', '52', 'Other comment', '43/44', '2', '2016-08-05 15:51:19', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('46', '52', 'prueba despues del cambio de payuso', '', '0', '2016-08-05 16:02:36', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('47', '52', 'Another response', '43/44/45', '3', '2016-08-05 16:03:11', '0', 'admin@optimeconsulting.com', 'Admin Optime', '', 'Optime Consulting', '30690', '57', '6');
INSERT INTO `deal_comments` VALUES ('48', '53', 'Prueba de caracteres especiales áéíóú ñññ', '', '0', '2016-08-12 14:58:56', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('49', '53', 'Otro comentario áéí ñ', '', '0', '2016-08-12 15:01:40', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('50', '53', 'Otro comment á', '', '0', '2016-08-12 15:14:45', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('51', '53', 'HOLA', '', '0', '2016-08-12 15:19:38', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('52', '53', 'Prueba sin caracateres especiales', '', '0', '2016-08-12 15:21:04', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('53', '53', 'prueba de manuel', '', '0', '2016-08-12 15:40:05', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('54', '53', 'otro comentario', '', '0', '2016-08-12 15:41:39', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('55', '53', 'test', '', '0', '2016-08-12 15:49:42', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('56', '53', 'Prueba áéíóú ññññ', '', '0', '2016-08-12 16:11:03', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('57', '53', 'Prueba de caracteres especiales áéíóú ñññ - luego de correcciones', '', '0', '2016-08-12 16:45:21', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('58', '54', 'los ñames son tuberculos', '', '0', '2016-08-12 17:35:00', '0', 'sales@greencommunications.com', ' ñame Smith áéñ ', '', 'Green Communications', '31629', '788', '3');
INSERT INTO `deal_comments` VALUES ('59', '55', 'Comentario de test para caracteres especiales :) aéíóúñ@²', '', '0', '2016-08-15 10:27:06', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('60', '55', 'Prueba de comentario con html <script>alert(\'HOLA\')</script><b>Negrita</b>', '', '0', '2016-08-15 10:27:59', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');
INSERT INTO `deal_comments` VALUES ('61', '55', 'Respondiendo al approver (aéíóúñ@²)', '', '0', '2016-08-15 10:29:58', '0', 'sales@greencommunications.com', ' ñame Smith áéñ ', '', 'Green Communications', '31629', '788', '3');
INSERT INTO `deal_comments` VALUES ('62', '55', 'La oportunidad (aéíóúñ@²) se ha confirmado como ganada :)', '', '0', '2016-08-15 10:33:40', '0', 'hpadminoptime@optimeconsulting.com', 'HP Admin Optime', '', 'HEWLETT PACKARD', '11081', '59', '4');

-- ----------------------------
-- Table structure for deal_company
-- ----------------------------
DROP TABLE IF EXISTS `deal_company`;
CREATE TABLE `deal_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `zip_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `company_type` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_ABA581C7E7A1254A` (`contact_id`),
  KEY `IDX_ABA581C78BAC62AF` (`city_id`),
  KEY `IDX_ABA581C75D83CC1` (`state_id`),
  KEY `IDX_ABA581C7F92F3E70` (`country_id`),
  KEY `IDX_ABA581C7CFB34DC7` (`company_type`),
  CONSTRAINT `FK_ABA581C75D83CC1` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`),
  CONSTRAINT `FK_ABA581C78BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`),
  CONSTRAINT `FK_ABA581C7CFB34DC7` FOREIGN KEY (`company_type`) REFERENCES `deal_company_type` (`id`),
  CONSTRAINT `FK_ABA581C7E7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `deal_company_contact` (`id`),
  CONSTRAINT `FK_ABA581C7F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_company
-- ----------------------------
INSERT INTO `deal_company` VALUES ('40', '1497', '91', '2', '40', 'Optime Consulting', 'Weston Florida', '12345', 'http://www.optimeconsulting.com', '2016-06-06 10:23:54', '2017-08-29 11:35:20', '3', '1');
INSERT INTO `deal_company` VALUES ('41', '1588', '95', '2', '41', 'HP Inc', 'Estados Unidos de America', '2352342', 'http://www.hp.com', '2016-06-06 17:55:05', '2017-08-29 11:35:27', '4', '1');
INSERT INTO `deal_company` VALUES ('42', '1361', '87', '2', '42', 'Distribuidor One', 'cal 45A #45A-_45', '12456', 'http://www.nservidorquenoexiste1947552ASD.com', '2016-06-08 11:35:39', '2017-08-29 11:36:11', '1', '1');
INSERT INTO `deal_company` VALUES ('43', '1356', '87', '2', '43', 'Distribuidor Two', 'address two', '2', 'http://A.COM', '2016-07-21 18:02:58', '2017-08-29 11:41:40', '1', '1');
INSERT INTO `deal_company` VALUES ('44', '1705', '98', '2', '44', 'Partner Platinum one', 'address one', '2', 'http://B.COM', '2016-07-21 18:11:46', '2017-09-12 17:35:14', '17', '1');
INSERT INTO `deal_company` VALUES ('45', '1417', '91', '2', '45', 'Partner Silver one', 'address two', '5', 'http://t.com', '2016-07-21 18:22:17', '2017-09-12 17:35:14', '17', '1');
INSERT INTO `deal_company` VALUES ('46', '1403', '90', '2', '46', 'Partner Gold one', 'address three', '1234', 'http://localhost/', '2016-07-28 10:07:24', '2017-09-12 17:35:15', '17', '1');
INSERT INTO `deal_company` VALUES ('47', '1360', '87', '2', '47', 'Partner Hp Business one', 'address four', '1234', 'http://localhost/', '2016-07-28 11:18:42', '2017-09-12 17:35:15', '17', '1');
INSERT INTO `deal_company` VALUES ('48', '1366', '88', '2', '48', 'Partner Platinum two', 'address two', '1234', 'http://localhost/', '2016-07-28 11:34:24', '2017-09-12 17:35:15', '17', '1');
INSERT INTO `deal_company` VALUES ('49', '1570', '94', '2', '49', 'Partner Silver two', 'address two', '1234', 'http://localhost/', '2016-08-01 17:23:17', '2017-09-12 17:35:16', '17', '1');
INSERT INTO `deal_company` VALUES ('50', '2793', '113', '2', '50', 'Partner Gold two', 'address two', 'postalandia', 'http://abc.com', '2016-08-04 11:43:15', '2017-09-12 17:35:16', '17', '1');
INSERT INTO `deal_company` VALUES ('51', '2358', '106', '2', '51', 'Partner Hp Business two', 'no se', '1234', 'http://abc.com', '2016-08-04 11:49:32', '2017-09-12 17:35:16', '17', '1');
INSERT INTO `deal_company` VALUES ('61', '1831', '100', '2', null, 'Distribuidor 3', 'alguna direccion', '123123', 'http://hola.com', '2017-09-04 21:20:13', '2017-09-06 11:44:11', '1', '1');
INSERT INTO `deal_company` VALUES ('62', '1831', '100', '2', null, 'Distribuidor 4', 'alguna direccion', '123123', 'http://hola.com', '2017-09-04 21:22:05', '2017-09-06 11:44:09', '1', '1');
INSERT INTO `deal_company` VALUES ('63', '1542', '93', '2', null, 'Empresa Gold 3', 'Direccion Gold 3', null, null, '2017-09-09 22:36:49', '2017-09-12 17:35:19', '17', '1');
INSERT INTO `deal_company` VALUES ('64', '2185', '102', '2', null, 'Empresa Palm', 'Direccion empresa Palm', null, null, '2017-09-12 17:46:13', null, '17', '1');
INSERT INTO `deal_company` VALUES ('65', '2581', '107', '2', null, 'Vecindad del chavo', 'Sin Ubicacion', null, null, '2017-09-15 10:15:07', null, '17', '1');
INSERT INTO `deal_company` VALUES ('66', '1684', '97', '2', null, 'test 1 Martilu', '19716 Southwest 119th Place', null, null, '2017-09-15 15:51:28', null, '1', '1');
INSERT INTO `deal_company` VALUES ('67', '2831', '114', '2', null, 'prueba', 'Cra 1 No 1-1', null, null, '2017-09-29 17:44:36', null, '17', '1');
INSERT INTO `deal_company` VALUES ('68', '1494', '91', '2', null, 'Prueba3', 'Prueba3', null, null, '2017-11-29 11:21:54', null, '1', '1');
INSERT INTO `deal_company` VALUES ('69', '1735', '98', '2', null, 'Prueba4', 'Prueba4', null, null, '2017-11-29 11:22:41', null, '17', '1');

-- ----------------------------
-- Table structure for deal_company_contact
-- ----------------------------
DROP TABLE IF EXISTS `deal_company_contact`;
CREATE TABLE `deal_company_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_company_contact_phone_id` int(11) DEFAULT NULL,
  `first_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_280E86F7C9B0B8A3` (`deal_company_contact_phone_id`),
  CONSTRAINT `FK_280E86F7C9B0B8A3` FOREIGN KEY (`deal_company_contact_phone_id`) REFERENCES `deal_company_contact_phone` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_company_contact
-- ----------------------------
INSERT INTO `deal_company_contact` VALUES ('40', '40', 'Contacto', 'Apellido', 'contacto@empresa.com', 'Cargo', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `deal_company_contact` VALUES ('41', '41', 'Pepe', 'Perez', 'pperez@pepito.com.mx', 'Owner', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `deal_company_contact` VALUES ('42', '42', 'alexander III', 'zurulejo amerilio', 'alaxander@unservidorquenoexiste1947552ASD.com', 'vendedor', '2016-06-08 11:35:39', '2016-06-08 10:55:16');
INSERT INTO `deal_company_contact` VALUES ('43', '43', 'A', 'A', 'A@A.COM', 'A', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `deal_company_contact` VALUES ('44', '44', 'B', 'B', 'B@B.COM', 'B', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `deal_company_contact` VALUES ('45', '45', 't', 't', 't@t.com', 't', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `deal_company_contact` VALUES ('46', '46', 'Manuel', 'Aguirre', 'maguirre@developerplace.com', 'Desarrollador', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `deal_company_contact` VALUES ('47', '47', 'Manuel', 'Aguirre', 'maguirre@developerplace.com', 'Desarrollador', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `deal_company_contact` VALUES ('48', '48', 'Manuel', 'Aguirre', 'maguirre@developerplace.com', 'Desarrollador', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `deal_company_contact` VALUES ('49', '49', 'Manuel', 'Aguirre', 'maguirre@developerplace.com', 'Desarrollador', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `deal_company_contact` VALUES ('50', '50', 'juanita', 'guanapato', 'emailtemplatesopt@gmail.com', 'oficinista', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `deal_company_contact` VALUES ('51', '51', 'ali baba', 'y los cuarenta', 'emailtemplatesopt@gmail.com', 'electricista', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `deal_company_contact` VALUES ('52', '52', 'milo', 'makoto', 'emailtemplatesopt@gmail.com', 'asesor de estilo', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `deal_company_contact` VALUES ('53', '53', 'simarino', 'aperillio', 'emailtemplatesopt@gmail.com', 'volantero', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `deal_company_contact` VALUES ('57', '57', 'ortencio', 'felizcano', 'emailtemplatesopt@gmail.com', 'organizador de reuniones fuera de la oficina', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `deal_company_contact` VALUES ('58', '58', 'nombre del contacto', 'asdasdads', 'emailtemplatesopt@gmail.com', 'crgo del contacto', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `deal_company_contact` VALUES ('59', '59', 'ñamencio gónzales', 'apel', 'emailtemplatesopt@gmail.com', 'crgo del contacto', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `deal_company_contact` VALUES ('60', '60', 'Manuel', 'Aguirre', 'maguirre@developerplace.com', 'Desarrollador', '2016-08-15 10:19:33', '2016-08-15 09:39:09');

-- ----------------------------
-- Table structure for deal_company_contact_phone
-- ----------------------------
DROP TABLE IF EXISTS `deal_company_contact_phone`;
CREATE TABLE `deal_company_contact_phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Casa','Trabajo','Fax','Movil') COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `area_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_company_contact_phone
-- ----------------------------
INSERT INTO `deal_company_contact_phone` VALUES ('40', 'Trabajo', '552', '5264', '24848472', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `deal_company_contact_phone` VALUES ('41', 'Trabajo', '259', '5879', '24848472', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `deal_company_contact_phone` VALUES ('42', 'Trabajo', '57', '1', '12345678', '2016-06-08 11:35:39', '2016-06-08 10:55:16');
INSERT INTO `deal_company_contact_phone` VALUES ('43', 'Trabajo', '2', '3', '6666', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `deal_company_contact_phone` VALUES ('44', 'Trabajo', '2', '3', '65488', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `deal_company_contact_phone` VALUES ('45', 'Trabajo', '2', '3', '6445', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `deal_company_contact_phone` VALUES ('46', 'Trabajo', '234', '3243', '34234', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `deal_company_contact_phone` VALUES ('47', 'Trabajo', '345', '4354', '5435334', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `deal_company_contact_phone` VALUES ('48', 'Trabajo', '342', '3243', '43242342', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `deal_company_contact_phone` VALUES ('49', 'Trabajo', '456', '4564', '5645654', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `deal_company_contact_phone` VALUES ('50', 'Trabajo', '1', '1', '1234', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `deal_company_contact_phone` VALUES ('51', 'Trabajo', '1', '2', '1234', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `deal_company_contact_phone` VALUES ('52', 'Trabajo', '1', '1', '1234', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `deal_company_contact_phone` VALUES ('53', 'Trabajo', '1', '1', '1234', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `deal_company_contact_phone` VALUES ('57', 'Trabajo', '1', '1', '1234', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `deal_company_contact_phone` VALUES ('58', 'Trabajo', '1', '1', '1111', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `deal_company_contact_phone` VALUES ('59', 'Trabajo', '1', '1', '1111', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `deal_company_contact_phone` VALUES ('60', 'Trabajo', '567', '5676', '567657657', '2016-08-15 10:19:33', '2016-08-15 09:39:09');

-- ----------------------------
-- Table structure for deal_company_type
-- ----------------------------
DROP TABLE IF EXISTS `deal_company_type`;
CREATE TABLE `deal_company_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `visible` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `company_type_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_company_type
-- ----------------------------
INSERT INTO `deal_company_type` VALUES ('1', 'Distributor', '1', '2010-07-10 12:37:31', '2010-07-10 12:37:35', '5');
INSERT INTO `deal_company_type` VALUES ('3', 'Optime', '0', '2010-07-14 10:04:37', '2010-07-14 10:04:39', '4');
INSERT INTO `deal_company_type` VALUES ('4', 'Manufacturer', '0', '2010-08-19 08:59:16', '2010-08-19 08:59:19', '4');
INSERT INTO `deal_company_type` VALUES ('13', 'Platinum', '0', '2014-04-22 10:12:51', '2017-08-29 00:00:00', '3');
INSERT INTO `deal_company_type` VALUES ('14', 'Silver', '0', '2014-04-22 10:12:51', '2017-08-29 00:00:00', '3');
INSERT INTO `deal_company_type` VALUES ('15', 'Gold', '0', '2014-04-22 10:12:51', '2017-08-29 00:00:00', '3');
INSERT INTO `deal_company_type` VALUES ('16', 'HP Business Partner', '0', '2014-04-21 00:00:00', '2014-09-05 00:00:00', '1');
INSERT INTO `deal_company_type` VALUES ('17', 'Reseller', '1', '2017-09-12 11:28:19', '2017-09-12 11:28:22', '1');

-- ----------------------------
-- Table structure for deal_invoice
-- ----------------------------
DROP TABLE IF EXISTS `deal_invoice`;
CREATE TABLE `deal_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_distributor_id` int(11) DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_invoice_date` date DEFAULT NULL,
  `computo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_units` int(11) NOT NULL,
  `total_quantity` decimal(20,3) DEFAULT NULL,
  `correlative` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deal_bussines_unit_id` int(11) DEFAULT NULL,
  `certificado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `factura` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `computo_win_pro` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_747F9FCC34E15FB` (`company_distributor_id`),
  KEY `IDX_747F9FCC45F732F4` (`deal_bussines_unit_id`),
  CONSTRAINT `FK_747F9FCC34E15FB` FOREIGN KEY (`company_distributor_id`) REFERENCES `deal_company` (`id`),
  CONSTRAINT `FK_747F9FCC45F732F4` FOREIGN KEY (`deal_bussines_unit_id`) REFERENCES `deal_bussines_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_invoice
-- ----------------------------
INSERT INTO `deal_invoice` VALUES ('1', '67', '123456', '2017-09-22', null, '4', '150000.000', 'VIP_MX_00001', '2', '', 'KentBeck_TDD_byexample.pdf', null);
INSERT INTO `deal_invoice` VALUES ('2', '42', '123456', '2017-09-13', 'Procesadores Intel', '50', '150000.000', 'VIP_MX_00002', '1', '', '', null);
INSERT INTO `deal_invoice` VALUES ('3', '41', '123456', '2017-09-12', null, '152', '50.000', 'VIP_MX_00003', '2', '', '', null);
INSERT INTO `deal_invoice` VALUES ('4', '61', '123456', '2017-09-19', null, '25', '150500.000', 'VIP_MX_00004', '5', '', '', null);
INSERT INTO `deal_invoice` VALUES ('5', '42', '123456', '2017-09-18', 'Procesadores AMD', '123', '15.000', 'VIP_MX_00005', '1', null, '6415ef88f9c8e0ad07a8d2235c35bfa2.pdf', null);
INSERT INTO `deal_invoice` VALUES ('6', '67', '123456', '2017-09-07', null, '123', '150000.000', 'VIP_MX_00006', '2', '3e7498add0956fb8ae5fc6f266c36817.pdf', '143f50c26c18602110dc66333ccc0c2b.pdf', null);
INSERT INTO `deal_invoice` VALUES ('7', '41', '4875A', '2017-09-01', 'Procesadores Intel', '5', '50000.000', 'VIP_MX_00007', '1', null, null, null);
INSERT INTO `deal_invoice` VALUES ('8', '41', '4875A', '2017-09-01', null, '12', '150000.000', 'VIP_MX_00008', '2', '7353a8b83415fe0f4ee65738f56e1618.pdf', '393eb47dd92a3b8d570735a03b386132.pdf', null);
INSERT INTO `deal_invoice` VALUES ('9', '62', '1234OK', '2017-09-07', null, '2', '240350.000', 'VIP_MX_00009', '5', null, '501f9d5f8acbb47927cadb51f4d1eea7.pdf', null);
INSERT INTO `deal_invoice` VALUES ('10', '41', '5445474ghvfjhyv', '2017-12-12', 'Procesadores Intel', '5', '675767899.000', 'VIP_MX_00010', '2', '42632531b481fbe6b06ad0abdb6dd297.jpeg', '3240659b224ca12f1e971178c75b81cf.pdf', null);
INSERT INTO `deal_invoice` VALUES ('11', '61', 'nhgfc65763333', '2017-09-13', 'Procesadores Intel', '5', '340000000000.000', 'VIP_MX_00011', '1', null, 'e3c768305f68b0130f6cf3b03a4522ea.pdf', null);
INSERT INTO `deal_invoice` VALUES ('12', '43', '4', '2017-09-20', null, '1', '1.000', 'VIP_MX_00012', '3', null, null, null);
INSERT INTO `deal_invoice` VALUES ('13', '42', 'yhrtfyh54557', '2017-09-20', null, '4', '350000000000.000', 'VIP_MX_00013', '2', '20d4201b35c492a03a31c0403e82bbfe.jpeg', '9b785bdfee5f26d0419f87ef71139e13.pdf', null);
INSERT INTO `deal_invoice` VALUES ('14', '41', '35', '2017-09-30', 'Procesadores AMD', '2', '35.000', 'VIP_MX_00014', '1', null, null, null);
INSERT INTO `deal_invoice` VALUES ('15', '43', '3333', '2017-09-29', 'Procesadores Intel', '222', '2222.000', 'VIP_MX_00015', '1', null, '2c0ff622e2c1acd7b9e0eb2bab3e035f.pdf', 'No');
INSERT INTO `deal_invoice` VALUES ('16', '41', 'Hola', '2017-10-10', null, '123', '500.000', 'VIP_MX_00016', '2', 'c3c925672d57b4f24107f3f49e3a7219.png', 'af20ccfe772346ca47dccca42e680f4d.png', null);
INSERT INTO `deal_invoice` VALUES ('17', '41', '20', '2017-10-20', 'Procesadores AMD', '10', '10000.000', 'VIP_MX_00017', '1', null, null, 'Si');
INSERT INTO `deal_invoice` VALUES ('18', '42', '20172019-1', '2017-10-02', 'Procesadores AMD', '20', '20.000', 'VIP_MX_00018', '1', null, '52800972915b58b0d158c74f7cebc26f.pdf', 'Si');
INSERT INTO `deal_invoice` VALUES ('19', '41', '123456789', '2018-11-16', 'Procesadores AMD', '150', '500000.000', 'VIP_MX_00019', '1', null, '0829794f625a1154cf44a7c3f6668434.png', 'Si');

-- ----------------------------
-- Table structure for deal_invoice_bu
-- ----------------------------
DROP TABLE IF EXISTS `deal_invoice_bu`;
CREATE TABLE `deal_invoice_bu` (
  `id_invoice` int(11) NOT NULL,
  `id_bu` int(11) NOT NULL,
  PRIMARY KEY (`id_invoice`,`id_bu`),
  KEY `IDX_41D3A9214EF8BE34` (`id_invoice`),
  KEY `IDX_41D3A921F600676E` (`id_bu`),
  CONSTRAINT `FK_41D3A9214EF8BE34` FOREIGN KEY (`id_invoice`) REFERENCES `deal_invoice` (`id`),
  CONSTRAINT `FK_41D3A921F600676E` FOREIGN KEY (`id_bu`) REFERENCES `deal_bussines_unit` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_invoice_bu
-- ----------------------------
INSERT INTO `deal_invoice_bu` VALUES ('1', '5');
INSERT INTO `deal_invoice_bu` VALUES ('1', '6');
INSERT INTO `deal_invoice_bu` VALUES ('2', '5');
INSERT INTO `deal_invoice_bu` VALUES ('2', '6');
INSERT INTO `deal_invoice_bu` VALUES ('3', '1');
INSERT INTO `deal_invoice_bu` VALUES ('3', '5');
INSERT INTO `deal_invoice_bu` VALUES ('3', '6');
INSERT INTO `deal_invoice_bu` VALUES ('4', '3');
INSERT INTO `deal_invoice_bu` VALUES ('5', '3');
INSERT INTO `deal_invoice_bu` VALUES ('6', '3');
INSERT INTO `deal_invoice_bu` VALUES ('7', '3');
INSERT INTO `deal_invoice_bu` VALUES ('8', '3');
INSERT INTO `deal_invoice_bu` VALUES ('9', '1');
INSERT INTO `deal_invoice_bu` VALUES ('9', '5');
INSERT INTO `deal_invoice_bu` VALUES ('9', '6');
INSERT INTO `deal_invoice_bu` VALUES ('10', '2');
INSERT INTO `deal_invoice_bu` VALUES ('10', '3');

-- ----------------------------
-- Table structure for deal_point
-- ----------------------------
DROP TABLE IF EXISTS `deal_point`;
CREATE TABLE `deal_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `loyalty_point_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_with_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F17A3038F60E2305` (`deal_id`),
  CONSTRAINT `FK_F17A3038F60E2305` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_point
-- ----------------------------
INSERT INTO `deal_point` VALUES ('1', '41', '634397', '10', 'Deal Approved', '2016-07-21 18:03:13', '2016-07-21 17:22:50', '');
INSERT INTO `deal_point` VALUES ('2', '42', '634398', '10', 'Deal Approved', '2016-07-21 18:11:58', '2016-07-21 17:31:35', '');
INSERT INTO `deal_point` VALUES ('3', '43', '634399', '10', 'Deal Approved', '2016-07-21 18:25:31', '2016-07-21 17:45:07', '');
INSERT INTO `deal_point` VALUES ('4', '43', '2132953', '10', 'Deal Approved', '2016-08-01 17:18:08', '2016-08-01 16:37:44', '');
INSERT INTO `deal_point` VALUES ('5', '49', '2132954', '10', 'Deal Approved', '2016-08-04 16:19:46', '2016-08-04 15:39:22', '');
INSERT INTO `deal_point` VALUES ('6', '52', '2132955', '10', 'Deal Approved', '2016-08-04 16:22:17', '2016-08-04 15:41:53', '');
INSERT INTO `deal_point` VALUES ('7', '51', '2132956', '10', 'Deal Approved', '2016-08-04 16:22:25', '2016-08-04 15:42:01', '');
INSERT INTO `deal_point` VALUES ('8', '50', '2132957', '10', 'Deal Approved', '2016-08-04 16:22:31', '2016-08-04 15:42:08', '');
INSERT INTO `deal_point` VALUES ('9', '50', '2132958', '75', 'Deal Confirmed', '2016-08-04 16:39:11', '2016-08-04 15:58:48', '');
INSERT INTO `deal_point` VALUES ('10', '52', '2132959', '75', 'Deal Confirmed', '2016-08-04 16:43:15', '2016-08-04 16:02:51', '');
INSERT INTO `deal_point` VALUES ('11', '47', '634400', '10', 'Deal Approved', '2016-08-10 11:22:40', '2016-08-10 10:42:16', '');
INSERT INTO `deal_point` VALUES ('12', '55', '634401', '10', 'Deal Approved', '2016-08-15 10:29:02', '2016-08-15 09:48:38', '');
INSERT INTO `deal_point` VALUES ('13', '55', '634402', '100', 'Deal Confirmed', '2016-08-15 10:31:38', '2016-08-15 09:51:15', '');
INSERT INTO `deal_point` VALUES ('14', '54', '634412', '10', 'Deal Approved', '2016-09-05 11:22:02', '2016-09-05 10:36:07', 'APPROVED_STATE');
INSERT INTO `deal_point` VALUES ('15', '54', '634413', '50', 'Deal Confirmed', '2016-09-05 11:55:31', '2016-09-05 11:09:36', 'WON_STATE');
INSERT INTO `deal_point` VALUES ('16', '47', '634414', '100', 'Deal Confirmed', '2016-09-05 12:03:38', '2016-09-05 11:17:43', 'WON_STATE');

-- ----------------------------
-- Table structure for deal_project
-- ----------------------------
DROP TABLE IF EXISTS `deal_project`;
CREATE TABLE `deal_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `reason` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_project
-- ----------------------------
INSERT INTO `deal_project` VALUES ('40', 'Proyecto', 'Descripcion', 'OPEN_STATE', 'Nuevo', '2016-06-06 10:23:54', '2016-06-06 09:43:31');
INSERT INTO `deal_project` VALUES ('41', 'Pepito\'s world', 'Descripcion', 'OPEN_STATE', 'Nuevo', '2016-06-06 17:55:05', '2016-06-06 17:14:41');
INSERT INTO `deal_project` VALUES ('42', 'Dale a tu cuerpo alegria y cosa buena', 'Dale a tu cuerpo alegria y cosa buena heee macarena!', 'OPEN_STATE', 'Actualizacion', '2016-06-08 11:35:39', '2016-06-08 10:55:16');
INSERT INTO `deal_project` VALUES ('43', 'AA', 'AA', 'OPEN_STATE', 'Actualizacion', '2016-07-21 18:02:58', '2016-07-21 17:22:34');
INSERT INTO `deal_project` VALUES ('44', 'BB', 'BB', 'ON_HOLD_STATE', 'Nuevo', '2016-07-21 18:11:46', '2016-07-21 17:31:23');
INSERT INTO `deal_project` VALUES ('45', 'tt', 'tt', 'IN_NEGOTIATION_STATE', 'Nuevo', '2016-07-21 18:22:17', '2016-07-21 17:41:54');
INSERT INTO `deal_project` VALUES ('46', 'Proyecto test', 'Test', 'ON_HOLD_STATE', 'Actualizacion', '2016-07-28 10:07:24', '2016-07-28 09:27:00');
INSERT INTO `deal_project` VALUES ('47', 'Proyecto test', 'test', 'OPEN_STATE', 'Actualizacion', '2016-07-28 11:18:42', '2016-07-28 10:38:19');
INSERT INTO `deal_project` VALUES ('48', 'Proyecto test', 'test', 'IN_NEGOTIATION_STATE', 'Nuevo', '2016-07-28 11:34:24', '2016-07-28 10:54:01');
INSERT INTO `deal_project` VALUES ('49', 'Proyecto test', '7567567', 'OPEN_STATE', 'Actualizacion', '2016-08-01 17:23:17', '2016-08-01 16:42:53');
INSERT INTO `deal_project` VALUES ('50', 'IMPRESORAS 3D para todos', 'se regalaran impresoras 3D en la calle', 'OPEN_STATE', 'Nuevo', '2016-08-04 11:43:15', '2016-08-04 11:02:51');
INSERT INTO `deal_project` VALUES ('51', '1K de servidores', 'descripcion', 'OPEN_STATE', 'Actualizacion', '2016-08-04 11:49:32', '2016-08-04 11:09:08');
INSERT INTO `deal_project` VALUES ('52', '5G - actualizate', 'por tu descripcion aqui ...', 'OPEN_STATE', 'Nuevo', '2016-08-04 11:53:09', '2016-08-04 11:12:45');
INSERT INTO `deal_project` VALUES ('53', 'Internet gratis', 'Describeme...', 'LOST_STATE', 'Nuevo', '2016-08-04 11:56:15', '2016-08-04 11:15:51');
INSERT INTO `deal_project` VALUES ('57', 'EkoPCS', 'descripcion', 'OPEN_STATE', 'Actualizacion', '2016-08-04 12:01:46', '2016-08-04 11:21:23');
INSERT INTO `deal_project` VALUES ('58', 'nombre del contacto', 'deade', 'ON_HOLD_STATE', 'Nuevo', '2016-08-12 14:57:10', '2016-08-12 14:16:46');
INSERT INTO `deal_project` VALUES ('59', 'nombre del contacto', 'description', 'OPEN_STATE', 'Nuevo', '2016-08-12 17:34:26', '2016-08-12 16:54:02');
INSERT INTO `deal_project` VALUES ('60', 'Test de caracteres especiales aéíóúñ@²', 'Test de caracteres especiales aéíóúñ@²', 'OPEN_STATE', 'Actualizacion', '2016-08-15 10:19:33', '2016-08-15 09:39:09');

-- ----------------------------
-- Table structure for deal_status_log
-- ----------------------------
DROP TABLE IF EXISTS `deal_status_log`;
CREATE TABLE `deal_status_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `old_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `new_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deal_point_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B04E998223AFDF38` (`deal_point_id`) USING BTREE,
  KEY `IDX_B04E9982F60E2305` (`deal_id`),
  CONSTRAINT `FK_B04E998223AFDF38` FOREIGN KEY (`deal_point_id`) REFERENCES `deal_point` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_B04E9982F60E2305` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of deal_status_log
-- ----------------------------
INSERT INTO `deal_status_log` VALUES ('92', '38', null, '30690', '57', '6', '2016-06-06 10:23:54', '2016-06-06 09:43:31', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('93', '39', null, '30690', '57', '6', '2016-06-06 17:55:05', '2016-06-06 17:14:41', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('94', '40', null, '84414', '39127', '3', '2016-06-08 11:35:40', '2016-06-08 10:55:16', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('95', '38', 'APPROVED_STATE', '30690', '57', '7', '2016-07-21 17:10:48', '2016-07-21 16:30:24', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('96', '39', 'APPROVED_STATE', '30690', '57', '7', '2016-07-21 17:39:58', '2016-07-21 16:59:34', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('97', '41', null, '30690', '57', '6', '2016-07-21 18:02:58', '2016-07-21 17:22:34', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('98', '41', 'REGISTERED_STATE', '30690', '57', '6', '2016-07-21 18:03:12', '2016-07-21 17:22:48', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('99', '41', 'APPROVED_STATE', '30690', '57', '6', '2016-07-21 18:03:46', '2016-07-21 17:23:22', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('100', '40', 'APPROVED_STATE', '30690', '57', '6', '2016-07-21 18:10:18', '2016-07-21 17:29:55', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('101', '42', null, '30690', '57', '6', '2016-07-21 18:11:46', '2016-07-21 17:31:23', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('102', '42', 'REGISTERED_STATE', '30690', '57', '6', '2016-07-21 18:11:58', '2016-07-21 17:31:34', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('103', '42', 'APPROVED_STATE', '30690', '57', '6', '2016-07-21 18:12:35', '2016-07-21 17:32:11', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('104', '43', null, '81257', '39108', '3', '2016-07-21 18:22:17', '2016-07-21 17:41:54', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('105', '43', 'REGISTERED_STATE', '30690', '57', '6', '2016-07-21 18:25:30', '2016-07-21 17:45:06', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('106', '43', 'APPROVED_STATE', '81257', '39108', '3', '2016-07-21 18:26:55', '2016-07-21 17:46:31', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('107', '42', 'APPROVED_STATE', '30690', '57', '6', '2016-07-21 18:39:53', '2016-07-21 17:59:29', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('108', '44', null, '30690', '57', '6', '2016-07-28 10:07:24', '2016-07-28 09:27:00', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('109', '45', null, '30690', '57', '6', '2016-07-28 11:18:42', '2016-07-28 10:38:19', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('110', '46', null, '30690', '57', '6', '2016-07-28 11:34:24', '2016-07-28 10:54:01', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('111', '43', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-01 17:18:07', '2016-08-01 16:37:43', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('112', '47', null, '81257', '39108', '3', '2016-08-01 17:23:17', '2016-08-01 16:42:53', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('113', '48', null, '84414', '39127', '3', '2016-08-04 11:43:15', '2016-08-04 11:02:51', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('114', '49', null, '84414', '39127', '3', '2016-08-04 11:49:32', '2016-08-04 11:09:08', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('115', '50', null, '84414', '39127', '3', '2016-08-04 11:53:09', '2016-08-04 11:12:45', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('116', '51', null, '84414', '39127', '3', '2016-08-04 11:56:15', '2016-08-04 11:15:51', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('117', '52', null, '84414', '39127', '3', '2016-08-04 12:01:46', '2016-08-04 11:21:23', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('118', '48', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-04 16:14:17', '2016-08-04 15:33:53', 'REJECTED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('119', '49', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-04 16:19:46', '2016-08-04 15:39:22', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('120', '49', 'APPROVED_STATE', '84414', '39127', '3', '2016-08-04 16:21:03', '2016-08-04 15:40:39', 'CANCELED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('121', '52', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-04 16:22:17', '2016-08-04 15:41:53', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('122', '51', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-04 16:22:24', '2016-08-04 15:42:00', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('123', '50', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-04 16:22:31', '2016-08-04 15:42:07', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('124', '51', 'APPROVED_STATE', '84414', '39127', '3', '2016-08-04 16:24:30', '2016-08-04 15:44:06', 'LOSS_STATE', null);
INSERT INTO `deal_status_log` VALUES ('125', '50', 'APPROVED_STATE', '84414', '39127', '3', '2016-08-04 16:26:54', '2016-08-04 15:46:30', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('126', '52', 'APPROVED_STATE', '84414', '39127', '3', '2016-08-04 16:30:48', '2016-08-04 15:50:24', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('127', '47', 'REGISTERED_STATE', '30690', '57', '6', '2016-08-10 11:22:39', '2016-08-10 10:42:15', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('128', '53', null, '31629', '788', '3', '2016-08-12 14:57:10', '2016-08-12 14:16:46', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('129', '54', null, '31629', '788', '3', '2016-08-12 17:34:26', '2016-08-12 16:54:02', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('130', '55', null, '31629', '788', '3', '2016-08-15 10:19:33', '2016-08-15 09:39:09', 'REGISTERED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('131', '55', 'REGISTERED_STATE', '11081', '59', '4', '2016-08-15 10:29:01', '2016-08-15 09:48:37', 'APPROVED_STATE', null);
INSERT INTO `deal_status_log` VALUES ('132', '55', 'APPROVED_STATE', '31629', '788', '3', '2016-08-15 10:30:24', '2016-08-15 09:50:00', 'WON_STATE', null);
INSERT INTO `deal_status_log` VALUES ('133', '54', 'REGISTERED_STATE', '30690', '57', '6', '2016-09-05 11:16:43', '2016-09-05 10:36:08', 'APPROVED_STATE', '14');
INSERT INTO `deal_status_log` VALUES ('134', '54', 'APPROVED_STATE', '30690', '57', '6', '2016-09-05 11:30:04', '2016-09-05 11:09:36', 'WON_STATE', '15');
INSERT INTO `deal_status_log` VALUES ('135', '47', 'APPROVED_STATE', '30690', '57', '6', '2016-09-05 11:42:46', '2016-09-05 11:17:43', 'WON_STATE', '16');

-- ----------------------------
-- Table structure for deal_submitter
-- ----------------------------
DROP TABLE IF EXISTS `deal_submitter`;
CREATE TABLE `deal_submitter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `country_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `region_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_type_id` int(11) DEFAULT NULL,
  `company_type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_id` int(11) NOT NULL,
  `profile_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loyalty_id` int(11) DEFAULT NULL,
  `language` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F6EBA5C0C906750D` (`loyalty_id`),
  CONSTRAINT `FK_F6EBA5C0C906750D` FOREIGN KEY (`loyalty_id`) REFERENCES `loyalty` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_submitter
-- ----------------------------
INSERT INTO `deal_submitter` VALUES ('42', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-06-06 10:23:54', '2016-06-06 09:43:31', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('43', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-06-06 17:55:05', '2016-06-06 17:14:41', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('44', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-06-08 11:35:40', '2016-06-08 10:55:16', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('45', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-07-21 18:02:58', '2016-07-21 17:22:34', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('46', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-07-21 18:11:46', '2016-07-21 17:31:23', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('47', '81257', 'hpstoreacueducto@lumen.com.mx', 'Alberto ', 'tejeda', 'hpstoreacueducto@lumen.com.mx', '39108', 'Abastecedora Lumen Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-07-21 18:22:17', '2016-07-21 17:41:54', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('48', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-07-28 10:07:24', '2016-07-28 09:27:00', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('49', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-07-28 11:18:42', '2016-07-28 10:38:18', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('50', '30690', 'admin@optimeconsulting.com', 'Admin', 'Optime', 'admin@optimeconsulting.com', '57', 'Optime Consulting', null, null, null, null, null, null, null, '6', '', '2016-07-28 11:34:24', '2016-07-28 10:54:00', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('51', '81257', 'hpstoreacueducto@lumen.com.mx', 'Alberto ', 'tejeda', 'hpstoreacueducto@lumen.com.mx', '39108', 'Abastecedora Lumen Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-01 17:23:17', '2016-08-01 16:42:53', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('52', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-04 11:43:15', '2016-08-04 11:02:51', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('53', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-04 11:49:32', '2016-08-04 11:09:08', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('54', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-04 11:53:09', '2016-08-04 11:12:45', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('55', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-04 11:56:15', '2016-08-04 11:15:51', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('59', '84414', 'preventa@bpi-consultores.com', 'Gilberto', 'Bravo', 'preventa@bpi-consultores.com', '39127', 'Bpi Consulting Services Sa De Cv', null, null, null, null, null, null, null, '3', '', '2016-08-04 12:01:46', '2016-08-04 11:21:23', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('60', '31629', 'sales@greencommunications.com', 'Bob', 'Smith áéñ ', 'sales@greencommunications.com', '788', 'Green Communications', null, null, null, null, null, null, null, '3', '', '2016-08-12 14:57:10', '2016-08-12 14:16:46', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('61', '31629', 'sales@greencommunications.com', ' ñame', 'Smith áéñ ', 'sales@greencommunications.com', '788', 'Green Communications', null, null, null, null, null, null, null, '3', '', '2016-08-12 17:34:26', '2016-08-12 16:54:02', '2', 'es');
INSERT INTO `deal_submitter` VALUES ('62', '31629', 'sales@greencommunications.com', ' ñame', 'Smith áéñ ', 'sales@greencommunications.com', '788', 'Green Communications', null, null, null, null, null, null, null, '3', '', '2016-08-15 10:19:33', '2016-08-15 09:39:09', '2', 'es');

-- ----------------------------
-- Table structure for deal_threads
-- ----------------------------
DROP TABLE IF EXISTS `deal_threads`;
CREATE TABLE `deal_threads` (
  `id` int(11) NOT NULL,
  `permalink` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_commentable` tinyint(1) NOT NULL,
  `num_comments` int(11) NOT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of deal_threads
-- ----------------------------
INSERT INTO `deal_threads` VALUES ('38', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '7', '2016-08-01 16:04:47');
INSERT INTO `deal_threads` VALUES ('39', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '0', null);
INSERT INTO `deal_threads` VALUES ('40', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/edit/40', '1', '2', '2016-08-01 17:04:38');
INSERT INTO `deal_threads` VALUES ('41', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '0', null);
INSERT INTO `deal_threads` VALUES ('42', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '0', null);
INSERT INTO `deal_threads` VALUES ('43', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/43/comments', '1', '6', '2016-08-01 17:20:54');
INSERT INTO `deal_threads` VALUES ('44', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '1', '2016-07-29 15:03:25');
INSERT INTO `deal_threads` VALUES ('45', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '1', '2016-08-01 17:03:57');
INSERT INTO `deal_threads` VALUES ('46', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '2', '2016-07-29 12:08:13');
INSERT INTO `deal_threads` VALUES ('47', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '5', '2016-08-01 17:28:56');
INSERT INTO `deal_threads` VALUES ('48', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/48/comments', '1', '1', '2016-08-04 14:33:03');
INSERT INTO `deal_threads` VALUES ('49', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/49/comments', '1', '0', null);
INSERT INTO `deal_threads` VALUES ('50', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/50/comments', '1', '1', '2016-08-04 14:36:26');
INSERT INTO `deal_threads` VALUES ('51', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '0', null);
INSERT INTO `deal_threads` VALUES ('52', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '16', '2016-08-05 16:03:11');
INSERT INTO `deal_threads` VALUES ('53', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/53/comments', '1', '10', '2016-08-12 16:45:21');
INSERT INTO `deal_threads` VALUES ('54', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/list', '1', '1', '2016-08-12 17:35:00');
INSERT INTO `deal_threads` VALUES ('55', 'http://toshibadr.developerplace.net/app_dev.php/es/hp_bc/deal/55/comments', '1', '4', '2016-08-15 10:33:40');

-- ----------------------------
-- Table structure for deal_won_support
-- ----------------------------
DROP TABLE IF EXISTS `deal_won_support`;
CREATE TABLE `deal_won_support` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_493C2EB0F60E2305` (`deal_id`) USING BTREE,
  CONSTRAINT `FK_493C2EB0F60E2305` FOREIGN KEY (`deal_id`) REFERENCES `deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of deal_won_support
-- ----------------------------
INSERT INTO `deal_won_support` VALUES ('1', '38', 'loyalty.pdf', '38-57913a586e27f.pdf', '2016-07-21 17:10:48');
INSERT INTO `deal_won_support` VALUES ('2', '39', 'campo_phone_registro.png', '39-5791412e07ba6.png', '2016-07-21 17:39:58');
INSERT INTO `deal_won_support` VALUES ('3', '41', 'lambda_lambda_lambda_square_sticker_3quot_x_3qu.jpg', '41-579146c2189b0.jpg', '2016-07-21 18:03:46');
INSERT INTO `deal_won_support` VALUES ('4', '40', 'marketing_kit_sp.pdf', '40-5791484ac4bb5.pdf', '2016-07-21 18:10:18');
INSERT INTO `deal_won_support` VALUES ('5', '42', '2015-11-05 14_51_05-HP EngageandGrow - Internet Explorer.png', '42-57914f390dcae.png', '2016-07-21 18:12:35');
INSERT INTO `deal_won_support` VALUES ('6', '43', 'optimeLogo.jpeg', '43-57914c2f9f8fb.jpeg', '2016-07-21 18:26:55');
INSERT INTO `deal_won_support` VALUES ('7', '50', '_90125851_6108-06l.jpg', '50-57a3a50e55863.jpg', '2016-08-04 16:26:54');
INSERT INTO `deal_won_support` VALUES ('8', '52', '006_charizard___pokedex_by_mnrart-d4kqoev.gif', '52-57a3a5f805cce.gif', '2016-08-04 16:30:48');
INSERT INTO `deal_won_support` VALUES ('9', '55', 'campo_phone_registro.png', '55-57b1d1fff38e5.png', '2016-08-15 10:30:23');
INSERT INTO `deal_won_support` VALUES ('10', '54', 'error_page_deal_registration.png', '54-57cd8f7c2596b.png', '2016-09-05 11:30:04');
INSERT INTO `deal_won_support` VALUES ('11', '47', 'error_page_deal_registration.png', '47-57cd927674e72.png', '2016-09-05 11:42:46');

-- ----------------------------
-- Table structure for email_template
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `test_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `string_content` longtext COLLATE utf8_unicode_ci,
  `active` tinyint(1) NOT NULL,
  `layout` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9C0600CA77153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of email_template
-- ----------------------------
INSERT INTO `email_template` VALUES ('1', 'deal.delete', 'N;', '2017-04-04 17:25:27', '2017-09-13 16:16:15', 'Delete - HPI-VIP50', '<p><strong>Dear {{firstname}}&nbsp;{{lastname}},</strong><br />\r\n<br />\r\nInvoice Deleted<br />\r\n', null, '1', 'default.html.twig');
INSERT INTO `email_template` VALUES ('2', 'deal.approve', 'N;', '2017-04-04 17:25:27', '2017-09-13 16:16:20', 'Approve - HPI-VIP50', '<p><strong>Dear {{firstname}}&nbsp;{{lastname}},</strong><br />\r\n<br />\r\nInvoice Deleted<br />\r\n', null, '1', 'default.html.twig');
INSERT INTO `email_template` VALUES ('3', 'deal.rejected', 'N;', '2017-04-04 17:25:27', '2017-09-13 16:17:34', 'Rejected - HPI-VIP50', '<p><strong>Dear {{firstname}}&nbsp;{{lastname}},</strong><br />\r\n<br />\r\nInvoice Deleted<br />\r\n', null, '1', 'default.html.twig');

-- ----------------------------
-- Table structure for emails
-- ----------------------------
DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_template_id` int(11) DEFAULT NULL,
  `recipients` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `failed_recipients` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:simple_array)',
  `status` smallint(6) NOT NULL,
  `statusMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_4C81E852131A730F` (`email_template_id`),
  CONSTRAINT `FK_4C81E852131A730F` FOREIGN KEY (`email_template_id`) REFERENCES `email_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of emails
-- ----------------------------

-- ----------------------------
-- Table structure for ext_translations
-- ----------------------------
DROP TABLE IF EXISTS `ext_translations`;
CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ext_translations
-- ----------------------------

-- ----------------------------
-- Table structure for fos_user
-- ----------------------------
DROP TABLE IF EXISTS `fos_user`;
CREATE TABLE `fos_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_company_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `loyalty_id` int(11) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `job_title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `registered` tinyint(1) DEFAULT '1',
  `registration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_957A647992FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_957A6479A0D96FBF` (`email_canonical`),
  KEY `IDX_957A64797685BB33` (`deal_company_id`),
  KEY `IDX_957A6479F92F3E70` (`country_id`),
  KEY `IDX_957A6479C906750D` (`loyalty_id`),
  CONSTRAINT `FK_957A64797685BB33` FOREIGN KEY (`deal_company_id`) REFERENCES `deal_company` (`id`),
  CONSTRAINT `FK_957A6479C906750D` FOREIGN KEY (`loyalty_id`) REFERENCES `loyalty` (`id`),
  CONSTRAINT `FK_957A6479F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of fos_user
-- ----------------------------
INSERT INTO `fos_user` VALUES ('1', '40', null, null, 'jaguilar', 'jaguilar', 'jaguilar@optimeconsulting.com', 'jaguilar@optimeconsulting.com', '1', 'nf5cuksc6kgwko8kg0w0g8cccogckc0', '$2y$13$nf5cuksc6kgwko8kg0w0guLZMyD6xJdVRGVBm8pK2X5ubDlK..Ix2', '2018-12-10 10:04:01', '0', '0', null, null, null, 'a:1:{i:0;s:16:\"ROLE_SUPER_ADMIN\";}', '0', null, 'Jeenson', 'Aguilar', '', '0', null);
INSERT INTO `fos_user` VALUES ('2', '42', null, null, 'lmelo@hotmail.com', 'lmelo@hotmail.com', 'lmelo@hotmail.com', 'lmelo@hotmail.com', '1', 'mfkzf0wmce84o8goo4c0ggskww0scgs', '$2y$13$mfkzf0wmce84o8goo4c0gejxDA711jYozrdvn6GYgTjUIyXOg0Aty', '2017-09-27 23:13:10', '0', '0', null, null, null, 'a:0:{}', '0', null, 'leidy', 'paola', '', '0', null);
INSERT INTO `fos_user` VALUES ('3', '42', '2', null, 'payuso@opt.com', 'payuso@opt.com', 'payuso@opt.com', 'payuso@opt.com', '1', '9cxzz27llf0o0kogsk04wgkoggso8o4', '$2y$13$9cxzz27llf0o0kogsk04weuaCzCfLmfsrV4JR3RahFu5lBRr3CFje', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Patricia', 'Ayuso', 'Director departamento de programacion', '0', null);
INSERT INTO `fos_user` VALUES ('5', '62', '2', null, 'wgonzalezac@gmail.com', 'wgonzalezac@gmail.com', 'wgonzalezac@gmail.com', 'wgonzalezac@gmail.com', '1', 'izdl96prhvwoc0k0wcgo8ksgk084k0k', '$2y$13$mfkzf0wmce84o8goo4c0geUjEPtGupv3Jx3skecTvLhruXE.XEQzm', '2017-09-27 14:36:54', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Wilfredo', 'Gonzalez', 'DEV', '0', null);
INSERT INTO `fos_user` VALUES ('6', '42', '2', null, 'jaguilar@opt.com', 'jaguilar@opt.com', 'jaguilar@opt.com', 'jaguilar@opt.com', '1', 'l6zaocqhaxc80wgk4csw4w8g0kggoks', '$2y$13$l6zaocqhaxc80wgk4csw4uyK/gI6bhA.A8y5csTKe7xyHXbrFtkX6', '2017-09-27 17:58:09', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Jeenson', 'Aguilar', 'Programador', '0', null);
INSERT INTO `fos_user` VALUES ('7', '42', '2', null, 'ja@opt.com', 'ja@opt.com', 'ja@opt.com', 'ja@opt.com', '1', 'e0m1raqbicoosocs848gk8kog4sk0ww', '$2y$13$e0m1raqbicoosocs848gkuL6FuwUK1aZ5Q4kQqkAskGAVP7OHVIyy', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Jeenson', 'Aguilar', 'Programador', '0', null);
INSERT INTO `fos_user` VALUES ('8', '46', '2', null, 'jac@opt.com', 'jac@opt.com', 'jac@opt.com', 'jac@opt.com', '1', '290puf1ziaas88wc8cwookwwccw4wgc', '$2y$13$290puf1ziaas88wc8cwooeDcufhiBafxCBaLS7SZnrKbh/1YMHr/u', '2017-09-11 10:35:20', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Jaguilar', 'Aguilar', 'Programador', '0', null);
INSERT INTO `fos_user` VALUES ('9', '63', '2', null, 'gpalm@opt.com', 'gpalm@opt.com', 'gpalm@opt.com', 'gpalm@opt.com', '1', 'errbxz3vzhss04wo404wggkgwocgskc', '$2y$13$errbxz3vzhss04wo404wgeRKD51h6MNiMtoJts8y2BoC1/ZBY6Q0G', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Geraldine', 'Palm', 'INfraestrucura', '0', null);
INSERT INTO `fos_user` VALUES ('10', '45', '2', null, 'mcarvajal@opt.com', 'mcarvajal@opt.com', 'mcarvajal@opt.com', 'mcarvajal@opt.com', '1', 'j1s2nkcydvcw408kckoccccgskwo8k4', '$2y$13$j1s2nkcydvcw408kckoccOgE1UFqbPSUu64B.EB9Zpyearp4HzWji', '2017-09-12 10:29:15', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Martha', 'Carvajar', 'Program manager', '0', null);
INSERT INTO `fos_user` VALUES ('11', '63', '2', null, 'jv@opt.com', 'jv@opt.com', 'jv@opt.com', 'jv@opt.com', '1', 'jvdk66wn46os4wow8kk00wg4sw4sc48', '$2y$13$jvdk66wn46os4wow8kk00ux03KZin4MOXOukuVCZamp8aR7179NJG', '2017-09-13 19:06:48', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Javier', 'Mijares', 'Programador', '0', null);
INSERT INTO `fos_user` VALUES ('12', '64', '2', null, 'gp@opt.com', 'gp@opt.com', 'gp@opt.com', 'gp@opt.com', '1', 'fxyb9azleqgcwgo8408wgss8ogo84gg', '$2y$13$fxyb9azleqgcwgo8408wge0MLBhhGz2LjqvpuRLdACbUkC8uHorrC', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Guillermo', 'Palm', 'Director', '0', null);
INSERT INTO `fos_user` VALUES ('13', '47', '2', null, 'mcarvajal@optimeconsulting.com', 'mcarvajal@optimeconsulting.com', 'mcarvajal@optimeconsulting.com', 'mcarvajal@optimeconsulting.com', '1', 'nf5cuksc6kgwko8kg0w0g8cccogckc0', '$2y$13$nf5cuksc6kgwko8kg0w0guX61sDL3r79VrkLs4rXRUNKsk4m5mrcS', '2017-09-18 09:33:02', '0', '0', null, 'oTiATuhbBd2cQcsn3kW_LPhb6jJjuf-6k_Ti_0vUZoE', '2017-10-18 15:26:53', 'a:1:{i:0;s:13:\"ROLE_APPROVER\";}', '0', null, 'Martha', 'Carvajal', 'project manager', '0', null);
INSERT INTO `fos_user` VALUES ('14', '65', '2', null, 'jperez@opt.com', 'jperez@opt.com', 'jperez@opt.com', 'jperez@opt.com', '1', 'k0tknwy2apcokog00sok4048kk04gc0', '$2y$13$k0tknwy2apcokog00sok4uTZW9.4mRh2EMbyyGaoFRDul2D0rF3eK', '2017-09-15 15:39:52', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Juan', 'Perez', 'Gerente', '0', null);
INSERT INTO `fos_user` VALUES ('15', '66', '2', null, 'MARTILU1302@GMAIL.COM', 'martilu1302@gmail.com', 'MARTILU1302@GMAIL.COM', 'martilu1302@gmail.com', '1', '6y26jcg4xfcw0kkcccoosog848gks4k', '$2y$13$6y26jcg4xfcw0kkcccooseP2uKFF1wkfh0NV6jfBT9LVo8tHD8c/6', '2017-09-21 11:21:30', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Martha', 'carvajal', 'project manager', '0', null);
INSERT INTO `fos_user` VALUES ('16', '65', '2', null, 'hgonzalez@opt.com', 'hgonzalez@opt.com', 'hgonzalez@opt.com', 'hgonzalez@opt.com', '1', 'sfjd3k7nk9w4wcc0gswgowgc8gswcsg', '$2y$13$sfjd3k7nk9w4wcc0gswgoudvZ5Iz3ndxauX7TbH9YQ0IlJYbCZbX.', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Hermes', 'Gonzalez', 'Desarrollador', '0', null);
INSERT INTO `fos_user` VALUES ('17', '67', '2', null, 'hgonzalez@op.com', 'hgonzalez@op.com', 'hgonzalez@op.com', 'hgonzalez@op.com', '1', 'kcz2vd05zggw40scgw8cook80o8g00s', '$2y$13$nf5cuksc6kgwko8kg0w0guLZMyD6xJdVRGVBm8pK2X5ubDlK..Ix2', '2017-10-18 16:01:43', '0', '0', null, null, null, 'a:0:{}', '0', null, 'Hermes', 'Gonzalez', 'Desarrollador', '0', null);
INSERT INTO `fos_user` VALUES ('18', '42', '2', null, 'prueba1@hotmail.com', 'prueba1@hotmail.com', 'prueba1@hotmail.com', 'prueba1@hotmail.com', '1', 'f0lu38697k84o80o84c00occk8cwg4k', '$2y$13$f0lu38697k84o80o84c00e39iNPahHa1M15jBz8xUPC4wt/gRvdjK', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Prueba1', 'Prueba1', 'test', '1', '2017-11-29 11:20:05');
INSERT INTO `fos_user` VALUES ('19', '44', '2', null, 'prueba2@hotmail.com', 'prueba2@hotmail.com', 'prueba2@hotmail.com', 'prueba2@hotmail.com', '1', 'm267ystvt80o04gg4wsg0o04s0kwg8c', '$2y$13$m267ystvt80o04gg4wsg0e9ZF0rt8yAyWW7X/u9vGw3GQblkGiF8S', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Prueba1', 'Prueba2', 'test2', '1', '2017-11-29 11:20:58');
INSERT INTO `fos_user` VALUES ('20', '68', '2', null, 'prueba3@hotmail.com', 'prueba3@hotmail.com', 'prueba3@hotmail.com', 'prueba3@hotmail.com', '1', 'sud8zm7rd9ckkccko08gsk0gw4gw4sw', '$2y$13$sud8zm7rd9ckkccko08gserRaF4oUwQx4QXB2akHj3lkSUPTlzs7.', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Prueba3', 'Prueba3', 'test3', '1', '2017-11-29 11:21:54');
INSERT INTO `fos_user` VALUES ('21', '69', '2', null, 'prueba4@hotmail.com', 'prueba4@hotmail.com', 'prueba4@hotmail.com', 'prueba4@hotmail.com', '1', 'ogblgzfqlhwoww0k44gw4swccs40ggs', '$2y$13$ogblgzfqlhwoww0k44gw4ebJmtUINVynUTmGZBY.6mQy/kCGUF2ry', null, '0', '0', null, null, null, 'a:0:{}', '0', null, 'Prueba4', 'Prueba4', 'test4', '1', '2017-11-29 11:22:41');

-- ----------------------------
-- Table structure for loyalty
-- ----------------------------
DROP TABLE IF EXISTS `loyalty`;
CREATE TABLE `loyalty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `wsdl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encrypter_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_active` tinyint(1) NOT NULL,
  `sso_username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sso_private_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sso_base_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `configuration` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_7CC7119677153098` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of loyalty
-- ----------------------------
INSERT INTO `loyalty` VALUES ('2', 'hp_bc', 'HP VIP Club', '', 'test', 'test', 'fd0552b24bf59732a71b8472fb02822416f3920a', '2016-05-02 14:42:47', '2017-09-06 15:13:56', '1', 'deal', 'optime1234', '', 'a:3:{s:6:\"assets\";a:2:{s:3:\"css\";a:4:{i:0;s:17:\"css/open-sans.css\";i:1;s:13:\"css/style.css\";i:2;s:15:\"css/loyalty.css\";i:3;s:15:\"css/hp_base.css\";}s:2:\"js\";a:1:{i:0;s:8:\"js/hp.js\";}}s:5:\"roles\";a:2:{s:14:\"ROLE_SUBMITTER\";a:1:{i:0;s:18:\"ROLE_OPTIME_MASTER\";}s:13:\"ROLE_APPROVER\";a:1:{i:0;s:18:\"ROLE_OPTIME_MASTER\";}}s:8:\"approver\";a:3:{s:2:\"id\";i:11081;s:10:\"company_id\";i:59;s:5:\"email\";s:34:\"hpadminoptime@optimeconsulting.com\";}}');

-- ----------------------------
-- Table structure for loyalty_countries
-- ----------------------------
DROP TABLE IF EXISTS `loyalty_countries`;
CREATE TABLE `loyalty_countries` (
  `loyalty_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`loyalty_id`,`country_id`),
  UNIQUE KEY `UNIQ_3C5F105DF92F3E70` (`country_id`) USING BTREE,
  KEY `IDX_3C5F105DC906750D` (`loyalty_id`) USING BTREE,
  CONSTRAINT `FK_3C5F105DC906750D` FOREIGN KEY (`loyalty_id`) REFERENCES `loyalty` (`id`),
  CONSTRAINT `FK_3C5F105DF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of loyalty_countries
-- ----------------------------
INSERT INTO `loyalty_countries` VALUES ('2', '2');

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` enum('Home','Office','Fax','Mobile') COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `area_code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('1', 'Office', '12', '123', '123123123', '2017-09-04 21:22:05', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('2', 'Mobile', '12', '123', '1231231qwe', '2017-09-04 21:22:05', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('3', 'Office', '01', '57', '3124245987', '2017-09-08 14:52:08', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('4', 'Mobile', '01', '05', '3911911', '2017-09-08 14:52:08', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('5', 'Office', '01', '57', '3124245987', '2017-09-09 12:20:27', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('6', 'Mobile', '01', '05', '3911911', '2017-09-09 12:20:27', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('7', 'Office', '01', '57', '3124245987', '2017-09-09 22:14:00', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('8', 'Mobile', '01', '05', '3911911', '2017-09-09 22:14:00', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('9', 'Office', '01', '57', '3124245987', '2017-09-09 22:36:50', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('10', 'Mobile', '01', '05', '3911911', '2017-09-09 22:36:50', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('11', 'Office', '01', '57', '12456789', '2017-09-12 10:21:57', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('12', 'Mobile', '01', '51', '124568', '2017-09-12 10:21:57', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('13', 'Office', '01', '57', '3124245987', '2017-09-12 17:43:06', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('14', 'Mobile', '01', '05', '3911911', '2017-09-12 17:43:06', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('15', 'Office', '01', '57', '3124245987', '2017-09-12 17:46:14', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('16', 'Mobile', '01', '05', '3911911', '2017-09-12 17:46:14', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('17', 'Office', '01', '786', '7570775', '2017-09-13 09:08:38', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('18', 'Mobile', '01', '786', '7570775', '2017-09-13 09:08:38', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('19', 'Office', '01', '57', '3124245987', '2017-09-15 10:15:07', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('20', 'Mobile', '01', '05', '3911911', '2017-09-15 10:15:07', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('21', 'Office', '01', '786', '7570775', '2017-09-15 15:51:28', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('22', 'Mobile', '01', '786', '7570775', '2017-09-15 15:51:28', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('23', 'Office', '57', '91', '2456381', '2017-09-29 17:30:48', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('24', 'Mobile', '57', '91', '3217814522', '2017-09-29 17:30:48', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('25', 'Office', '57', '91', '2457852', '2017-09-29 17:44:37', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('26', 'Mobile', '57', '91', '3217814522', '2017-09-29 17:44:37', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('27', 'Office', '57', '0', '3125451425', '2017-11-29 11:20:06', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('28', 'Mobile', '57', '0', '3125451425', '2017-11-29 11:20:06', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('29', 'Office', '57', '0', '3125451425', '2017-11-29 11:20:59', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('30', 'Mobile', '57', '0', '3125451425', '2017-11-29 11:20:59', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('31', 'Office', '57', '0', '3125451425', '2017-11-29 11:21:55', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('32', 'Mobile', '57', '0', '3125451425', '2017-11-29 11:21:55', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('33', 'Office', '57', '0', '3125451425', '2017-11-29 11:22:42', null, 'PhoneUser');
INSERT INTO `phone` VALUES ('34', 'Mobile', '57', '0', '3125451425', '2017-11-29 11:22:42', null, 'PhoneUser');

-- ----------------------------
-- Table structure for phone_user
-- ----------------------------
DROP TABLE IF EXISTS `phone_user`;
CREATE TABLE `phone_user` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6E97845BA76ED395` (`user_id`),
  CONSTRAINT `FK_6E97845BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user` (`id`),
  CONSTRAINT `FK_6E97845BBF396750` FOREIGN KEY (`id`) REFERENCES `phone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of phone_user
-- ----------------------------
INSERT INTO `phone_user` VALUES ('1', '5');
INSERT INTO `phone_user` VALUES ('2', '5');
INSERT INTO `phone_user` VALUES ('3', '6');
INSERT INTO `phone_user` VALUES ('4', '6');
INSERT INTO `phone_user` VALUES ('5', '7');
INSERT INTO `phone_user` VALUES ('6', '7');
INSERT INTO `phone_user` VALUES ('7', '8');
INSERT INTO `phone_user` VALUES ('8', '8');
INSERT INTO `phone_user` VALUES ('9', '9');
INSERT INTO `phone_user` VALUES ('10', '9');
INSERT INTO `phone_user` VALUES ('11', '10');
INSERT INTO `phone_user` VALUES ('12', '10');
INSERT INTO `phone_user` VALUES ('13', '11');
INSERT INTO `phone_user` VALUES ('14', '11');
INSERT INTO `phone_user` VALUES ('15', '12');
INSERT INTO `phone_user` VALUES ('16', '12');
INSERT INTO `phone_user` VALUES ('17', '13');
INSERT INTO `phone_user` VALUES ('18', '13');
INSERT INTO `phone_user` VALUES ('19', '14');
INSERT INTO `phone_user` VALUES ('20', '14');
INSERT INTO `phone_user` VALUES ('21', '15');
INSERT INTO `phone_user` VALUES ('22', '15');
INSERT INTO `phone_user` VALUES ('23', '16');
INSERT INTO `phone_user` VALUES ('24', '16');
INSERT INTO `phone_user` VALUES ('25', '17');
INSERT INTO `phone_user` VALUES ('26', '17');
INSERT INTO `phone_user` VALUES ('27', '18');
INSERT INTO `phone_user` VALUES ('28', '18');
INSERT INTO `phone_user` VALUES ('29', '19');
INSERT INTO `phone_user` VALUES ('30', '19');
INSERT INTO `phone_user` VALUES ('31', '20');
INSERT INTO `phone_user` VALUES ('32', '20');
INSERT INTO `phone_user` VALUES ('33', '21');
INSERT INTO `phone_user` VALUES ('34', '21');

-- ----------------------------
-- Table structure for state
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `IDX_A393D2FBF92F3E70` (`country_id`),
  CONSTRAINT `FK_A393D2FBF92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO `state` VALUES ('1', '1', 'Aragua', 'VE.01', '1', '2015-08-17 16:16:37', '2015-08-17 16:27:48');
INSERT INTO `state` VALUES ('2', '5', 'Region de Valparaiso', 'CL.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('3', '5', 'Region Aisen del General Carlos Ibanez del Campo', 'CL.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('4', '5', 'Region de Antofagasta', 'CL.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('5', '5', 'Region de la Araucania', 'CL.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('6', '5', 'Region de Atacama', 'CL.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('7', '5', 'Region del Biobio', 'CL.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('8', '5', 'Region de Coquimbo', 'CL.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('9', '5', 'Region del Libertador General Bernardo O\'Higgins', 'CL.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('10', '5', 'Region de Magallanes y de la Antartica Chilena', 'CL.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('11', '5', 'Region del Maule', 'CL.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('12', '5', 'Region Metropolitana de Santiago', 'CL.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('13', '5', 'Region de Los Lagos', 'CL.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('14', '5', 'Region de Tarapaca', 'CL.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('15', '5', 'Region de Arica y Parinacota', 'CL.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('16', '5', 'Region de Los Rios', 'CL.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('17', '3', 'Departamento del Amazonas', 'CO.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('18', '3', 'Departamento de Antioquia', 'CO.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('19', '3', 'Departamento de Arauca', 'CO.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('20', '3', 'Atlantico', 'CO.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('21', '3', 'Departamento del Caqueta', 'CO.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('22', '3', 'Departamento del Cauca', 'CO.09', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('23', '3', 'Departamento del Cesar', 'CO.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('24', '3', 'Departamento del Choco', 'CO.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('25', '3', 'Departamento de Cordoba', 'CO.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('26', '3', 'Departamento del Guaviare', 'CO.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('27', '3', 'Departamento del Guainia', 'CO.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('28', '3', 'Departamento del Huila', 'CO.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('29', '3', 'Departamento de La Guajira', 'CO.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('30', '3', 'Departamento del Meta', 'CO.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('31', '3', 'Departamento de Narino', 'CO.20', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('32', '3', 'Departamento de Norte de Santander', 'CO.21', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('33', '3', 'Departamento del Putumayo', 'CO.22', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('34', '3', 'Departamento del Quindio', 'CO.23', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('35', '3', 'Departamento de Risaralda', 'CO.24', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('36', '3', 'Providencia y Santa Catalina, Departamento de Archipielago de San Andres', 'CO.25', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('37', '3', 'Departamento de Santander', 'CO.26', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('38', '3', 'Departamento de Sucre', 'CO.27', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('39', '3', 'Departamento de Tolima', 'CO.28', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('40', '3', 'Departamento del Valle del Cauca', 'CO.29', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('41', '3', 'Departamento del Vaupes', 'CO.30', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('42', '3', 'Departamento del Vichada', 'CO.31', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('43', '3', 'Departamento de Casanare', 'CO.32', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('44', '3', 'Cundinamarca', 'CO.33', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('45', '3', 'Bogota D.C.', 'CO.34', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('46', '3', 'Departamento de Bolivar', 'CO.35', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('47', '3', 'Departamento de Boyaca', 'CO.36', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('48', '3', 'Departamento de Caldas', 'CO.37', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('49', '3', 'Departamento del Magdalena', 'CO.38', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('50', '6', 'Provincia de Alajuela', 'CR.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('51', '6', 'Provincia de Cartago', 'CR.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('52', '6', 'Provincia de Guanacaste', 'CR.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('53', '6', 'Provincia de Heredia', 'CR.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('54', '6', 'Provincia de Limon', 'CR.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('55', '6', 'Provincia de Puntarenas', 'CR.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('56', '6', 'Provincia de San Jose', 'CR.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('57', '11', 'Provincia de Galapagos', 'EC.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('58', '11', 'Provincia del Azuay', 'EC.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('59', '11', 'Provincia de Bolivar', 'EC.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('60', '11', 'Provincia del Canar', 'EC.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('61', '11', 'Provincia del Carchi', 'EC.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('62', '11', 'Provincia del Chimborazo', 'EC.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('63', '11', 'Provincia de Cotopaxi', 'EC.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('64', '11', 'Provincia de El Oro', 'EC.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('65', '11', 'Provincia de Esmeraldas', 'EC.09', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('66', '11', 'Provincia del Guayas', 'EC.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('67', '11', 'Provincia de Imbabura', 'EC.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('68', '11', 'Provincia de Loja', 'EC.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('69', '11', 'Provincia de Los Rios', 'EC.13', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('70', '11', 'Provincia de Manabi', 'EC.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('71', '11', 'Provincia de Morona Santiago', 'EC.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('72', '11', 'Provincia del Pastaza', 'EC.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('73', '11', 'Provincia de Pichincha', 'EC.18', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('74', '11', 'Provincia del Tungurahua', 'EC.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('75', '11', 'Provincia de Zamora Chinchipe', 'EC.20', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('76', '11', 'Provincia de Sucumbios', 'EC.22', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('77', '11', 'Provincia de Napo', 'EC.23', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('78', '11', 'Provincia de Francisco de Orellana', 'EC.24', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('79', '11', 'Provincia de Santa Elena', 'EC.25', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('80', '11', 'Provincia de Santo Domingo de los Tsachilas', 'EC.26', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('81', '8', 'Banjul', 'GM.01', '1', '2015-09-05 00:00:00', '2015-09-05 13:10:23');
INSERT INTO `state` VALUES ('82', '8', 'Division Río Bajo', 'GM.02', '1', '2015-09-05 00:00:00', '2015-09-05 13:10:48');
INSERT INTO `state` VALUES ('83', '8', 'Division Río Central', 'GM.03', '1', '2015-09-05 00:00:00', '2015-09-05 13:10:46');
INSERT INTO `state` VALUES ('84', '8', 'Division Río Arriba', 'GM.04', '1', '2015-09-05 00:00:00', '2015-09-05 13:10:57');
INSERT INTO `state` VALUES ('85', '8', 'Division Oeste', 'GM.05', '1', '2015-09-05 00:00:00', '2015-09-05 13:11:05');
INSERT INTO `state` VALUES ('86', '8', 'Division Banco Norte', 'GM.07', '1', '2015-09-05 00:00:00', '2015-09-05 13:11:14');
INSERT INTO `state` VALUES ('87', '2', 'Aguascalientes', 'MX.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('88', '2', 'Estado de Baja California', 'MX.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('89', '2', 'Baja California Sur', 'MX.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('90', '2', 'Campeche', 'MX.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('91', '2', 'Chiapas', 'MX.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('92', '2', 'Chihuahua', 'MX.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('93', '2', 'Coahuila', 'MX.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('94', '2', 'Colima', 'MX.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('95', '2', 'Distrito Federal', 'MX.09', '1', '2015-09-05 00:00:00', '2015-09-05 13:11:20');
INSERT INTO `state` VALUES ('96', '2', 'Durango', 'MX.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('97', '2', 'Guanajuato', 'MX.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('98', '2', 'Guerrero', 'MX.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('99', '2', 'Hidalgo', 'MX.13', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('100', '2', 'Jalisco', 'MX.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('101', '2', 'Estado de Mexico', 'MX.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('102', '2', 'Michoacan', 'MX.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('103', '2', 'Morelos', 'MX.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('104', '2', 'Nayarit', 'MX.18', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('105', '2', 'Nuevo Leon', 'MX.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('106', '2', 'Oaxaca', 'MX.20', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('107', '2', 'Puebla', 'MX.21', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('108', '2', 'Queretaro', 'MX.22', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('109', '2', 'Quintana Roo', 'MX.23', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('110', '2', 'San Luis Potosi', 'MX.24', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('111', '2', 'Sinaloa', 'MX.25', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('112', '2', 'Sonora', 'MX.26', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('113', '2', 'Tabasco', 'MX.27', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('114', '2', 'Tamaulipas', 'MX.28', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('115', '2', 'Tlaxcala', 'MX.29', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('116', '2', 'Estado de Veracruz-Llave', 'MX.30', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('117', '2', 'Yucatan', 'MX.31', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('118', '2', 'Zacatecas', 'MX.32', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('119', '7', 'Provincia de Bocas del Toro', 'PA.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('120', '7', 'Provincia de Chiriqui', 'PA.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('121', '7', 'Provincia de Cocle', 'PA.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('122', '7', 'Provincia de Colon', 'PA.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('123', '7', 'Provincia del Darien', 'PA.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('124', '7', 'Provincia de Herrera', 'PA.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('125', '7', 'Provincia de Los Santos', 'PA.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('126', '7', 'Provincia de Panama', 'PA.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('127', '7', 'Kuna Yala', 'PA.09', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('128', '7', 'Provincia de Veraguas', 'PA.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('129', '7', 'Embera-Wounaan', 'PA.EM', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('130', '7', 'Ngoebe-Bugle', 'PA.NB', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('131', '4', 'Departamento de Amazonas', 'PE.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('132', '4', 'Departamento de Ancash', 'PE.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('133', '4', 'Departamento de Apurimac', 'PE.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('134', '4', 'Departamento de Arequipa', 'PE.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('135', '4', 'Departamento de Ayacucho', 'PE.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('136', '4', 'Departamento de Cajamarca', 'PE.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('137', '4', 'Provincia Constitucional del Callao', 'PE.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('138', '4', 'Departamento de Cusco', 'PE.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('139', '4', 'Departamento de Huancavelica', 'PE.09', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('140', '4', 'Departamento de Huanuco', 'PE.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('141', '4', 'Departamento de Ica', 'PE.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('142', '4', 'Departamento de Junin', 'PE.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('143', '4', 'Departamento de La Libertad', 'PE.13', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('144', '4', 'Departamento de Lambayeque', 'PE.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('145', '4', 'Departamento de Lima', 'PE.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('146', '4', 'Departamento de Loreto', 'PE.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('147', '4', 'Departamento de Madre de Dios', 'PE.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('148', '4', 'Departamento de Moquegua', 'PE.18', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('149', '4', 'Departamento de Pasco', 'PE.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('150', '4', 'Departamento de Piura', 'PE.20', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('151', '4', 'Departamento de Puno', 'PE.21', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('152', '4', 'Departamento de San Martin', 'PE.22', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('153', '4', 'Departamento de Tacna', 'PE.23', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('154', '4', 'Departamento de Tumbes', 'PE.24', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('155', '4', 'Departamento de Ucayali', 'PE.25', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('156', '4', 'Provincia de Lima', 'PE.LMA', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('157', '10', 'Departamento del Alto Parana', 'PY.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('158', '10', 'Departamento del Amambay', 'PY.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('159', '10', 'Departamento de Caaguazu', 'PY.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('160', '10', 'Departamento de Caazapa', 'PY.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('161', '10', 'Departamento Central', 'PY.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('162', '10', 'Departamento de Concepcion', 'PY.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('163', '10', 'Departamento de la Cordillera', 'PY.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('164', '10', 'Departamento del Guaira', 'PY.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('165', '10', 'Departamento de Itapua', 'PY.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('166', '10', 'Departamento de Misiones', 'PY.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('167', '10', 'Departamento de Neembucu', 'PY.13', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('168', '10', 'Departamento de Paraguari', 'PY.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('169', '10', 'Departamento de Presidente Hayes', 'PY.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('170', '10', 'Departamento de San Pedro', 'PY.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('171', '10', 'Departamento de Canindeyu', 'PY.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('172', '10', 'Asuncion', 'PY.22', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('173', '10', 'Departamento de Alto Paraguay', 'PY.23', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('174', '10', 'Departamento de Boqueron', 'PY.24', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('175', '9', 'Artigas', 'UY.01', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('176', '9', 'Canelones', 'UY.02', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('177', '9', 'Cerro Largo', 'UY.03', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('178', '9', 'Colonia', 'UY.04', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('179', '9', 'Departamento de Durazno', 'UY.05', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('180', '9', 'Departamento de Flores', 'UY.06', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('181', '9', 'Florida', 'UY.07', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('182', '9', 'Lavalleja', 'UY.08', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('183', '9', 'Maldonado', 'UY.09', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('184', '9', 'Departamento de Montevideo', 'UY.10', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('185', '9', 'Departamento de Paysandu', 'UY.11', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('186', '9', 'Departamento de Rio Negro', 'UY.12', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('187', '9', 'Departamento de Rivera', 'UY.13', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('188', '9', 'Departamento de Rocha', 'UY.14', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('189', '9', 'Departamento de Salto', 'UY.15', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('190', '9', 'Departamento de San Jose', 'UY.16', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('191', '9', 'Soriano', 'UY.17', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('192', '9', 'Departamento de Tacuarembo', 'UY.18', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');
INSERT INTO `state` VALUES ('193', '9', 'Departamento de Treinta y Tres', 'UY.19', '1', '2015-09-05 00:00:00', '2015-09-05 00:00:00');

-- ----------------------------
-- Table structure for translation_bundle_translation
-- ----------------------------
DROP TABLE IF EXISTS `translation_bundle_translation`;
CREATE TABLE `translation_bundle_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new` tinyint(1) NOT NULL,
  `autogenerated` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `trans_values` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `files` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_changed` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of translation_bundle_translation
-- ----------------------------
INSERT INTO `translation_bundle_translation` VALUES ('1', 'label.authentication_error.message', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:94:\"\nAn authorization problem has occurred, so it is not possible to display the current resource.\";s:2:\"es\";s:96:\"Ha ocurrido un problema de autorización, por lo que no es posible visualizar el recurso actual.\";}', 'a:0:{}', '2016-07-15 10:01:20', '2016-07-15 10:01:20', 'local', 'd2cd006c6f24d6ec948f8d6b1648287c5787d8a2f1d27');
INSERT INTO `translation_bundle_translation` VALUES ('2', 'title.authentication_error', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"Authentication Error\";s:2:\"es\";s:24:\"Error de Authenticación\";}', 'a:0:{}', '2016-07-15 10:01:20', '2016-07-15 10:01:20', 'local', '3d9bdc6f739bf37cffa75f2e1d12108a5787d84ec0ef0');
INSERT INTO `translation_bundle_translation` VALUES ('3', 'btn.save', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:4:\"Save\";s:2:\"es\";s:7:\"Guardar\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-28 11:43:27', 'file', '8af63d3c7a36a2a2a8a46a456ab68e7d57912564456');
INSERT INTO `translation_bundle_translation` VALUES ('4', 'btn.show_support_file', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"View Support\";s:2:\"es\";s:11:\"Ver Soporte\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-21 18:06:12', 'local', '2ba4a835a200578c2555ab5fc251530057911b6209f4f');
INSERT INTO `translation_bundle_translation` VALUES ('5', 'label.change_status_to_won.description', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:128:\"Para establecer la oportunidad como ganada, usted debe cargar un soporte que confirme que realmente ha ganado dicha oportunidad.\";s:2:\"es\";s:128:\"Para establecer la oportunidad como ganada, usted debe cargar un soporte que confirme que realmente ha ganado dicha oportunidad.\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-21 18:06:12', 'local', 'a9530d06b664fc10bf92f5c4adf2e9745790f6ef62cd2');
INSERT INTO `translation_bundle_translation` VALUES ('6', 'label.deal_support.file', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"Support file\";s:2:\"es\";s:18:\"Archivo de soporte\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-21 18:06:12', 'local', '33c21d05144fa873ea46f85fbc54dad75790f47946808');
INSERT INTO `translation_bundle_translation` VALUES ('7', 'label.rejected_by', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Rejected by\";s:2:\"es\";s:13:\"Rechazado por\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-21 18:06:12', 'local', 'eb9577455f3ff5d17c3298ec00d579b7579032a217e1b');
INSERT INTO `translation_bundle_translation` VALUES ('8', 'form.deal.support.file.invalid_mime_type', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:37:\"You can only upload a PDF or an Image\";s:2:\"es\";s:36:\"Solo puede subir un PDF o una Imagen\";}', 'a:0:{}', '2016-07-21 18:06:12', '2016-07-21 18:06:12', 'local', '604748f3bf64ec90b1a3b65cfcad22f857911fe1eca22');
INSERT INTO `translation_bundle_translation` VALUES ('9', 'label.to_be_approved_by', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:17:\"To be Approved by\";s:2:\"es\";s:18:\"A ser Aprobado por\";}', 'a:0:{}', '2016-07-28 11:43:22', '2016-07-28 11:43:22', 'local', '69d65f3e59ae9e1dd7c2e03fa210cabb5797bb0a9c9f6');
INSERT INTO `translation_bundle_translation` VALUES ('10', 'label.comments', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Comments\";s:2:\"es\";s:11:\"Comentarios\";}', 'a:0:{}', '2016-07-29 15:02:58', '2016-07-29 15:02:58', 'local', 'f5ca12740641113a35233148c7ff4d5c579bad43317a5');
INSERT INTO `translation_bundle_translation` VALUES ('11', 'Bad credentials.', 'FOSUserBundle', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Bad credentials.\";s:2:\"es\";s:45:\"Correo electrónico o contraseña incorrecta.\";}', 'a:0:{}', '2017-09-05 21:00:22', '2017-09-05 21:00:22', 'local', '0514f1de58ebed720389f12b4a62354159af10661ad26');
INSERT INTO `translation_bundle_translation` VALUES ('12', 'Login', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Login\";s:2:\"es\";s:17:\"Control de Acceso\";}', 'a:0:{}', '2017-09-05 21:00:31', '2017-09-05 21:00:31', 'local', 'fc57805c60431db7aa2ac44a1730132759af106f6202e');
INSERT INTO `translation_bundle_translation` VALUES ('13', 'resetting.request.username', 'FOSUserBundle', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Email\";s:2:\"es\";s:19:\"Correo electrónico\";}', 'a:0:{}', '2017-09-06 19:25:30', '2017-09-06 19:25:30', 'local', '86033247c45ec6ca5605f6f9dc602dea59b04baac8f07');
INSERT INTO `translation_bundle_translation` VALUES ('14', 'resetting.email.message', 'FOSUserBundle', '0', '0', '1', 'a:2:{s:2:\"en\";s:118:\"Hola %username%!\r\n\r\nPara restablecer tu contraseña - por favor visita %confirmationUrl%\r\n\r\nAtentamente,\r\nHP VIP Club.\";s:2:\"es\";s:118:\"Hola %username%!\r\n\r\nPara restablecer tu contraseña - por favor visita %confirmationUrl%\r\n\r\nAtentamente,\r\nHP VIP Club.\";}', 'a:0:{}', '2017-09-06 22:45:09', '2017-09-06 22:45:09', 'local', '823e8a8e7b56cf5c6c97ad1773eea70e59b07a75e9f07');
INSERT INTO `translation_bundle_translation` VALUES ('15', 'title.change_password', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"Change Password\";s:2:\"es\";s:21:\"Cambio de Contraseña\";}', 'a:0:{}', '2017-09-06 22:48:24', '2017-09-06 22:48:24', 'local', 'b0aadce2340d77a4251777c3000e513159b07b387e717');
INSERT INTO `translation_bundle_translation` VALUES ('16', 'phone.countryCode.not_blank', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:43:\"Código del país no debería estar vacío.\";s:2:\"es\";s:43:\"Código del país no debería estar vacío.\";}', 'a:0:{}', '2017-09-10 02:11:26', '2017-09-10 02:11:26', 'local', '9721b6cdb1414d4884d06174a90a84ee59b49f4ed1e12');
INSERT INTO `translation_bundle_translation` VALUES ('17', 'Email:', 'FOSUserBundle', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Email\";s:2:\"es\";s:19:\"Correo Electrónico\";}', 'a:0:{}', '2017-09-13 22:00:13', '2017-09-13 22:00:13', 'local', '24778d1f0e7e4236ab68d4a3acb2b00a59b9aa6d756af');
INSERT INTO `translation_bundle_translation` VALUES ('18', 'Email:', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Email\";s:2:\"es\";s:19:\"Correo Electrónico\";}', 'a:0:{}', '2017-09-13 22:01:51', '2017-09-13 22:01:51', 'local', '24778d1f0e7e4236ab68d4a3acb2b00a59b9aacf69d8d');
INSERT INTO `translation_bundle_translation` VALUES ('19', 'Office', 'phone_type', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Office\";s:2:\"es\";s:7:\"Oficina\";}', 'a:0:{}', '2017-09-13 22:18:59', '2017-09-13 22:18:59', 'local', '0ab58d330e12108d4830e2a4212207a359b9aed3c71ff');
INSERT INTO `translation_bundle_translation` VALUES ('20', 'Mobile', 'phone_type', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Mobile\";s:2:\"es\";s:7:\"Celular\";}', 'a:0:{}', '2017-09-13 22:21:17', '2017-09-13 22:21:17', 'local', '32abd45b5cb5e11a75dbb22ca1922b3959b9af5d84e27');
INSERT INTO `translation_bundle_translation` VALUES ('21', 'APPROVED_STATE', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Approved\";s:2:\"es\";s:8:\"Aprobado\";}', 'a:0:{}', '2017-09-13 23:09:40', '2017-09-13 23:09:40', 'local', 'f5ca12740641113a35233148c7ff4d5c579bad43317a5');
INSERT INTO `translation_bundle_translation` VALUES ('22', 'label.approved', 'messages', '0', '0', '1', 'a:3:{s:2:\"en\";s:8:\"Approved\";s:2:\"es\";s:8:\"Aprobado\";s:2:\"pt\";s:8:\"Aprovado\";}', 'a:0:{}', '2017-09-13 23:09:40', '2017-09-13 23:09:40', 'local', 'manASD0.14580979211796988');
INSERT INTO `translation_bundle_translation` VALUES ('23', 'REJECTED_STATE', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Rejected\";s:2:\"es\";s:9:\"Rechazado\";}', 'a:0:{}', '2017-09-13 23:11:37', '2017-09-13 23:11:37', 'local', 'c411bce2150afaea422983767270f01859b9bb296ebfe');
INSERT INTO `translation_bundle_translation` VALUES ('24', 'REGISTERED_STATE', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"Registered\";s:2:\"es\";s:10:\"Registrada\";}', 'a:0:{}', '2017-09-13 23:12:16', '2017-09-13 23:12:16', 'local', '92ce3ad78d110fb53a78aa38aa95525f59b9bb5048b59');
INSERT INTO `translation_bundle_translation` VALUES ('25', 'label.password_pattern_instructions', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:93:\"The password must have at least one uppercase as A,D. a lowercase like a, d. A symbol, $,#,&.\";s:2:\"es\";s:105:\"La contraseña debe tener al menos una mayúscula como A,D. una minúscula como a, d. Un símbolo, $,#,&.\";}', 'a:0:{}', '2017-09-20 18:57:49', '2017-10-30 22:19:39', 'local', '5ba437766c73151ec45483e50a7e137359f7976b7af6d');
INSERT INTO `translation_bundle_translation` VALUES ('26', 'info.send_email', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:96:\"This message can take up to 24 hours for you to receive it and may fall into the junk mail tray,\";s:2:\"es\";s:113:\"Este mensaje puede tomar hasta 24 horas para que usted lo reciba y puede caer en la bandeja de correo no deseado,\";}', 'a:0:{}', '2017-09-29 18:21:04', '2017-11-29 09:52:44', 'local', '204a81a4cc46f7460f08686e44567fd75a1ec9bca1a79');
INSERT INTO `translation_bundle_translation` VALUES ('27', 'title.forgot_password', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Cambio de contraseña\";s:2:\"es\";s:21:\"Cambio de contraseña\";}', 'a:0:{}', '2017-10-19 17:14:47', '2017-10-19 17:14:47', 'local', '3be00b43a288767b0792a943135634e559e915c79c925');
INSERT INTO `translation_bundle_translation` VALUES ('28', 'title.reset_password.enter_new_password', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:37:\"Por favor digite su nueva contraseña\";s:2:\"es\";s:37:\"Por favor digite su nueva contraseña\";}', 'a:0:{}', '2017-10-19 17:16:31', '2017-10-19 17:16:31', 'local', '7edab8511b54ea464ee4d5ac075d1ada59e9162f6274e');
INSERT INTO `translation_bundle_translation` VALUES ('29', 'label.information_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:19:\"Company Information\";s:2:\"es\";s:29:\"Información de la Compañía\";}', 'a:0:{}', '2017-10-30 21:08:39', '2017-10-30 21:08:39', 'local', 'da30da7d1f2453f6ae73adce6a6a5a9659f786c74b562');
INSERT INTO `translation_bundle_translation` VALUES ('30', 'label.select_type_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Select a Company Type\";s:2:\"es\";s:32:\"Seleccione un Tipo de Compañía\";}', 'a:0:{}', '2017-10-30 21:23:43', '2017-10-30 21:23:43', 'local', '9e0de4fc61b0d5115b79c3257120f62259f78a4f6b9de');
INSERT INTO `translation_bundle_translation` VALUES ('31', 'label.information_contact', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:19:\"Contact Information\";s:2:\"es\";s:24:\"Información de Contacto\";}', 'a:0:{}', '2017-10-30 21:28:36', '2017-10-30 21:28:36', 'local', '7c4bcf32982ab379be8a8224f5c1069e59f78b745132d');
INSERT INTO `translation_bundle_translation` VALUES ('32', 'label.select_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Select a Company\";s:2:\"es\";s:25:\"Seleccione una Compañía\";}', 'a:0:{}', '2017-10-30 21:33:35', '2017-10-30 21:34:01', 'local', '7160179d401c9f6e100057938e6163f259f78cb97fa06');
INSERT INTO `translation_bundle_translation` VALUES ('33', 'label.all_fields_required', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:23:\"All fields are required\";s:2:\"es\";s:33:\"Todos los campos son obligatorios\";}', 'a:0:{}', '2017-10-30 21:40:53', '2017-10-30 21:40:53', 'local', '99b0d58e474cbb4c7bcf9c8d0dd7d22259f78e5548ebf');
INSERT INTO `translation_bundle_translation` VALUES ('34', 'label.name', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Name(s)\";s:2:\"es\";s:9:\"Nombre(s)\";}', 'a:0:{}', '2017-10-30 21:48:34', '2017-10-30 21:48:34', 'local', 'f5e35b43eded61c79bdbee7d422357db59f790228bfe9');
INSERT INTO `translation_bundle_translation` VALUES ('35', 'label.last_name', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"Last Name(s)\";s:2:\"es\";s:11:\"Apellido(s)\";}', 'a:0:{}', '2017-10-30 21:50:02', '2017-10-30 21:50:02', 'local', '7997d21b9ed8a92a128b21d59475f27f59f7907aaa0e0');
INSERT INTO `translation_bundle_translation` VALUES ('36', 'label.position', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Position\";s:2:\"es\";s:5:\"Cargo\";}', 'a:0:{}', '2017-10-30 21:53:00', '2017-10-30 21:53:00', 'local', 'c0d378942f36ed8909e90862df62e37759f7912ce28c7');
INSERT INTO `translation_bundle_translation` VALUES ('37', 'label.new_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"New Company\";s:2:\"es\";s:15:\"Nueva Compañia\";}', 'a:0:{}', '2017-10-30 21:54:21', '2017-10-30 21:54:21', 'local', '25ca96c45c4706bb0c2d3ab3b008585859f7917d89377');
INSERT INTO `translation_bundle_translation` VALUES ('38', 'label.country', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Country\";s:2:\"es\";s:5:\"País\";}', 'a:0:{}', '2017-10-30 21:58:20', '2017-10-30 21:58:20', 'local', '6ff86c9f6e0a00f1e790955f4f81c97e59f7926ccb241');
INSERT INTO `translation_bundle_translation` VALUES ('39', 'label.registration_new_user', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"New user registration\";s:2:\"es\";s:25:\"Registro de Nuevo Usuario\";}', 'a:0:{}', '2017-10-30 22:17:22', '2017-10-30 22:17:22', 'local', '8cc69a97e175424f9f86b44c2d82730059f796e21dadf');
INSERT INTO `translation_bundle_translation` VALUES ('40', 'label.name_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:4:\"Name\";s:2:\"es\";s:6:\"Nombre\";}', 'a:0:{}', '2017-10-30 22:23:49', '2017-10-30 22:23:49', 'local', 'a82fcdb8faad797739892f005094309f59f798655136c');
INSERT INTO `translation_bundle_translation` VALUES ('41', 'label.select', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Select\";s:2:\"es\";s:10:\"Seleccione\";}', 'a:0:{}', '2017-10-30 22:26:01', '2017-10-30 22:26:01', 'local', '2d018ed5d29bbe3bfccd6ce54501ae2059f798e9ecb85');
INSERT INTO `translation_bundle_translation` VALUES ('42', 'label.type_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"Type of Company\";s:2:\"es\";s:17:\"Tipo de Compañia\";}', 'a:0:{}', '2017-10-30 22:27:47', '2017-10-30 22:27:47', 'local', '445e0fd2bc241c50ab8b8efa03099a0359f79953b7932');
INSERT INTO `translation_bundle_translation` VALUES ('43', 'label.select_city', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Select City\";s:2:\"es\";s:21:\"Seleccione una Ciudad\";}', 'a:0:{}', '2017-10-30 22:29:13', '2017-10-30 22:29:13', 'local', '06f65a49321e2364d466a3773a1dfaf459f799a9d40d5');
INSERT INTO `translation_bundle_translation` VALUES ('44', 'label.city', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:4:\"City\";s:2:\"es\";s:6:\"Ciudad\";}', 'a:0:{}', '2017-10-30 22:29:36', '2017-10-30 22:29:36', 'local', '497eccd517eb0dc28031d2856cf84f5359f799c00e84b');
INSERT INTO `translation_bundle_translation` VALUES ('45', 'label.address', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Address\";s:2:\"es\";s:9:\"Direccion\";}', 'a:0:{}', '2017-10-30 22:30:34', '2017-10-30 22:30:34', 'local', 'cb1d79862ff51a451b929676bd3b863c59f799faa4e30');
INSERT INTO `translation_bundle_translation` VALUES ('46', 'label.area', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:4:\"Area\";s:2:\"es\";s:5:\"Área\";}', 'a:0:{}', '2017-10-31 17:25:32', '2017-10-31 17:25:32', 'local', 'e8fcaa554ffa92e27b718f5c4d72015159f8a3fc81963');
INSERT INTO `translation_bundle_translation` VALUES ('47', 'label.number', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Number\";s:2:\"es\";s:7:\"Número\";}', 'a:0:{}', '2017-10-31 17:26:18', '2017-10-31 17:26:18', 'local', '832613de40e96e1dd9f5f083a799eaa859f8a42ab409e');
INSERT INTO `translation_bundle_translation` VALUES ('48', 'label.company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Company\";s:2:\"es\";s:10:\"Compañía\";}', 'a:0:{}', '2017-10-31 17:49:51', '2017-10-31 17:49:51', 'local', '9a67ce79667018bffad19981dc02246459f8a9af2958d');
INSERT INTO `translation_bundle_translation` VALUES ('49', 'label.welcome', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Welcome\";s:2:\"es\";s:10:\"Bienvenido\";}', 'a:0:{}', '2017-10-31 21:03:09', '2017-10-31 21:03:09', 'local', '8b8d913fff5944ad0235328690ee425959f8d6fd2c42d');
INSERT INTO `translation_bundle_translation` VALUES ('50', 'label.text_welcome_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:47:\"Live an unforgettable experience with VIP Club,\";s:2:\"es\";s:46:\"Vive una experiencia inolvidable con VIP Club,\";}', 'a:0:{}', '2017-10-31 21:05:25', '2017-10-31 21:05:25', 'local', '1ba8ca7516fc363734cf7f9b4baad5bb59f8d785586ee');
INSERT INTO `translation_bundle_translation` VALUES ('51', 'label.text_welcome_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:44:\"the most important sales contest of the year\";s:2:\"es\";s:47:\"el concurso de ventas más importante del año.\";}', 'a:0:{}', '2017-10-31 21:06:19', '2017-10-31 21:06:19', 'local', '0a1306aebd2ba9e12c9492c5047ccfd459f8d7bb9a86a');
INSERT INTO `translation_bundle_translation` VALUES ('52', 'label.forgot_password', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Forgot your password?\";s:2:\"es\";s:27:\"¿Olvidaste tu contraseña?\";}', 'a:0:{}', '2017-10-31 21:08:32', '2017-10-31 21:08:32', 'local', '8146311a374cb3f0b9f50810d4b9353f59f8d84070c8c');
INSERT INTO `translation_bundle_translation` VALUES ('53', 'label.new_vipclub', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"New to VIPClub?\";s:2:\"es\";s:19:\"¿Nuevo en VIPClub?\";}', 'a:0:{}', '2017-10-31 21:10:05', '2017-10-31 21:10:05', 'local', '1a199f79626d85f27411f56389ef977259f8d89dde874');
INSERT INTO `translation_bundle_translation` VALUES ('54', 'label.country_code_not_empty', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:33:\"Country code should not be empty.\";s:2:\"es\";s:43:\"Código del país no debería estar vacío.\";}', 'a:0:{}', '2017-11-01 20:32:06', '2017-11-01 21:02:27', 'local', '5d786d3938a3bcee2c5a90264027a03859fa28535124a');
INSERT INTO `translation_bundle_translation` VALUES ('55', 'label.country_code_empty', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:33:\"Country code should not be empty.\";s:2:\"es\";s:43:\"Código del país no debería estar vacío.\";}', 'a:0:{}', '2017-11-01 21:03:05', '2017-11-01 21:04:28', 'local', '5d786d3938a3bcee2c5a90264027a03859fa28cc8ee0a');
INSERT INTO `translation_bundle_translation` VALUES ('56', 'label.number_not_empty', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:31:\"The number should not be empty.\";s:2:\"es\";s:36:\"El número no debería estar vacío.\";}', 'a:0:{}', '2017-11-01 21:06:16', '2017-11-01 21:06:16', 'local', 'd94214de326675fa40c6252a217bf83c59fa2938607aa');
INSERT INTO `translation_bundle_translation` VALUES ('57', 'label.code_not_empty', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:33:\"Country code should not be empty.\";s:2:\"es\";s:43:\"Código del país no debería estar vacío.\";}', 'a:0:{}', '2017-11-01 21:08:03', '2017-11-01 21:08:03', 'local', '5d786d3938a3bcee2c5a90264027a03859fa29a3003de');
INSERT INTO `translation_bundle_translation` VALUES ('58', 'label.only_numbers', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:37:\"The field should only contain numbers\";s:2:\"es\";s:36:\"El campo solo debe contener números\";}', 'a:0:{}', '2017-11-01 21:13:48', '2017-11-01 21:14:48', 'local', '601fe4966fc555b0d6a7b95cb42ecd0d59fa2b384d5d1');
INSERT INTO `translation_bundle_translation` VALUES ('59', 'label.c_only_numbers', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:54:\"The field should only contain <strong>Numbers</strong>\";s:2:\"es\";s:36:\"El campo solo debe contener números\";}', 'a:0:{}', '2017-11-01 21:17:16', '2017-11-15 15:43:11', 'local', 'b6a51445710b8f0e8c0343c885d1e8885a0c527f8dd8e');
INSERT INTO `translation_bundle_translation` VALUES ('60', 'label.vpassword_pattern_instructions', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:100:\"The password must have at least an uppercase such as A, D. a lowercase like a, d. A symbol, $, #, &.\";s:2:\"es\";s:105:\"La contraseña debe tener al menos una mayúscula como A,D. una minúscula como a, d. Un símbolo, $,#,&.\";}', 'a:0:{}', '2017-11-01 21:27:57', '2017-11-01 21:27:57', 'local', '1311e8e22652b731843e65ef8eca0bee59fa2e4d761bb');
INSERT INTO `translation_bundle_translation` VALUES ('61', 'label.please_company_name', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:29:\"Please enter the Company Name\";s:2:\"es\";s:41:\"Por favor ingrese el Nombre de la Empresa\";}', 'a:0:{}', '2017-11-01 22:03:20', '2017-11-01 22:03:45', 'local', 'badc4f1aafb9421f6d829e38e10c15a659fa36b1395d7');
INSERT INTO `translation_bundle_translation` VALUES ('62', 'label.cplease_company_name', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:30:\"Please enter the Company Name.\";s:2:\"es\";s:42:\"Por favor ingrese el Nombre de la Empresa.\";}', 'a:0:{}', '2017-11-01 22:04:26', '2017-11-01 22:04:26', 'local', 'e18673418241aebaf7d846c20c14590d59fa36da3cd1c');
INSERT INTO `translation_bundle_translation` VALUES ('63', 'label.please_address', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:24:\"Please enter the Address\";s:2:\"es\";s:31:\"Por favor ingrese la Dirección\";}', 'a:0:{}', '2017-11-01 22:05:23', '2017-11-01 22:05:23', 'local', 'd6bc7e407728676f384ddf9749996e3459fa37137eebc');
INSERT INTO `translation_bundle_translation` VALUES ('64', 'label.please_type_company', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:31:\"Please select a type of company\";s:2:\"es\";s:41:\"Por favor seleccione un tipo de compañia\";}', 'a:0:{}', '2017-11-01 22:06:13', '2017-11-01 22:06:13', 'local', '99e6c0b94ddc0c706cf8f58745f508c359fa374520c3e');
INSERT INTO `translation_bundle_translation` VALUES ('65', 'label.please_city', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"Please select a City\";s:2:\"es\";s:31:\"Por favor seleccione una Ciudad\";}', 'a:0:{}', '2017-11-01 22:07:09', '2017-11-01 22:07:09', 'local', 'cb280c32fadd514ff8f675136f133d9159fa377dbe172');
INSERT INTO `translation_bundle_translation` VALUES ('66', 'label.password', 'FOSUserBundle', '0', '0', '0', 'a:2:{s:2:\"en\";s:8:\"Password\";s:2:\"es\";s:11:\"Contraseña\";}', 'a:0:{}', '2017-11-02 20:58:36', '2017-11-02 21:00:58', 'local', '63114b7affc332fba4dea663a73c1b8d59fb797a8dbf0');
INSERT INTO `translation_bundle_translation` VALUES ('67', 'password', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Password\";s:2:\"es\";s:11:\"Contraseña\";}', 'a:0:{}', '2017-11-02 21:03:12', '2017-11-02 21:03:12', 'local', '63114b7affc332fba4dea663a73c1b8d59fb7a00b2ebb');
INSERT INTO `translation_bundle_translation` VALUES ('68', 'label.landing_page_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:59:\"Return the biggest sales contest that recognizes you as VIP\";s:2:\"es\";s:60:\"Regresa el mayor concurso de ventas que te reconoce como VIP\";}', 'a:0:{}', '2017-11-03 16:01:09', '2017-11-03 16:01:09', 'local', '67c0473994fe367fb41290b50be9116459fc84b5e4d98');
INSERT INTO `translation_bundle_translation` VALUES ('69', 'label.landing_page_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:134:\"From August 1, 2017 to January 31, 2018, your sales of the HPI product categories apply to become one of the best sellers of the year.\";s:2:\"es\";s:180:\"Desde el 1ero de agosto de 2017 hasta el 31 de enero de 2018, tus ventas de las categorías de los productos HPI aplican para convertirte en uno de los mejores vendedores del año.\";}', 'a:0:{}', '2017-11-03 16:02:14', '2017-11-03 16:02:14', 'local', '2e45635269a07c48978bd2be1c40c0e659fc84f65bf69');
INSERT INTO `translation_bundle_translation` VALUES ('70', 'label.landing_page_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:174:\"* Includes Commercial Computing, Services / Care Packs, A3 Printing Products, Consumables and Printers and Multifunctionals HP LaserJet and PageWide Pro, Enterprise & Managed\";s:2:\"es\";s:172:\"* Incluye Cómputo Comercial, Servicios/Care Packs, Productos de Impresión A3, Consumibles e Impresoras y Multifuncionales HP LaserJet y PageWide Pro, Enterprise & Managed\";}', 'a:0:{}', '2017-11-03 16:03:41', '2017-11-03 16:03:41', 'local', 'e6497885640a93ba9f35d775e8501a3959fc854dc3c48');
INSERT INTO `translation_bundle_translation` VALUES ('71', 'label.landing_page_register_bills', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:22:\"Register your invoices\";s:2:\"es\";s:21:\"Registra tus facturas\";}', 'a:0:{}', '2017-11-03 16:05:25', '2017-11-03 16:05:25', 'local', '1e03760dc1fb4ae52deb306acfc8b1a459fc85b53fee6');
INSERT INTO `translation_bundle_translation` VALUES ('72', 'label.landing_page_my_bills', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"My bills\";s:2:\"es\";s:12:\"Mis facturas\";}', 'a:0:{}', '2017-11-03 16:06:24', '2017-11-03 16:06:24', 'local', '9480197ba0e7c35865ea5c455588d2e459fc85f06e3e2');
INSERT INTO `translation_bundle_translation` VALUES ('73', 'label.landing_page_tips_vip', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"Tips to become a VIP\";s:2:\"es\";s:31:\"Tips para convertirte en un VIP\";}', 'a:0:{}', '2017-11-03 16:07:36', '2017-11-03 16:07:36', 'local', 'bcb7130af7dff12bf8d8857b5e952b7859fc8638ac892');
INSERT INTO `translation_bundle_translation` VALUES ('74', 'label.landing_page_sell_register', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:17:\"Sell and Register\";s:2:\"es\";s:16:\"Vende y Registra\";}', 'a:0:{}', '2017-11-03 16:08:51', '2017-11-03 16:08:51', 'local', '74abfd0832b81cbc44ff40bab6205d6a59fc868343494');
INSERT INTO `translation_bundle_translation` VALUES ('75', 'label.landing_page_identify_products', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:57:\"Identify the categories of the products in your invoices:\";s:2:\"es\";s:60:\"Identifica las categorías de los productos en tus facturas:\";}', 'a:0:{}', '2017-11-03 16:09:51', '2017-11-03 16:09:51', 'local', 'acb5a6d3a82d22688b6fdbdafed1f93359fc86bf0f4a2');
INSERT INTO `translation_bundle_translation` VALUES ('76', 'label.landing_page_identify_products_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"Commercial Computing\";s:2:\"es\";s:18:\"Cómputo Comercial\";}', 'a:0:{}', '2017-11-03 16:11:23', '2017-11-03 16:11:23', 'local', 'abe8285f21d5f03ed6b6803adf11a5d359fc871bb06c5');
INSERT INTO `translation_bundle_translation` VALUES ('77', 'label.landing_page_identify_products_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Services / Care Packs\";s:2:\"es\";s:22:\"Servicios / Care Packs\";}', 'a:0:{}', '2017-11-03 16:12:23', '2017-11-03 16:12:23', 'local', '4f8e57cc9c50d9635d58798897d4d8c459fc8757b7aff');
INSERT INTO `translation_bundle_translation` VALUES ('78', 'label.landing_page_identify_products_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"A3 Printing Products\";s:2:\"es\";s:26:\"Productos de Impresión A3\";}', 'a:0:{}', '2017-11-03 16:13:01', '2017-11-03 16:13:01', 'local', '70424d575bfb7893ed30c1af6b0454f959fc877d28080');
INSERT INTO `translation_bundle_translation` VALUES ('79', 'label.landing_page_identify_products_text_4', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Consumables\";s:2:\"es\";s:11:\"Consumibles\";}', 'a:0:{}', '2017-11-03 16:13:31', '2017-11-03 16:13:31', 'local', 'ea79a907dd2e145d2422d475cef391c759fc879b0b077');
INSERT INTO `translation_bundle_translation` VALUES ('80', 'label.landing_page_identify_products_text_5', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:41:\"Printers and Multifunctionals HP LaserJet\";s:2:\"es\";s:41:\"Impresoras y Multifuncionales HP LaserJet\";}', 'a:0:{}', '2017-11-03 16:14:18', '2017-11-03 16:14:18', 'local', '05422c750c05ae4f356c31f3111471e259fc87ca80992');
INSERT INTO `translation_bundle_translation` VALUES ('81', 'label.landing_page_identify_products_text_6', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:38:\"and PageWide Pro, Enterprise & Managed\";s:2:\"es\";s:36:\"y PageWide Pro, Enterprise & Managed\";}', 'a:0:{}', '2017-11-03 16:15:02', '2017-11-03 16:15:02', 'local', 'dc7d3ee9d68d3743104fe94b93acef7859fc87f622a6c');
INSERT INTO `translation_bundle_translation` VALUES ('82', 'label.landing_page_focus_sales', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Focus your Sales\";s:2:\"es\";s:17:\"Enfoca tus Ventas\";}', 'a:0:{}', '2017-11-03 16:16:12', '2017-11-03 16:16:12', 'local', '97340c42c32adda9128c1249036760ae59fc883ce32b7');
INSERT INTO `translation_bundle_translation` VALUES ('83', 'label.landing_page_focus_sales_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:22:\"Maximize your earnings\";s:2:\"es\";s:22:\"Maximiza tus ganancias\";}', 'a:0:{}', '2017-11-03 16:17:09', '2017-11-03 16:17:09', 'local', '160b8c8553d19a57430026f73b3bbd9c59fc8875f2cf1');
INSERT INTO `translation_bundle_translation` VALUES ('84', 'label.landing_page_focus_sales_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:70:\"Stay tuned and identify the products that will make you win this trip.\";s:2:\"es\";s:74:\"Mantente atento e identifica los productos que te harán ganar este viaje.\";}', 'a:0:{}', '2017-11-03 16:17:51', '2017-11-03 16:17:51', 'local', 'f93aa90f2e3e478493cdddc1419b657c59fc889f465ad');
INSERT INTO `translation_bundle_translation` VALUES ('85', 'label.landing_page_register_and_win', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Register and Win\";s:2:\"es\";s:15:\"Registra y Gana\";}', 'a:0:{}', '2017-11-03 16:19:21', '2017-11-03 16:19:21', 'local', '11b9a6a26954be3c41e2ed6bef0eb23e59fc88f9be3d8');
INSERT INTO `translation_bundle_translation` VALUES ('86', 'label.landing_page_register_and_win_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:54:\"Accumulate double amounts and enjoy a special trip ...\";s:2:\"es\";s:56:\"Acumula montos dobles y disfruta de un viaje especial...\";}', 'a:0:{}', '2017-11-03 16:20:16', '2017-11-03 16:20:16', 'local', '72ebc0d5b0924ee2d8693bc8bb2c518559fc8930ae943');
INSERT INTO `translation_bundle_translation` VALUES ('87', 'label.landing_page_register_and_win_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:138:\"With the annual sales contest for channels, where we seek to compensate you for your sales and effort taking you to the beach of Acapulco.\";s:2:\"es\";s:135:\"Con el concurso anual de ventas para canales, dónde buscamos compensarte por tus ventas y esfuerzo llevándote a la playa de Acapulco.\";}', 'a:0:{}', '2017-11-03 16:20:49', '2017-11-03 16:20:49', 'local', '506b3bca188957aca584d6f869f0943c59fc89519e120');
INSERT INTO `translation_bundle_translation` VALUES ('88', 'label.landing_page_register_and_win_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:99:\"The 60 vendors with the highest number of registered sales will be the winners of the special trip.\";s:2:\"es\";s:98:\"Los 60 vendedores con mayor número de ventas registradas serán los ganadores del viaje especial.\";}', 'a:0:{}', '2017-11-03 16:21:35', '2017-11-03 16:21:35', 'local', '34a486956ce4b75ce0f6cd8b489204b859fc897f93e1e');
INSERT INTO `translation_bundle_translation` VALUES ('89', 'label.register_bill_invoice_breakdown', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:17:\"Invoice Breakdown\";s:2:\"es\";s:19:\"Desgloce de Factura\";}', 'a:0:{}', '2017-11-03 16:29:44', '2017-11-03 16:29:44', 'local', '4c2b35defd6b7134c8fdc3eaddb360ad59fc8b68ee5b7');
INSERT INTO `translation_bundle_translation` VALUES ('90', 'label.register_bill_invoice_breakdown_select', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Select\";s:2:\"es\";s:10:\"Seleccione\";}', 'a:0:{}', '2017-11-03 16:30:39', '2017-11-03 16:30:39', 'local', '2d018ed5d29bbe3bfccd6ce54501ae2059fc8b9f62ef1');
INSERT INTO `translation_bundle_translation` VALUES ('91', 'label.register_bill_select_company_purchase', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:51:\"Select the company with which you made the purchase\";s:2:\"es\";s:53:\"Seleccione la empresa con la que realizaste la compra\";}', 'a:0:{}', '2017-11-03 16:32:41', '2017-11-03 16:32:41', 'local', '18f81ce3b63742a38d9d1165aab8e6f059fc8c19a9cec');
INSERT INTO `translation_bundle_translation` VALUES ('92', 'label.register_bill_select_company_purchase_select', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Select\";s:2:\"es\";s:10:\"Seleccione\";}', 'a:0:{}', '2017-11-03 16:33:07', '2017-11-03 16:33:07', 'local', '2d018ed5d29bbe3bfccd6ce54501ae2059fc8c33b3855');
INSERT INTO `translation_bundle_translation` VALUES ('93', 'label.register_bill_invoice_breakdown_select_computer_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:14:\"AMD processors\";s:2:\"es\";s:16:\"Procesadores AMD\";}', 'a:0:{}', '2017-11-03 16:53:36', '2017-11-03 16:53:36', 'local', 'd032bcb95b8a177c91b17ea7e6ace30c59fc9100bc2bd');
INSERT INTO `translation_bundle_translation` VALUES ('94', 'label.register_bill_invoice_breakdown_select_computer_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Intel processors\";s:2:\"es\";s:18:\"Procesadores Intel\";}', 'a:0:{}', '2017-11-03 16:55:17', '2017-11-03 16:55:17', 'local', 'b82de761994dc8292e054ecde574f31659fc9165a323b');
INSERT INTO `translation_bundle_translation` VALUES ('95', 'label.register_bill_invoice_breakdown_select_computer_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:3:\"Yes\";s:2:\"es\";s:2:\"si\";}', 'a:0:{}', '2017-11-03 16:56:42', '2017-11-03 16:56:42', 'local', 'dfac0917e765cf75b73b881fc80c04c859fc91ba2ac80');
INSERT INTO `translation_bundle_translation` VALUES ('96', 'label.register_bill_invoice_breakdown_select_computer_text_4', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:2:\"No\";s:2:\"es\";s:2:\"No\";}', 'a:0:{}', '2017-11-03 16:57:03', '2017-11-03 16:57:03', 'local', '2c459b616133fe0ba3fa19bfa9290d8b59fc91cf8aa0d');
INSERT INTO `translation_bundle_translation` VALUES ('97', 'label.register_bill_invoice_breakdown_select_carepacks_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:47:\"Attach Care / Packs certificate (PDF, JPG, PNG)\";s:2:\"es\";s:48:\"Adjuntar certificado de Care/Packs (PDF,JPG,PNG)\";}', 'a:0:{}', '2017-11-03 17:02:04', '2017-11-03 17:02:04', 'local', 'dc6d607f236cce16eeecf892b5b1a2f659fc92fc4f9d6');
INSERT INTO `translation_bundle_translation` VALUES ('98', 'label.register_bill_attached_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:87:\"Attached invoice if the amount is equal to or greater than $ 100,000MXD (PDF, JPG, PNG)\";s:2:\"es\";s:74:\"Adjunta factura si el monto es igual o mayor a $100,000MXD (PDF, JPG, PNG)\";}', 'a:0:{}', '2017-11-03 17:03:56', '2017-11-03 17:03:56', 'local', '791042bca2d8150fdb319bdd355fc60c59fc936c09a04');
INSERT INTO `translation_bundle_translation` VALUES ('99', 'label.register_bill_accept_information_entered', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:83:\"I agree that all information entered is true and can be audited and evaluated by HP\";s:2:\"es\";s:96:\"Yo acepto que toda la información ingresada es verdadera y puede ser auditada y evaluada por HP\";}', 'a:0:{}', '2017-11-03 17:05:21', '2017-11-03 17:05:21', 'local', '161c0fa5830c4e19382b66276d2a0b9659fc93c1347ac');
INSERT INTO `translation_bundle_translation` VALUES ('100', 'label.register_bill_error_validation_1', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:23:\"Enter a type of invoice\";s:2:\"es\";s:26:\"Ingrese un tipo de factura\";}', 'a:0:{}', '2017-11-03 17:08:45', '2017-11-14 16:43:51', 'local', '48502a5ac6a958e746902db5caa67c825a0b0f370f96c');
INSERT INTO `translation_bundle_translation` VALUES ('101', 'label.cregister_bill_error_validation_1', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:23:\"Enter a type of invoice\";s:2:\"es\";s:26:\"Ingrese un tipo de factura\";}', 'a:0:{}', '2017-11-03 17:10:32', '2017-11-03 17:10:32', 'local', '48502a5ac6a958e746902db5caa67c8259fc94f8d028b');
INSERT INTO `translation_bundle_translation` VALUES ('102', 'label.register_bill_information_general', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:19:\"General information\";s:2:\"es\";s:20:\"Información general\";}', 'a:0:{}', '2017-11-03 21:15:05', '2017-11-03 21:15:05', 'local', 'bbfda8d3a683e2f7e08726cf5b02c75d59fcce49341e9');
INSERT INTO `translation_bundle_translation` VALUES ('103', 'label.register_bill_number_bill_purchase', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:23:\"Purchase invoice number\";s:2:\"es\";s:28:\"Número de factura de compra\";}', 'a:0:{}', '2017-11-03 21:17:40', '2017-11-03 21:17:40', 'local', '0e855dd57e13c082cf53634937d6e76e59fccee4bb9ae');
INSERT INTO `translation_bundle_translation` VALUES ('104', 'label.register_bill_number_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Bill Number\";s:2:\"es\";s:15:\"Número Factura\";}', 'a:0:{}', '2017-11-03 21:19:17', '2017-11-03 21:19:17', 'local', 'ac913e9449336cdf6b1e7c42c1db7df159fccf45d9bb1');
INSERT INTO `translation_bundle_translation` VALUES ('105', 'label.register_bill_invoice_breakdown_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"From the\";s:2:\"es\";s:8:\"Desde el\";}', 'a:0:{}', '2017-11-03 21:20:46', '2017-12-01 09:27:54', 'local', 'a657489e44958056c60cd12ab838d0685a2166ea02a47');
INSERT INTO `translation_bundle_translation` VALUES ('106', 'label.register_bill_invoice_breakdown_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:24:\"January 1 to January 31,\";s:2:\"es\";s:28:\"1º de enero al 31 de enero,\";}', 'a:0:{}', '2017-11-03 21:22:18', '2017-12-28 17:08:05', 'local', '04b7edb0a7a1d84be96aff35162f77895a456b4585a71');
INSERT INTO `translation_bundle_translation` VALUES ('107', 'label.register_bill_invoice_breakdown_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:55:\"your recorded sales of business computing products with\";s:2:\"es\";s:67:\"tus ventas registradas de los productos de cómputo empresarial con\";}', 'a:0:{}', '2017-11-03 21:23:40', '2017-12-28 17:08:30', 'local', 'aba6e2444092303c8f68ae795b29128d5a456b5e9f338');
INSERT INTO `translation_bundle_translation` VALUES ('108', 'label.register_bill_invoice_breakdown_text_4', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:14:\"AMD processors\";s:2:\"es\";s:16:\"procesadores AMD\";}', 'a:0:{}', '2017-11-03 21:24:39', '2017-12-28 17:08:43', 'local', '924d5301660abaa9d8a73350c167bf495a456b6bb816e');
INSERT INTO `translation_bundle_translation` VALUES ('109', 'label.register_bill_date_bill_purchase', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Invoice purchase date\";s:2:\"es\";s:26:\"Fecha de compra de factura\";}', 'a:0:{}', '2017-11-03 21:25:45', '2017-11-03 21:25:45', 'local', 'fb1b7df42c6935ff338bdb81b3ea57a059fcd0c98d120');
INSERT INTO `translation_bundle_translation` VALUES ('110', 'label.register_bill_invoice_breakdown_select_computer_text_title_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:69:\"If you selected Computation, does it contain Intel or AMD processors?\";s:2:\"es\";s:63:\"Si seleccionaste Cómputo, ¿contiene procesadores Intel o AMD?\";}', 'a:0:{}', '2017-11-03 21:28:40', '2017-11-03 21:28:40', 'local', '96763dbb500675fea394c60d45aa490659fcd17844e6f');
INSERT INTO `translation_bundle_translation` VALUES ('111', 'label.register_bill_invoice_breakdown_select_computer_text_title_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:42:\"Do registered products include WindowsPro?\";s:2:\"es\";s:48:\"¿Los productos registrados incluyen WindowsPro?\";}', 'a:0:{}', '2017-11-03 21:29:39', '2017-11-03 21:29:39', 'local', '0bac751a50d442989ee2d37f59b5936a59fcd1b3505b5');
INSERT INTO `translation_bundle_translation` VALUES ('112', 'label.register_bill_total_number_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:36:\"Total number of units of the invoice\";s:2:\"es\";s:40:\"Cantidad total de unidades de la factura\";}', 'a:0:{}', '2017-11-03 21:30:56', '2017-11-03 21:30:56', 'local', 'a97fc80cf85ae21d55caf999042dea5159fcd20066a8e');
INSERT INTO `translation_bundle_translation` VALUES ('113', 'label.register_bill_total_amount_pesos', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:51:\"Total amount in pesos of the selected business unit\";s:2:\"es\";s:62:\"Total del monto en pesos de la unidad de negocios seleccionada\";}', 'a:0:{}', '2017-11-03 21:32:32', '2017-11-03 21:32:32', 'local', '1dbf3f755353ae45a75bdf7ff75b506859fcd260b8657');
INSERT INTO `translation_bundle_translation` VALUES ('114', 'label.register_bill_required', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"* Required\";s:2:\"es\";s:13:\"* Obligatorio\";}', 'a:0:{}', '2017-11-03 21:37:20', '2017-11-03 21:37:20', 'local', 'a4c0c7adab417a62fca17b09891773ac59fcd38079d05');
INSERT INTO `translation_bundle_translation` VALUES ('115', 'label.register_bill_invoice_breakdown_select_services_text_bill_carepacks', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:43:\"Attach Care / Packs invoice (PDF, JPG, PNG)\";s:2:\"es\";s:44:\"Adjuntar factura de Care/Packs (PDF,JPG,PNG)\";}', 'a:0:{}', '2017-11-03 21:40:33', '2017-11-03 21:40:33', 'local', '2196c01766c266af7a155ad0fb8dfac859fcd441103c7');
INSERT INTO `translation_bundle_translation` VALUES ('116', 'label.register_bill_title', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:14:\"Invoice Record\";s:2:\"es\";s:20:\"Registro de Facturas\";}', 'a:0:{}', '2017-11-08 15:36:03', '2017-11-08 15:36:21', 'local', '91b21661e90b11b120dd88068f74daa45a031665c3943');
INSERT INTO `translation_bundle_translation` VALUES ('117', 'label.gratitude_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:43:\"Your bill has been successfully registered!\";s:2:\"es\";s:45:\"¡Tu factura ha sido registrada exitosamente!\";}', 'a:0:{}', '2017-11-08 15:50:28', '2017-11-08 15:50:28', 'local', '39fba9d8ab9d45bf474362045193778a5a0319b4e2149');
INSERT INTO `translation_bundle_translation` VALUES ('118', 'label.gratitude_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:13:\"Your ID # is:\";s:2:\"es\";s:29:\"¡Tu # de identificación es:\";}', 'a:0:{}', '2017-11-08 15:51:24', '2017-11-08 15:51:24', 'local', '41e3289992083ad3eccced5d63b31d715a0319ecc0a0c');
INSERT INTO `translation_bundle_translation` VALUES ('119', 'label.gratitude_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:258:\"Thank you for participating in the VIP Club sales contest. Remember that every invoice between August 1, 2017 and January 31, 2018 of HP * product sales apply to become one of the best sellers of the year. This information can be audited and evaluated by HP.\";s:2:\"es\";s:303:\"Gracias por participar en el concurso de ventas VIP Club. Recuerda que cada factura entre el 1ero de agosto de 2017 hasta el 31 de enero de 2018 de las ventas de los productos HP* aplican para convertirte en uno de los mejores vendedores del año. Esta información puede ser auditada y evaluada por HP.\";}', 'a:0:{}', '2017-11-08 15:52:07', '2017-11-08 15:52:07', 'local', 'ae9f9d488b495586bd5a86829342b1d05a031a1758990');
INSERT INTO `translation_bundle_translation` VALUES ('120', 'label.gratitude_register_bill_button', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Register new invoices\";s:2:\"es\";s:25:\"Registrar nuevas facturas\";}', 'a:0:{}', '2017-11-08 15:53:25', '2017-11-08 15:53:25', 'local', '5631bd7d38cc64392c85eda73f9aeb065a031a653758b');
INSERT INTO `translation_bundle_translation` VALUES ('121', 'label.gratitude_my_bills_button', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"My bills\";s:2:\"es\";s:12:\"Mis Facturas\";}', 'a:0:{}', '2017-11-08 15:54:16', '2017-11-08 15:54:16', 'local', 'f9a20e54e1655d1fea9b76ce27da193f5a031a986ce9b');
INSERT INTO `translation_bundle_translation` VALUES ('122', 'label.gratitude_text_4', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:106:\"* Includes Commercial Computing, Services / Care Packs, A3 Printing Products, Consumables and Printers and\";s:2:\"es\";s:106:\"* Incluye Cómputo Comercial, Servicios/Care Packs, Productos de Impresión A3, Consumibles e Impresoras y\";}', 'a:0:{}', '2017-11-08 15:55:24', '2017-11-08 15:55:24', 'local', 'b4e857e90a9417ef234fa6fca5f08a625a031adcc7abc');
INSERT INTO `translation_bundle_translation` VALUES ('123', 'label.gratitude_text_5', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:67:\"Multifunctional HP LaserJet and PageWide Pro, Enterprise & Managed.\";s:2:\"es\";s:66:\"Multifuncionales HP LaserJet y PageWide Pro, Enterprise & Managed.\";}', 'a:0:{}', '2017-11-08 15:56:08', '2017-11-08 15:56:08', 'local', 'dd01a77327604edd4c5c95267e46a1135a031b08c735b');
INSERT INTO `translation_bundle_translation` VALUES ('124', 'label.my_bills_title', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"My bills\";s:2:\"es\";s:12:\"Mis Facturas\";}', 'a:0:{}', '2017-11-08 15:58:56', '2017-11-08 15:58:56', 'local', 'f9a20e54e1655d1fea9b76ce27da193f5a031bb0af3ae');
INSERT INTO `translation_bundle_translation` VALUES ('125', 'label.my_bills_search_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Search\";s:2:\"es\";s:6:\"Buscar\";}', 'a:0:{}', '2017-11-08 15:59:52', '2017-11-08 15:59:52', 'local', '89ada0ae3e1c649feb4b2dd4bfbb8f9d5a031be807ad7');
INSERT INTO `translation_bundle_translation` VALUES ('126', 'label.my_bills_results_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Results\";s:2:\"es\";s:10:\"Resultados\";}', 'a:0:{}', '2017-11-08 16:01:42', '2017-11-08 16:01:42', 'local', '4b00be307c2f107c9e340f1e2eabaff15a031c56cc59a');
INSERT INTO `translation_bundle_translation` VALUES ('127', 'label.my_bills_dowloand_excel_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:19:\"Download excel file\";s:2:\"es\";s:23:\"Descargar archivo excel\";}', 'a:0:{}', '2017-11-08 16:02:43', '2017-11-08 16:02:43', 'local', '31c271c8373ef1446bc7ff87799bfd575a031c9326c38');
INSERT INTO `translation_bundle_translation` VALUES ('128', 'label.my_bills_list_id', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:2:\"ID\";s:2:\"es\";s:2:\"ID\";}', 'a:0:{}', '2017-11-08 16:04:23', '2017-11-08 16:04:23', 'local', '0ad814e9a9db0784af0d5ae6a6c063e75a031cf7d9c3b');
INSERT INTO `translation_bundle_translation` VALUES ('129', 'label.my_bills_list_company_name', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"Company Name\";s:2:\"es\";s:17:\"Nombre Compañía\";}', 'a:0:{}', '2017-11-08 16:05:09', '2017-11-08 16:05:09', 'local', 'de18eb2e1584a053b05fe3d7c7bc29445a031d253c096');
INSERT INTO `translation_bundle_translation` VALUES ('130', 'label.my_bills_list_partner', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"Type Partner\";s:2:\"es\";s:12:\"Tipo Partner\";}', 'a:0:{}', '2017-11-08 16:05:59', '2017-11-08 16:05:59', 'local', 'f5bc3340b2e74bb0d85e5910de5c171c5a031d57dc658');
INSERT INTO `translation_bundle_translation` VALUES ('131', 'label.my_bills_list_number_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:14:\"Invoice Number\";s:2:\"es\";s:14:\"No. de Factura\";}', 'a:0:{}', '2017-11-08 16:07:14', '2017-11-29 10:06:07', 'local', '148bdb37b148dec7311d47c70eacb5595a1eccdf9e014');
INSERT INTO `translation_bundle_translation` VALUES ('132', 'label.my_bills_list_units', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Units\";s:2:\"es\";s:8:\"Unidades\";}', 'a:0:{}', '2017-11-08 16:08:57', '2017-11-08 16:08:57', 'local', 'ef68a0b1551a67241f416560bf0f8e295a031e097de9e');
INSERT INTO `translation_bundle_translation` VALUES ('133', 'label.my_bills_list_total_bills', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:13:\"Total Invoice\";s:2:\"es\";s:16:\"Total de Factura\";}', 'a:0:{}', '2017-11-08 16:09:49', '2017-11-08 16:09:49', 'local', '9584b1f78286e1c0dac84ea45aac1a095a031e3d8bee0');
INSERT INTO `translation_bundle_translation` VALUES ('134', 'label.my_bills_list_documents', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:9:\"Documents\";s:2:\"es\";s:10:\"Documentos\";}', 'a:0:{}', '2017-11-08 16:10:23', '2017-11-08 16:10:23', 'local', 'f264a0f2ca986c25da526a53a86158d15a031e5f0dcf7');
INSERT INTO `translation_bundle_translation` VALUES ('135', 'label.my_bills_list_status', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Status\";s:2:\"es\";s:7:\"Estatus\";}', 'a:0:{}', '2017-11-08 16:10:57', '2017-11-08 16:10:57', 'local', 'a23cf19850b296d8bcf02d23fb1f7ca75a031e810d3e7');
INSERT INTO `translation_bundle_translation` VALUES ('136', 'label.my_bills_list_actions', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Actions\";s:2:\"es\";s:8:\"Acciones\";}', 'a:0:{}', '2017-11-08 16:11:26', '2017-11-08 16:11:26', 'local', '2e10fa13f029e2d5ce1f97531ee51ea65a031e9edf4d3');
INSERT INTO `translation_bundle_translation` VALUES ('137', 'label.my_bills_list_actions_select', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Select\";s:2:\"es\";s:11:\"Seleccionar\";}', 'a:0:{}', '2017-11-08 16:13:54', '2017-11-08 16:13:54', 'local', '2f1aacd955c66dd81715ed0d4f7056cf5a031f3296218');
INSERT INTO `translation_bundle_translation` VALUES ('138', 'label.my_bills_list_actions_details', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"See detail\";s:2:\"es\";s:11:\"Ver Detalle\";}', 'a:0:{}', '2017-11-08 16:14:54', '2017-11-29 10:06:50', 'local', '7ce027e2bc6173efe38651532425737c5a1ecd0ae399c');
INSERT INTO `translation_bundle_translation` VALUES ('139', 'label.my_bills_list_actions_remove', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Remove\";s:2:\"es\";s:8:\"Eliminar\";}', 'a:0:{}', '2017-11-08 16:15:31', '2017-11-08 16:15:31', 'local', 'a92790ee4172912a8c3f5e5eaa54ad735a031f936c894');
INSERT INTO `translation_bundle_translation` VALUES ('140', 'label.my_bills_no_bill_register', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:31:\"No recorded invoices were found\";s:2:\"es\";s:38:\"No se encontraron facturas registradas\";}', 'a:0:{}', '2017-11-08 16:16:59', '2017-11-08 16:16:59', 'local', '1cfbcd6b313e1e6cc41b8dfe4c353d325a031febaa544');
INSERT INTO `translation_bundle_translation` VALUES ('141', 'label.my_bills_to_refuse', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:9:\"To refuse\";s:2:\"es\";s:8:\"Rechazar\";}', 'a:0:{}', '2017-11-08 16:18:30', '2017-11-08 16:20:41', 'local', 'e78ebb198500a216faadc72bef423b0e5a0320c92b4b4');
INSERT INTO `translation_bundle_translation` VALUES ('142', 'label.my_bills_list_actions_approve', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Approve\";s:2:\"es\";s:7:\"Aprobar\";}', 'a:0:{}', '2017-11-08 16:20:02', '2017-11-08 16:20:02', 'local', 'b8450a89db710095af0c39aa736445065a0320a2d5545');
INSERT INTO `translation_bundle_translation` VALUES ('143', 'label.my_bills_list_actions_to_refuse', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:9:\"To refuse\";s:2:\"es\";s:8:\"Rechazar\";}', 'a:0:{}', '2017-11-08 16:21:01', '2017-11-08 16:21:01', 'local', 'e78ebb198500a216faadc72bef423b0e5a0320dd33d7c');
INSERT INTO `translation_bundle_translation` VALUES ('144', 'label.my_bills_total_bills', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:14:\"Total Invoices\";s:2:\"es\";s:14:\"Total Facturas\";}', 'a:0:{}', '2017-11-08 16:22:36', '2017-11-08 16:22:36', 'local', 'a243aaadc17b5c4809a033c43f838fe75a03213c1cf70');
INSERT INTO `translation_bundle_translation` VALUES ('145', 'label.my_bills_return_button', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Return\";s:2:\"es\";s:6:\"Volver\";}', 'a:0:{}', '2017-11-08 16:23:51', '2017-11-08 16:23:51', 'local', 'e8cb5117d001a5a68411f7dd85fcd8405a032187c6e69');
INSERT INTO `translation_bundle_translation` VALUES ('146', 'label.my_bills_search_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Distributor\";s:2:\"es\";s:12:\"Distribuidor\";}', 'a:0:{}', '2017-11-08 21:20:31', '2017-11-08 21:20:31', 'local', 'c6d31916558442025f5f7dc00c8c7f815a03670fadc26');
INSERT INTO `translation_bundle_translation` VALUES ('147', 'label.my_bills_search_text_2_select', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Select\";s:2:\"es\";s:11:\"Seleccionar\";}', 'a:0:{}', '2017-11-08 21:21:08', '2017-11-08 21:21:08', 'local', '2f1aacd955c66dd81715ed0d4f7056cf5a036734300d5');
INSERT INTO `translation_bundle_translation` VALUES ('148', 'label.my_bills_search_button', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Search\";s:2:\"es\";s:6:\"Buscar\";}', 'a:0:{}', '2017-11-08 21:23:21', '2017-11-08 21:23:21', 'local', '89ada0ae3e1c649feb4b2dd4bfbb8f9d5a0367b955364');
INSERT INTO `translation_bundle_translation` VALUES ('149', 'label.my_bills_list_actions_see_details_view_id', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:2:\"ID\";s:2:\"es\";s:2:\"ID\";}', 'a:0:{}', '2017-11-08 21:27:12', '2017-11-08 21:27:12', 'local', '0ad814e9a9db0784af0d5ae6a6c063e75a0368a0d3b75');
INSERT INTO `translation_bundle_translation` VALUES ('150', 'label.my_bills_list_actions_see_details_view_partner', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"Type of Partner\";s:2:\"es\";s:15:\"Tipo de Partner\";}', 'a:0:{}', '2017-11-08 21:36:57', '2017-11-08 21:36:57', 'local', 'f98d1db41b051f19d8c5cc286af2c8735a036ae99a542');
INSERT INTO `translation_bundle_translation` VALUES ('151', 'label.my_bills_list_actions_see_details_view_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"My company\";s:2:\"es\";s:13:\"Mi Compañía\";}', 'a:0:{}', '2017-11-08 21:37:44', '2017-11-08 21:37:44', 'local', '816cc521a5e03705f72c578fd3b2e01f5a036b1882ea5');
INSERT INTO `translation_bundle_translation` VALUES ('152', 'label.my_bills_list_actions_see_details_view_buy_to_company', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"Buy the Company\";s:2:\"es\";s:22:\"Compra a la Compañía\";}', 'a:0:{}', '2017-11-08 21:38:28', '2017-11-08 21:38:28', 'local', '4a1ad1fe1faadce6ea63f53dc66a9d305a036b444c619');
INSERT INTO `translation_bundle_translation` VALUES ('153', 'label.my_bills_list_actions_see_details_view_number_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Bill number\";s:2:\"es\";s:13:\"No de Factura\";}', 'a:0:{}', '2017-11-08 21:39:32', '2017-11-08 21:39:32', 'local', '702bf4e537c6c00fdf06626d5b8ffd0b5a036b849d76a');
INSERT INTO `translation_bundle_translation` VALUES ('154', 'label.my_bills_list_actions_see_details_view_type_product', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:15:\"Kind of product\";s:2:\"es\";s:16:\"Tipo de Producto\";}', 'a:0:{}', '2017-11-08 21:40:20', '2017-11-08 21:40:20', 'local', '4f49783660e7ac9a02944a777a9373725a036bb4870be');
INSERT INTO `translation_bundle_translation` VALUES ('155', 'label.my_bills_list_actions_see_details_view_date_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:19:\"Date of the invoice\";s:2:\"es\";s:19:\"Fecha de la Factura\";}', 'a:0:{}', '2017-11-08 21:41:01', '2017-11-08 21:41:01', 'local', '5abfc0f0533927eac8dbfda41468a4475a036bddde26c');
INSERT INTO `translation_bundle_translation` VALUES ('156', 'label.my_bills_list_actions_see_details_view_units', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Units\";s:2:\"es\";s:8:\"Unidades\";}', 'a:0:{}', '2017-11-08 21:41:41', '2017-11-08 21:41:41', 'local', 'ef68a0b1551a67241f416560bf0f8e295a036c0579b49');
INSERT INTO `translation_bundle_translation` VALUES ('157', 'label.my_bills_list_actions_see_details_view_total_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"Total bill\";s:2:\"es\";s:19:\"Total de la Factura\";}', 'a:0:{}', '2017-11-08 21:42:25', '2017-11-08 21:42:25', 'local', 'd7235e112680b1f360062f6d6ede34895a036c311b347');
INSERT INTO `translation_bundle_translation` VALUES ('158', 'label.my_bills_list_actions_see_details_view_status', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:6:\"Status\";s:2:\"es\";s:7:\"Estatus\";}', 'a:0:{}', '2017-11-08 21:44:01', '2017-11-08 21:44:01', 'local', 'a23cf19850b296d8bcf02d23fb1f7ca75a036c912fbd3');
INSERT INTO `translation_bundle_translation` VALUES ('159', 'label.my_bills_list_actions_remove_view_title', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Confirm\";s:2:\"es\";s:9:\"Confirmar\";}', 'a:0:{}', '2017-11-08 21:47:19', '2017-11-08 21:47:19', 'local', 'cb8eece6c6cb68ab8afa26b38bd8f6f45a036d57b6ca0');
INSERT INTO `translation_bundle_translation` VALUES ('160', 'label.my_bills_list_actions_remove_view_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:38:\"Are you sure to eliminate the invoice?\";s:2:\"es\";s:35:\"Esta seguro de eliminar la factura?\";}', 'a:0:{}', '2017-11-08 21:48:44', '2017-11-08 21:48:44', 'local', 'd2395376fd23fd2927e69054f02aea665a036dac4a22f');
INSERT INTO `translation_bundle_translation` VALUES ('161', 'label.my_bills_list_actions_approve_view_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Approve\";s:2:\"es\";s:7:\"Aprobar\";}', 'a:0:{}', '2017-11-08 21:49:34', '2017-11-08 21:49:34', 'local', 'b8450a89db710095af0c39aa736445065a036ddebbe48');
INSERT INTO `translation_bundle_translation` VALUES ('162', 'label.my_bills_list_actions_to_refuse_view_text', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:9:\"To refuse\";s:2:\"es\";s:8:\"Rechazar\";}', 'a:0:{}', '2017-11-08 21:50:32', '2017-11-08 21:50:32', 'local', 'e78ebb198500a216faadc72bef423b0e5a036e185c707');
INSERT INTO `translation_bundle_translation` VALUES ('163', 'label.my_bills_list_actions_confirm_yes', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:3:\"Yes\";s:2:\"es\";s:2:\"Si\";}', 'a:0:{}', '2017-11-08 21:50:57', '2017-11-08 21:50:57', 'local', '8b89c3090e60feae108bcc7709549b915a036e312891f');
INSERT INTO `translation_bundle_translation` VALUES ('164', 'label.my_bills_list_actions_confirm_no', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:2:\"No\";s:2:\"es\";s:2:\"No\";}', 'a:0:{}', '2017-11-08 21:51:20', '2017-11-08 21:51:20', 'local', '2c459b616133fe0ba3fa19bfa9290d8b5a036e4891984');
INSERT INTO `translation_bundle_translation` VALUES ('165', 'label.my_bills_list_actions_see_details_view_title', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:21:\"Detail of the invoice\";s:2:\"es\";s:21:\"Detalle de la factura\";}', 'a:0:{}', '2017-11-08 21:55:11', '2017-11-08 21:55:11', 'local', '607b8d4718f9c8b4d02b5fba060aefc25a036f2f42b20');
INSERT INTO `translation_bundle_translation` VALUES ('166', 'label.my_bills_list_actions_see_details_view_close', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Close\";s:2:\"es\";s:6:\"Cerrar\";}', 'a:0:{}', '2017-11-08 21:55:44', '2017-11-08 21:55:44', 'local', '2b2d08452567f3cb7db3ab6e4eadc4785a036f50c76dd');
INSERT INTO `translation_bundle_translation` VALUES ('167', 'label.my_bills_list_actions_see_details_view_contains', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Contains\";s:2:\"es\";s:8:\"Contiene\";}', 'a:0:{}', '2017-11-09 15:36:52', '2017-11-09 15:39:16', 'local', 'd117abf089f7dfd0436349d227deaf2f5a046894ba0b8');
INSERT INTO `translation_bundle_translation` VALUES ('168', 'label.my_bills_keywords', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Keywords\";s:2:\"es\";s:14:\"Palabras clave\";}', 'a:0:{}', '2017-11-09 15:58:33', '2017-11-09 15:58:33', 'local', 'fe241c343b158b90b9c1126a68c9bddf5a046d19f413f');
INSERT INTO `translation_bundle_translation` VALUES ('169', 'label.register_bill_error_3', 'messages', '0', '0', '0', 'a:2:{s:2:\"en\";s:23:\"Enter a type of invoice\";s:2:\"es\";s:26:\"Ingrese un tipo de factura\";}', 'a:0:{}', '2017-11-10 00:12:00', '2017-11-10 00:14:30', 'local', '48502a5ac6a958e746902db5caa67c825a04e15696f35');
INSERT INTO `translation_bundle_translation` VALUES ('170', 'label.register_bill_error_type_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:40:\"Enter a type of <strong>Invoice</strong>\";s:2:\"es\";s:26:\"Ingrese un tipo de factura\";}', 'a:0:{}', '2017-11-10 00:15:03', '2017-11-15 15:51:11', 'local', '305766081435cfb9ed8f4fec22d5ee615a0c545f71085');
INSERT INTO `translation_bundle_translation` VALUES ('171', 'label.register_bill_error_termsaccepted', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:95:\"You must accept that all the information entered is true and can be audited and evaluated by HP\";s:2:\"es\";s:99:\"Debe Aceptar que toda la información ingresada es verdadera y puede ser auditada y evaluada por HP\";}', 'a:0:{}', '2017-11-10 00:16:20', '2017-11-10 00:16:20', 'local', 'd0c7501c83737f65be63ee9019b9e60c5a04e1c4beedb');
INSERT INTO `translation_bundle_translation` VALUES ('172', 'label.register_bill_error_attach_bill', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:64:\"Attach invoice, the amount is equal to or greater than $ 100.000\";s:2:\"es\";s:53:\"Adjunte factura, el monto es igual o mayor a $100.000\";}', 'a:0:{}', '2017-11-10 00:19:23', '2017-11-10 00:19:23', 'local', '500cfaf4e831918879dd5f5f333059c05a04e27b85413');
INSERT INTO `translation_bundle_translation` VALUES ('173', 'label.register_bill_error_certificate_carepacks', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:81:\"Mandatory attach the invoice and certificate if you select Care Packs or Services\";s:2:\"es\";s:89:\"Obligatorio adjuntar la factura y el certificado si seleccionan Care Packs o de Servicios\";}', 'a:0:{}', '2017-11-10 00:21:51', '2017-11-10 00:21:51', 'local', '6a4b5fb825c9d1759ea58c038cbce34b5a04e30f9c4c7');
INSERT INTO `translation_bundle_translation` VALUES ('174', 'label.register_bill_error_computer_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:65:\"If you selected Compute, does it contain Intel or AMD processors?\";s:2:\"es\";s:62:\"Si seleccionaste Computo, ¿contiene procesadores Intel o AMD?\";}', 'a:0:{}', '2017-11-10 00:27:43', '2017-11-10 00:27:43', 'local', '65340b33147a2bc500a13f7267f29b425a04e46f293d1');
INSERT INTO `translation_bundle_translation` VALUES ('175', 'label.register_bill_error_computer_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:67:\"If you selected Compute, do registered products include WindowsPro?\";s:2:\"es\";s:74:\"Si seleccionaste Computo, ¿Los productos registrados incluyen WindowsPro?\";}', 'a:0:{}', '2017-11-10 00:30:43', '2017-11-10 00:30:43', 'local', '5df2f68d87a1ce0c8a038c7e7fd416495a04e523e5212');
INSERT INTO `translation_bundle_translation` VALUES ('176', 'label.register_bill_error_bill_select', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:44:\"Please select the <strong> Invoice </strong>\";s:2:\"es\";s:48:\"Por favor seleccione la <strong>Factura</strong>\";}', 'a:0:{}', '2017-11-15 15:44:46', '2017-11-15 15:48:35', 'local', 'd59ed8e67c2e0e96373a07d82f247cde5a0c53c346d9a');
INSERT INTO `translation_bundle_translation` VALUES ('177', 'label.register_bill_error_company_select', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:44:\"Please select the <strong> Company </strong>\";s:2:\"es\";s:50:\"Por favor seleccione la <strong>Compañia</strong>\";}', 'a:0:{}', '2017-11-15 15:45:30', '2017-11-15 15:48:10', 'local', '6295b3119d3f390e07801f01df58d6e45a0c53aae2ffc');
INSERT INTO `translation_bundle_translation` VALUES ('178', 'label.register_bill_error_number_bill', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:50:\"Please enter the <strong> Invoice number </strong>\";s:2:\"es\";s:55:\"Por favor ingrese el <strong>Numero de factura</strong>\";}', 'a:0:{}', '2017-11-15 15:47:06', '2017-11-15 15:48:52', 'local', '8ed379f4eaab193e9e209567ac58632d5a0c53d454f5c');
INSERT INTO `translation_bundle_translation` VALUES ('179', 'label.register_bill_error_date_buy_bill', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:63:\"Please enter the <strong> date of the purchase invoice</strong>\";s:2:\"es\";s:67:\"Por favor ingrese la <strong>fecha de la factura de compra</strong>\";}', 'a:0:{}', '2017-11-15 15:52:41', '2017-11-15 15:52:41', 'local', '15ab67a863691191551b75fabc19048c5a0c54b92bdef');
INSERT INTO `translation_bundle_translation` VALUES ('180', 'label.register_bill_error_number_units', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:51:\"Please enter the <strong> number of units </strong>\";s:2:\"es\";s:58:\"Por favor ingrese la <strong>cantidad de unidades</strong>\";}', 'a:0:{}', '2017-11-15 15:53:42', '2017-11-15 15:53:42', 'local', '23dbc769595d4772f00b3f53452afb545a0c54f6c5cb3');
INSERT INTO `translation_bundle_translation` VALUES ('181', 'label.register_bill_error_total_amount', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:64:\"Please enter the <strong> total of the amount in pesos </strong>\";s:2:\"es\";s:62:\"Por favor ingrese el <strong>total del monto en pesos</strong>\";}', 'a:0:{}', '2017-11-15 15:54:28', '2017-11-15 15:54:40', 'local', '3cb478b9826f96649cbd9953b89546775a0c5530475cb');
INSERT INTO `translation_bundle_translation` VALUES ('182', 'label.register_bill_error_upload_certificate', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:78:\"The file type for the certificate is not valid. Valid types are PDF, JPG, PNG.\";s:2:\"es\";s:91:\"El tipo de archivo para el certificado no es válido. Los tipos válidos son PDF, JPG, PNG.\";}', 'a:0:{}', '2017-11-15 15:56:45', '2017-11-15 15:56:45', 'local', '444f1ee76e082bc55dd30f72160e5f515a0c55ad55361');
INSERT INTO `translation_bundle_translation` VALUES ('183', 'label.register_bill_error_upload_bill', 'validators', '0', '0', '1', 'a:2:{s:2:\"en\";s:74:\"The file type for the invoice is not valid. Valid types are PDF, JPG, PNG.\";s:2:\"es\";s:87:\"El tipo de archivo para la factura no es válido. Los tipos válidos son PDF, JPG, PNG.\";}', 'a:0:{}', '2017-11-15 15:57:42', '2017-11-15 15:57:42', 'local', '06e8dd8962e16c85cec4e51b35bef1f05a0c55e674fee');
INSERT INTO `translation_bundle_translation` VALUES ('184', 'label.register_bill_button_attach_file', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:11:\"Attach File\";s:2:\"es\";s:16:\"Adjuntar Archivo\";}', 'a:0:{}', '2017-11-16 16:03:02', '2017-11-16 16:03:02', 'local', '84bba9249d3acd57251512ea2ab45b215a0da8a63fabc');
INSERT INTO `translation_bundle_translation` VALUES ('185', 'label.my_bills_button_clear', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Clear\";s:2:\"es\";s:7:\"Limpiar\";}', 'a:0:{}', '2017-11-16 16:05:25', '2017-11-16 16:05:25', 'local', '5845b4bd9c2e57ea0af0097fe5db01dd5a0da93558ad6');
INSERT INTO `translation_bundle_translation` VALUES ('186', 'promotion.15_Nov_15_Dec_Care_Packs', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:98:\"From November 15 to December 15, your registered Care Packs sales double the amount of your bills.\";s:2:\"es\";s:113:\"Del 15 de Noviembre al 15 de Diciembre, tus ventas registradas de Care Packs duplican los montos de tus facturas.\";}', 'a:0:{}', '2017-11-21 18:06:58', '2017-11-21 18:07:02', 'local', 'a3141a5759f645931869c96b7c968f465a0b651732720');
INSERT INTO `translation_bundle_translation` VALUES ('187', 'label.report_title', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"List Reports\";s:2:\"es\";s:17:\"Lista de Reportes\";}', 'a:0:{}', '2017-11-28 15:16:43', '2017-11-28 15:16:43', 'local', '2f5516fc7811c2f8eaad5585116604065a1dc42b285ff');
INSERT INTO `translation_bundle_translation` VALUES ('188', 'label.report_list_users', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Registered users\";s:2:\"es\";s:20:\"Usuarios Registrados\";}', 'a:0:{}', '2017-11-28 15:18:19', '2017-11-28 15:18:19', 'local', '96150c9f73730264e896c1a18d0125215a1dc48b44bc7');
INSERT INTO `translation_bundle_translation` VALUES ('189', 'label.report_button_dowloand', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"Dowloand\";s:2:\"es\";s:9:\"Descargar\";}', 'a:0:{}', '2017-11-28 15:18:36', '2017-11-28 15:18:36', 'local', 'b2ed8cd0fb6c5b58f1376c8549adb8805a1dc49cb40f6');
INSERT INTO `translation_bundle_translation` VALUES ('190', 'email', 'FOSUserBundle', '0', '0', '1', 'a:2:{s:2:\"en\";s:5:\"Email\";s:2:\"es\";s:19:\"Correo Electrónico\";}', 'a:0:{}', '2017-11-28 16:38:09', '2017-11-28 16:38:09', 'local', '24778d1f0e7e4236ab68d4a3acb2b00a5a1dd74139a7d');
INSERT INTO `translation_bundle_translation` VALUES ('191', 'info.send_email_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:17:\"SPAM o JUNK EMAIL\";s:2:\"es\";s:17:\"SPAM o JUNK EMAIL\";}', 'a:0:{}', '2017-11-29 09:53:05', '2017-11-29 09:53:05', 'local', 'fd7291dfae5ecda07ee3880a1952f80e5a1ec9d1a42f9');
INSERT INTO `translation_bundle_translation` VALUES ('192', 'info.send_email_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:161:\". To receive future notifications, mark the HPI VIP email as No Spam or No Junk email. If you do not receive this email, please contact us at info@hpivipclub.com\";s:2:\"es\";s:167:\". Para recibir futuras notificaciones marque el correo de HPI VIP como No Spam o No Junk email. Si no recibes este correo, por favor contáctenos a info@hpivipclub.com\";}', 'a:0:{}', '2017-11-29 09:53:40', '2017-11-29 09:53:40', 'local', '777d5129e954d6310d9dc88f7103bcca5a1ec9f4f3ead');
INSERT INTO `translation_bundle_translation` VALUES ('193', 'label.footer_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:12:\"Sponsored by\";s:2:\"es\";s:14:\"Auspiciado por\";}', 'a:0:{}', '2017-12-06 17:10:17', '2017-12-06 17:10:17', 'local', '3a776591e5e8c8ac0bfa562d2e4050e45a286ac976a89');
INSERT INTO `translation_bundle_translation` VALUES ('194', 'label.footer_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:16:\"Privacy policies\";s:2:\"es\";s:24:\"Políticas de Privacidad\";}', 'a:0:{}', '2017-12-06 17:11:29', '2017-12-06 17:11:29', 'local', '14313ec26f3cfec2ff56cd26d1a41c3d5a286b11e6f7e');
INSERT INTO `translation_bundle_translation` VALUES ('195', 'label.footer_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:10:\"Contact Us\";s:2:\"es\";s:12:\"Contáctenos\";}', 'a:0:{}', '2017-12-06 17:11:51', '2017-12-06 17:11:51', 'local', '9e0ba9bf7cde322304ad214539e95c825a286b27ad4b9');
INSERT INTO `translation_bundle_translation` VALUES ('196', 'label.footer_hp', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:7:\"Hp Inc.\";s:2:\"es\";s:7:\"Hp Inc.\";}', 'a:0:{}', '2017-12-06 17:12:16', '2017-12-06 17:12:16', 'local', '22403cbfb97549045461d6692c26265e5a286b40db464');
INSERT INTO `translation_bundle_translation` VALUES ('197', 'label.register_bill_invoice_breakdown_text_5', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:33:\"double the amounts of your bills.\";s:2:\"es\";s:36:\"duplican los montos de tus facturas.\";}', 'a:0:{}', '2017-12-28 17:09:10', '2017-12-28 17:09:10', 'local', '1473b4d9c7f04455b9e413714b4fe00f5a456b8699a96');
INSERT INTO `translation_bundle_translation` VALUES ('198', 'label.register_bill_promotion_text_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:8:\"From the\";s:2:\"es\";s:8:\"Desde el\";}', 'a:0:{}', '2017-12-28 17:09:56', '2017-12-28 17:09:56', 'local', 'a657489e44958056c60cd12ab838d0685a456bb4bb029');
INSERT INTO `translation_bundle_translation` VALUES ('199', 'label.register_bill_promotion_text_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"1st until January 31\";s:2:\"es\";s:24:\"1ro hasta el 31 de enero\";}', 'a:0:{}', '2017-12-28 17:10:12', '2017-12-29 14:20:21', 'local', '9bdbfd18d8e12c365b277e0ccfc546e85a469575c6b5b');
INSERT INTO `translation_bundle_translation` VALUES ('200', 'label.register_bill_promotion_text_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:40:\", Your registered sales of the products:\";s:2:\"es\";s:42:\", tus ventas registradas de los productos:\";}', 'a:0:{}', '2017-12-28 17:10:42', '2017-12-29 14:20:28', 'local', '090953bb929a49faff19b901a50a75fa5a46957c0ec7e');
INSERT INTO `translation_bundle_translation` VALUES ('201', 'label.register_bill_promotion_text_4', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:30:\"-Equipment with AMD processors\";s:2:\"es\";s:29:\"-Equipos con procesadores AMD\";}', 'a:0:{}', '2017-12-28 17:10:58', '2018-01-09 14:22:58', 'local', 'd3e03d10c5b32b2140a7d28ac975b3ac5a55169249d54');
INSERT INTO `translation_bundle_translation` VALUES ('202', 'label.register_bill_promotion_text_5', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:33:\"-A3 Printers and Multifunctionals\";s:2:\"es\";s:33:\"-Impresoras y Multifuncionales A3\";}', 'a:0:{}', '2017-12-28 17:11:15', '2018-01-09 14:23:17', 'local', 'c7f025092d31626362886a3c14f503a35a5516a5037cc');
INSERT INTO `translation_bundle_translation` VALUES ('203', 'label.register_bill_promotion_text_6', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:58:\"-Printers and Multifunctionals PageWide Pro and Enterprise\";s:2:\"es\";s:56:\"-Impresoras y Multifuncionales PageWide Pro y Enterprise\";}', 'a:0:{}', '2017-12-28 17:11:27', '2018-01-09 14:23:30', 'local', '0524e829190cd263bca55d967df87f3e5a5516b27f4b7');
INSERT INTO `translation_bundle_translation` VALUES ('204', 'label.register_bill_promotion_text_7', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:58:\"-Printers and Multifunctionals LaserJet Pro and Enterprise\";s:2:\"es\";s:56:\"-Impresoras y Multifuncionales LaserJet Pro y Enterprise\";}', 'a:0:{}', '2017-12-28 17:11:40', '2018-01-09 14:23:41', 'local', '1434ff8f4c49761ecf13f1863c215ae45a5516bd85602');
INSERT INTO `translation_bundle_translation` VALUES ('205', 'label.register_bill_promotion_text_8', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:28:\"-Consumables (Ink and Toner)\";s:2:\"es\";s:29:\"-Consumibles (Tinta y Tóner)\";}', 'a:0:{}', '2017-12-28 17:11:54', '2018-01-09 14:24:01', 'local', 'cc7a8ff55105a5f03d7f7c30493c38f55a5516d1055f5');
INSERT INTO `translation_bundle_translation` VALUES ('206', 'label.register_bill_promotion_text_9', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:32:\"Double the amount of your bills.\";s:2:\"es\";s:34:\"Duplican el monto de tus facturas.\";}', 'a:0:{}', '2018-01-09 14:24:17', '2018-01-09 14:24:17', 'local', '523ad281c523676640f3a46af07c10a35a5516e1e0ad1');
INSERT INTO `translation_bundle_translation` VALUES ('207', 'label.landing_page_text_closing_1', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:51:\"El concurso de ventas del año ha llegado a su fin.\";s:2:\"es\";s:51:\"El concurso de ventas del año ha llegado a su fin.\";}', 'a:0:{}', '2018-01-31 11:07:47', '2018-03-03 14:41:22', 'local', '6e6727cd9b6a53dec2db7f959d64fb1f5a9afa62e3532');
INSERT INTO `translation_bundle_translation` VALUES ('208', 'label.landing_page_text_closing_2', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:49:\"The sales contest of the year has come to an end.\";s:2:\"es\";s:51:\"El concurso de ventas del año ha llegado a su fin.\";}', 'a:0:{}', '2018-01-31 11:08:49', '2018-01-31 11:08:49', 'local', '715eec7aa04ba046cf8601dba9a3723f5a71ea119f438');
INSERT INTO `translation_bundle_translation` VALUES ('209', 'label.landing_page_text_closing_3', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:64:\"Gracias a todos los participantes y felicidades a los ganadores.\";s:2:\"es\";s:64:\"Gracias a todos los participantes y felicidades a los ganadores.\";}', 'a:0:{}', '2018-01-31 11:09:42', '2018-03-03 14:41:55', 'local', '15a9c610e7e625fe71784223674ebb985a9afa83c9c20');
INSERT INTO `translation_bundle_translation` VALUES ('210', 'label.landing_page_view_winners', 'messages', '0', '0', '1', 'a:2:{s:2:\"en\";s:20:\"Meet our VIP sellers\";s:2:\"es\";s:32:\"Conoce a nuestros vendedores VIP\";}', 'a:0:{}', '2018-01-31 15:07:23', '2018-01-31 15:07:23', 'local', '504a304e79b3a93cd455f32db1be13cc5a7221fba6ff4');

-- ----------------------------
-- Table structure for translation_bundle_translation_log
-- ----------------------------
DROP TABLE IF EXISTS `translation_bundle_translation_log`;
CREATE TABLE `translation_bundle_translation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `translation_id` int(11) DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `new` tinyint(1) NOT NULL,
  `autogenerated` tinyint(1) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `trans_values` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `files` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `logged_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C9CAB9969CAA2B25` (`translation_id`),
  CONSTRAINT `FK_C9CAB9969CAA2B25` FOREIGN KEY (`translation_id`) REFERENCES `translation_bundle_translation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of translation_bundle_translation_log
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;

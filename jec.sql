CREATE TABLE IF NOT EXISTS `teachers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `designation` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phonenumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departmentid` int(10) NOT NULL,
  `imagepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY(id),
  INDEX (departmentid),
    FOREIGN KEY (departmentid) REFERENCES departments(id) ON DELETE CASCADE
 )ENGINE=InnoDB ;

CREATE TABLE IF NOT EXISTS `subject_teachers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subjectid` bigint(20) NOT NULL,
  `departmentid` bigint(20) NOT NULL,
  `teacherid` bigint(20) NOT NULL,
  `year` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `semester` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY(id),
  INDEX (subjectid, departmentid, teacherid),
  FOREIGN KEY (subjectid) REFERENCES subjects(id),
  FOREIGN KEY (departmentid) REFERENCES departments(id),
  FOREIGN KEY (teacherid) REFERENCES teachers(id)
 )ENGINE=InnoDB ;
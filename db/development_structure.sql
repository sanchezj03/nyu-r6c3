CREATE TABLE `addresses` (
  `id` int(11) NOT NULL auto_increment,
  `caregiver_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `apartment` varchar(5) default NULL,
  `home_number` varchar(20) default NULL,
  `street` varchar(255) default NULL,
  `zip_code` int(5) default NULL,
  `created_on` datetime default NULL,
  `city` varchar(255) default NULL,
  `state` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `collected_on` date default NULL,
  `comments` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `blue_card_entries` (
  `id` int(11) NOT NULL auto_increment,
  `child_id` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `relationship` varchar(255) default NULL,
  `ptypeH` varchar(8) default NULL,
  `ptypeC` varchar(8) default NULL,
  `ptypeW` varchar(8) default NULL,
  `collected_on` date default NULL,
  `created_on` datetime default NULL,
  `phone_number2` varchar(255) default NULL,
  `phone_number3` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `caregiver_relations` (
  `id` int(11) NOT NULL auto_increment,
  `relation` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `caregivers` (
  `id` int(11) NOT NULL auto_increment,
  `child_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `relation` varchar(255) default NULL,
  `schedule` varchar(255) default NULL,
  `created_on` datetime default NULL,
  `caregiver_id` varchar(11) default NULL,
  `caregiver_relation_id` int(11) default NULL,
  `comments` varchar(255) default NULL,
  `collected_on` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `children` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `last_name` varchar(255) default NULL,
  `first_name` varchar(255) default NULL,
  `birthday` date default NULL,
  `gender` varchar(1) default NULL,
  `hispanic` tinyint(1) default NULL,
  `race` varchar(255) default NULL,
  `yoked_pair` tinyint(1) default '0',
  `created_on` datetime default NULL,
  `comments` varchar(255) default NULL,
  `child_id` int(5) default NULL,
  `recruitment_id` int(6) default NULL,
  `collected_on` date default NULL,
  `child_is_linked` tinyint(1) default NULL,
  `linked_child` varchar(255) default NULL,
  `is_primary` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `classrooms` (
  `id` int(11) NOT NULL auto_increment,
  `school_id` int(11) default NULL,
  `teacher_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `hours` varchar(7) default NULL,
  `grade` varchar(10) default NULL,
  `created_on` datetime default NULL,
  `class_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `consent_reasons` (
  `id` int(11) NOT NULL auto_increment,
  `number` int(11) default NULL,
  `reason` varchar(255) default NULL,
  `yes` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `consents` (
  `id` int(11) NOT NULL auto_increment,
  `child_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `consent_reason_id` int(11) default NULL,
  `phase` int(1) default NULL,
  `withdrawn` tinyint(1) default NULL,
  `created_on` datetime default NULL,
  `comments` varchar(255) default NULL,
  `consented` tinyint(1) default NULL,
  `collected_on` date default NULL,
  `caregiver_id` int(11) NOT NULL,
  `is_primary_caregiver` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `eligibilities` (
  `id` int(11) NOT NULL auto_increment,
  `child_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `reason_id` int(11) default NULL,
  `eligible` tinyint(1) default NULL,
  `comments` varchar(255) default NULL,
  `created_on` datetime default NULL,
  `collected_on` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `eligibility_reasons` (
  `id` int(11) NOT NULL auto_increment,
  `number` int(11) default NULL,
  `reason` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `emails` (
  `id` int(11) NOT NULL auto_increment,
  `caregiver_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `email` varchar(255) default NULL,
  `created_on` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `familymembers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default '',
  `relation` varchar(255) default '',
  `birthday` datetime default NULL,
  `deceased` tinyint(1) NOT NULL default '0',
  `session_id` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `location_statuses` (
  `id` int(11) NOT NULL auto_increment,
  `text` varchar(255) default NULL,
  `in_target_school` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL auto_increment,
  `child_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `status_id` varchar(255) default NULL,
  `created_on` datetime default NULL,
  `classroom_id` int(11) default NULL,
  `comments` varchar(255) default NULL,
  `collected_on` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `phones` (
  `id` int(11) NOT NULL auto_increment,
  `caregiver_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `mode` varchar(8) default NULL,
  `number` varchar(255) default NULL,
  `created_on` datetime default NULL,
  `comments` varchar(255) default NULL,
  `collected_on` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `schema_info` (
  `version` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `schools` (
  `id` int(11) NOT NULL auto_increment,
  `number` int(3) default NULL,
  `location` varchar(255) default NULL,
  `comments` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessionlists` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_sessions_on_session_id` (`session_id`),
  KEY `index_sessions_on_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `staff` (
  `id` int(11) NOT NULL auto_increment,
  `school_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `created_on` datetime default NULL,
  `title` varchar(255) default NULL,
  `first_name` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `comments` varchar(255) default NULL,
  `collected_on` date default NULL,
  `teacher_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `staff_titles` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `login` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `crypted_password` varchar(40) default NULL,
  `salt` varchar(40) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `remember_token` varchar(255) default NULL,
  `remember_token_expires_at` datetime default NULL,
  `name` varchar(255) default NULL,
  `access_level` varchar(255) default NULL,
  `send_withdraw_email` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `schema_info` (version) VALUES (39)
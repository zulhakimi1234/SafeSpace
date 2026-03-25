CREATE TABLE users(
    user_id CHAR(10) NOT NULL,
    user_name VARCHAR(50),
    user_password VARCHAR(255),
    user_email VARCHAR(50),
    
    PRIMARY KEY(user_id)
    );
CREATE TABLE admins(
    admin_id CHAR(10) NOT NULL,
    admin_username VARCHAR(50),
    admin_password VARCHAR(255),
    
    PRIMARY KEY(admin_id)
    );
CREATE TABLE users_profile(
    profile_id CHAR(10) NOT NULL,
    user_id CHAR(10) NOT NULL,
    profile_age INT,
    profile_gender VARCHAR(25),
    
    PRIMARY KEY(profile_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE users_journal(
    journal_id CHAR(25) NOT NULL,
    user_id CHAR(10) NOT NULL,
    journal_content VARCHAR(100),
    journal_date DATETIME,
    
    PRIMARY KEY(journal_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE users_journal_replies(
    journal_reply_id CHAR(25) NOT NULL,
    journal_id CHAR(25) NOT NULL,
    user_id CHAR(10) NOT NULL,
    journal_reply_content VARCHAR(100),
    journal_reply_date DATETIME,
    
    PRIMARY KEY(journal_reply_id),
    FOREIGN KEY(journal_id) REFERENCES users_journal(journal_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE admins_questionnaire(
    questionnaire_id CHAR(10) NOT NULL,
    questionnaire_content VARCHAR(100),
    
    PRIMARY KEY(questionnaire_id)
    );
CREATE TABLE admins_questionnaire_reply(
    questionnaire_reply_id CHAR(10) NOT NULL,
    questionnaire_id CHAR(10) NOT NULL,
    user_id CHAR(10) NOT NULL,
    questionnaire_reply_score VARCHAR(10),
    questionnaire_reply_date DATETIME,
    
    PRIMARY KEY(questionnaire_reply_id),
    FOREIGN KEY(questionnaire_id) REFERENCES admins_questionnaire(questionnaire_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE users_mental_health(
    mental_health_id CHAR(100) NOT NULL,
    user_id CHAR(10) NOT NULL,
    mental_health_month DATETIME,
    mental_health_stress VARCHAR(25),
    mental_health_mood VARCHAR(25),
    
    PRIMARY KEY(mental_health_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE users_task(
    task_id CHAR(25) NOT NULL,
    user_id CHAR(10) NOT NULL,
    task_title VARCHAR(25),
    task_description VARCHAR(100),
    task_due DATETIME,
    task_status VARCHAR(25),
    
    PRIMARY KEY(task_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id) ON UPDATE CASCADE ON DELETE CASCADE
    );
CREATE TABLE admins_tips(
    tip_id CHAR(10) NOT NULL,
    tip_title VARCHAR(25),
    tip_content VARCHAR(100),
    
    PRIMARY KEY(tip_id)
    );
CREATE TABLE admins_analytics(
    analytics_id CHAR(25) NOT NULL,
    analytics_date DATETIME,
    analytics_avg_mood VARCHAR(25),
    analytics_avg_score VARCHAR(25),
    analytics_total_user VARCHAR(25),
    
    PRIMARY KEY(analytics_id)
    );

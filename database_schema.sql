-- Database Design for TaskForge
CREATE DATABASE TaskForgeDB;
USE TaskForgeDB;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL -- Admin, ProjectManager, TeamMember
);

CREATE TABLE Projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES Users(user_id)
);

CREATE TABLE Tasks (
    task_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT,
    assigned_to INT,
    title VARCHAR(100) NOT NULL,
    status VARCHAR(50) DEFAULT 'To Do', -- To Do, In Progress, Done
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (assigned_to) REFERENCES Users(user_id)
);

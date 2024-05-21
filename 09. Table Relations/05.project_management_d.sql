CREATE TABLE clients(
	id SERIAL PRIMARY KEY,
	name VARCHAR(10)
);

CREATE TABLE employees(
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	project_id INTEGER
);

CREATE TABLE projects(
	id SERIAL PRIMARY KEY,
	client_id INTEGER,
	project_lead_id INTEGER,
	CONSTRAINT pk_projects_clients
		FOREIGN KEY (client_id)
			REFERENCES clients(id),
	CONSTRAINT pk_projects_employees
		FOREIGN KEY (project_lead_id)
			REFERENCES employees(id)
);

ALTER TABLE employees
ADD CONSTRAINT pk_employees_projects
	FOREIGN KEY (project_id)
		REFERENCES projects(id)
;


-- for judje
ALTER TABLE minions_info

ADD CONSTRAINT unique_containt
UNIQUE(email, id),

ADD CONSTRAINT banana_check
CHECK(banana >0);

-- better name of CONSTRAINTs
/*
ALTER TABLE minions_info

ADD CONSTRAINT UQ_email_and_id 
UNIQUE(email, id)

ADD CONSTRAINT CK_banana_is_positive_number
CHECK(banana >0);
*/
CREATE TABLE managers_emails (
    pay_evt bigint NOT NULL,
    manager_email character varying(255)
);

ALTER TABLE managers_emails OWNER TO esuppay;

ALTER TABLE managers_emails ADD CONSTRAINT managers_emails_pay_evt FOREIGN KEY (pay_evt) REFERENCES public.pay_evt(id);


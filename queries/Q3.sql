CREATE TABLE log_auditoria (
    log_id    INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    usuario   VARCHAR(100),
    operacao  VARCHAR(10),
    tabela VARCHAR(50),
    problema  VARCHAR(255)
) ENGINE=MyISAM;


DELIMITER $$
CREATE TRIGGER NEW_MOVE 
BEFORE INSERT ON moves
FOR EACH ROW
BEGIN 
		IF NEW.move_power < 0 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'INSERT', 'moves', CONCAT('Tentou inserir um valor negativo no campo move_power: ', NEW.move_power));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_power não pode ser negativo';
		END IF;
        
        IF NEW.move_pp < 0 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'INSERT', 'moves', CONCAT('Tentou inserir um valor negativo no campo move_pp: ', NEW.move_pp));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_pp não pode ser negativo';
		END IF;   
        
        IF NEW.move_accuracy < 0 OR NEW.move_accuracy > 100 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'INSERT', 'moves', CONCAT('Tentou inserir um número fora da faixa (0 a 100): ', NEW.move_accuracy));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_accuracy deve estar entre 0 e 100';
		END IF;
END$$
DELIMITER ; 

DELIMITER $$
CREATE TRIGGER UPDATE_MOVE 
BEFORE UPDATE ON moves
FOR EACH ROW
BEGIN 
		IF NEW.move_power < 0 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'UPDATE', 'moves', CONCAT('Tentou inserir um valor negativo no campo move_power: ', NEW.move_power));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_power não pode ser negativo';
		END IF;
        
        IF NEW.move_pp < 0 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'UPDATE', 'moves', CONCAT('Tentou inserir um valor negativo no campo move_pp: ', NEW.move_pp));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_pp não pode ser negativo';
		END IF;   
        
        IF NEW.move_accuracy < 0 OR NEW.move_accuracy > 100 THEN
			INSERT INTO log_auditoria (usuario, operacao, tabela, problema) VALUES (USER(), 'UPDATE', 'moves', CONCAT('Tentou inserir um número fora da faixa (0 a 100): ', NEW.move_accuracy));
			
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do campo move_accuracy deve estar entre 0 e 100';
		END IF;
END$$
DELIMITER ; 


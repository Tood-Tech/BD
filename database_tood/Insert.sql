drop database tooddatabase;
use tooddatabase;

select * from empresa;

INSERT INTO empresa (razaoSocial, nomeFantasia, cnpj, telefone, responsavel) 
VALUES ('McDonalds Corporation', 'McDonalds', '12548165/000160', '(11)3649-6000', 'João da Silva');

select * from estabelecimento;

INSERT INTO estabelecimento (fkEmpresa, nome, cnpj, telefone, responsavel) 
VALUES (1, 'McDonalds - Shopping Eldorado', '24.535.797/0001-01', '(11) 98765-4321', '05495-000');

INSERT INTO estabelecimento (fkEmpresa, nome, cnpj, telefone, responsavel) 
VALUES (1, 'McDonalds - Shopping Morumbi', '56.746.418/0001-72', '(11) 99999-8888', '05709-010');

INSERT INTO estabelecimento (fkEmpresa, nome, cnpj, telefone, responsavel) 
VALUES (1, 'McDonalds - Shopping Ibirapuera', '35.478.219/0001-09', '(11) 5555-7777', '04052-000');

select * from totem;

INSERT INTO totem (fkEstabelecimento, numeroSerial, processador, alertaProcessador, ram, alertaRam, gpu, alertaGpu, disco, alertaDisco) 
VALUES 
    (1, '123ABC', 'Intel i5', 80, '8GB DDR4', 90, 'Nvidia GTX 1060', 85, '1TB HDD', 75),
    (1, '456DEF', 'AMD Ryzen 7', 85, '16GB DDR4', 95, 'Nvidia GTX 1080 Ti', 90, '512GB SSD', 80),
    (2, '789GHI', 'Intel i7', 90, '32GB DDR4', 100, 'Nvidia RTX 3080', 95, '2TB HDD', 85),
    (2, '012JKL', 'AMD Ryzen 9', 95, '64GB DDR4', 80, 'Nvidia RTX 3090', 75, '1TB SSD', 90),
    (3, '345MNO', 'Intel i9', 100, '128GB DDR4', 120, 'Nvidia A100', 110, '4TB HDD', 100),
    (3, '678PQR', 'AMD Threadripper 3990X', 78, '256GB DDR4', 130, 'Nvidia Titan RTX', 79, '2TB SSD', 86),
    (1, '901STU', 'Intel Pentium G4560', 70, '4GB DDR4', 60, 'Nvidia GT 1030', 65, '256GB HDD', 50),
    (2, '234VWX', 'AMD Athlon 3000G', 75, '8GB DDR4', 70, 'AMD Radeon RX 550', 80, '512GB HDD', 65),
    (3, '567YZA', 'Intel Celeron G5900', 65, '4GB DDR4', 55, 'Intel UHD Graphics 610', 60, '128GB SSD', 45),
    (3, '890BCD', 'AMD A4-5300', 60, '4GB DDR3', 50, 'AMD Radeon HD 7480D', 55, '500GB HDD', 40);
    
select * from usuario;

INSERT INTO usuario (fkEmpresa, nomeUsuario, email, senha, cargo, telefone, cpf)
VALUES 
(1, 'Enzo', 'enzo@email.com', '123456', 'Gerente', '(11) 9999-9999', '123.456.789-10'),
(1, 'Samuel Lima Ribeiro', 'tood@email.com', '123', 'Gerente', '(11) 9999-9999', '123.456.789-10'),
(1, 'João da Silva', 'joao.silva@email.com', '123456', 'Suporte', '(11) 9999-9999', '123.456.789-10'),
(1, 'Maria Santos', 'maria.santos@email.com', '123456', 'Suporte', '(11) 8888-8888', '109.876.543-21'),
(1, 'José Oliveira', 'jose.oliveira@email.com', '123456', 'Suporte', '(11) 7777-7777', '987.654.321-00'),
(1, 'Ana Pereira', 'ana.pereira@email.com', '123456', 'Suporte', '(11) 6666-6666', '456.789.123-45');
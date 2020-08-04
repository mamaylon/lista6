
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `telefone` varchar(255) NOT NULL,
  `cep` varchar(255) NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `data_nasc` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `cliente` (`id`, `tipo`, `nome`, `endereco`, `telefone`, `cep`, `cpf`, `cnpj`, `data_nasc`, `razao_social`) VALUES
(1, '1', 'Ze fisico', 'Rua legal', '34323135', '18200000', '111111111', NULL, '01/02/2010', NULL),
(2, '2', 'ze juridico', 'Rua Nao Legal', '98979695', '19000000', NULL, '2222222', NULL, 'Zezinho Import');


ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

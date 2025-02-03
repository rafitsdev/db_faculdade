-- TABELAS EXISTENTES NO DB
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = DATABASE();

-- TOTAL DE RESGISTROS POR TABELA
SELECT 'tbl_tipo_entidade' AS tabela, COUNT(*) AS total_registros FROM tbl_tipo_entidade
UNION ALL
SELECT 'tbl_alunos', COUNT(*) FROM tbl_alunos
UNION ALL
SELECT 'tbl_professores', COUNT(*) FROM tbl_professores
UNION ALL
SELECT 'tbl_enderecos', COUNT(*) FROM tbl_endereco
UNION ALL
SELECT 'tbl_cursos', COUNT(*) FROM tbl_cursos
UNION ALL
SELECT 'tbl_disciplinas', COUNT(*) FROM tbl_disciplinas
UNION ALL
SELECT 'tbl_turmas', COUNT(*) FROM tbl_turmas
UNION ALL
SELECT 'tbl_turmas_disciplinas', COUNT(*) FROM tbl_turmas_disciplinas
UNION ALL
SELECT 'tbl_matriculas', COUNT(*) FROM tbl_matriculas
UNION ALL
SELECT 'tbl_turno', COUNT(*) FROM tbl_turno
UNION ALL
SELECT 'tbl_turno_turmas', COUNT(*) FROM tbl_turno_turmas
UNION ALL
SELECT 'tbl_professores_turmas', COUNT(*) FROM tbl_professores_turmas
UNION ALL
SELECT 'tbl_tipo_avaliacao', COUNT(*) FROM tbl_tipo_avaliacao
UNION ALL
SELECT 'tbl_notas', COUNT(*) FROM tbl_notas;

-- RELAÇÃO DE PROFESSORES, SUAS ÁREAS DE ATUAÇÃO E A QUAL TURMA ELE FAZ PARTE
SELECT 
	pt.fk_professor,
    p.nome AS nome_professor,
    p.area_atuacao,
	pt.fk_turma,
	t.nome AS nome_turma
FROM tbl_professores_turmas pt
INNER JOIN tbl_professores p ON pt.fk_professor = p.id
LEFT JOIN tbl_turmas t ON pt.fk_turma = t.id
ORDER BY fk_turma;

-- CONFERINDO SE HÁ DUPLICATAS NO REGISTRO DE ALUNOS
SELECT ra, nome, cpf, email, COUNT(*) AS qtd
from tbl_alunos
GROUP BY nome, cpf, email;

-- QUANTIDADE DE ALUNOS POR TURMA
SELECT 
    t.id AS id_turma,
    t.nome AS nome_turma,
    COUNT(m.fk_aluno) AS total_alunos
FROM tbl_turmas t
LEFT JOIN tbl_matriculas m ON t.id = m.fk_turma
GROUP BY t.id, t.nome
ORDER BY fk_turma;

-- RELAÇÃO DE ALUNO, CURSO E TURMA
SELECT 
    a.ra,
    a.nome,
    m.fk_curso,
    c.nome AS nome_curso,
    m.fk_turma,
    t.nome AS nome_turma
FROM tbl_alunos a
INNER JOIN tbl_matriculas m ON m.fk_aluno = a.ra
INNER JOIN tbl_cursos c ON m.fk_curso = c.id
INNER JOIN tbl_turmas t ON m.fk_turma = t.id
ORDER BY a.ra;

-- CONSULTA DE QNTD DE TURMA POR CURSO (EXEMPLO MEDICINA)
SELECT DISTINCT t.*
FROM tbl_turmas t
JOIN tbl_turmas_disciplinas td ON t.id = td.fk_turma
JOIN tbl_disciplinas d ON td.fk_disciplina = d.id
JOIN tbl_cursos c ON d.fk_curso = c.id
WHERE c.nome = 'Medicina';

-- CONSULTA DE QNTD DE DISCIPLINA POR TURMA
SELECT fk_turma, COUNT(*) AS qtd
FROM tbl_turmas_disciplinas
GROUP BY fk_turma;

-- RELAÇÃO DE TURMAS COM CURSOS
SELECT 
    t.id AS turma_id,
    t.nome AS turma_nome,
    c.id AS curso_id,
    c.nome AS curso_nome
FROM tbl_turmas t
JOIN tbl_turmas_disciplinas td ON t.id = td.fk_turma
JOIN tbl_disciplinas d ON td.fk_disciplina = d.id
JOIN tbl_cursos c ON d.fk_curso = c.id
GROUP BY t.id, t.nome, c.id, c.nome
ORDER BY c.id, t.id;

-- VERIFICAÇÃO DE ALUNOS DO CURSO DE MEDICINA E A QUAL TURMA ELE ESTÁ MATRICULADO
SELECT DISTINCT 
    a.ra AS RA,
    a.nome AS Nome_Aluno,
    m.id AS Numero_Matricula,
    c.nome AS Curso,
    t.nome AS Turma
FROM tbl_alunos a
JOIN tbl_matriculas m ON a.ra = m.fk_aluno
JOIN tbl_turmas t ON m.fk_turma = t.id
JOIN tbl_turmas_disciplinas td ON t.id = td.fk_turma
JOIN tbl_disciplinas d ON td.fk_disciplina = d.id
JOIN tbl_cursos c ON d.fk_curso = c.id
WHERE c.nome = 'Medicina';
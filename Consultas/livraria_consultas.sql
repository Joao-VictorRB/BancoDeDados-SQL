SELECT 
    * 
FROM LIVROS;


SELECT 
    nomeLivro, nomeEditora 
FROM LIVROS;


SELECT 
    nomeLivro, estadoEditora 
FROM LIVROS 
WHERE sexoAutor = 'M';


SELECT 
    nomeLivro, numPag 
FROM LIVROS 
WHERE sexoAutor = 'F';


SELECT 
    valorLivro 
FROM LIVROS 
WHERE estadoEditora = 'SP';


SELECT  
    * 
FROM LIVROS 
WHERE sexoAutor = 'M' AND estadoEditora = 'SP' OR estadoEditora = 'RJ';

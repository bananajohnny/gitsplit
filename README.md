#GITSPLIT

Script bash che automatizza quando detto [qua] (https://makingsoftware.wordpress.com/2013/02/16/using-git-subtrees-for-repository-separation/)

CAVEAT:  Non so se questo script funziona veramente usate a vostro rischio e pericolo

Dovrebbe funzionare così

* Si crea un repo da qualche parte per condividere il vostro nuovo modulo
* Si va nella root del progetto
* Si chiama lo script
* Farà un pò di domande
* Se tutto va bene dovreste ritrovarvi con un subtree nella cartella del modulo, il repo del modulo con un push iniziale, un repo locale per il modulo

Questi sono dei promemoria personali

 git subtree pull --prefix=path/to/code --squash shared master
 git subtree push --prefix=path/to/code --squash shared master
 
 
 

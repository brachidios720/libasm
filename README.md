## libasm — `README.md`

```md
# libasm

Bibliothèque de fonctions réécrites en assembleur dans le cadre du cursus 42.

## À propos

`libasm` consiste à réimplémenter en assembleur x86_64 plusieurs fonctions standard de la libc afin de mieux comprendre :
- les conventions d’appel,
- la gestion des registres,
- l’ABI,
- l’interaction entre C et assembleur.

## Fonctions généralement réimplémentées

- `ft_strlen`
- `ft_strcpy`
- `ft_strcmp`
- `ft_write`
- `ft_read`
- `ft_strdup`

> Adapte cette liste à tes fonctions réellement présentes dans le repo.

## Compilation

```bash
make
Utilisation
Le projet génère une bibliothèque que tu peux lier à tes programmes de test.
gcc main.c libasm.a
Objectifs pédagogiques
* Écrire des fonctions en assembleur x86_64
* Respecter l’ABI système
* Comprendre le lien entre code C et code assembleur
* Manipuler les appels système et la mémoire bas niveau

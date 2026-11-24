# amine-boujemaaoui.github.io

Site personnel d'Amine Boujemaaoui, développeur Java back-end / full-stack : présentation, projets, parcours et CV.

En ligne : https://amine-boujemaaoui.github.io/

## Contenu

| Fichier | Rôle |
|---|---|
| `index.html` | Page unique, en français et en anglais (bouton FR / EN) |
| `cv/` | CV en PDF, français et anglais |
| `404.html` | Page affichée pour les anciennes adresses |
| `favicon.svg` | Icône du site |

HTML et CSS sans framework ni étape de build. Le fichier `.nojekyll` désactive le traitement Jekyll de GitHub Pages.

## Mettre à jour

- **Un projet** : dupliquer un bloc `<li class="project">` dans la section `#projets` et renseigner les deux langues (`data-l="fr"` et `data-l="en"`).
- **Le CV** : remplacer les PDF dans `cv/` en gardant les mêmes noms de fichier.

## Tester en local

```bash
python3 -m http.server 8000
# puis ouvrir http://localhost:8000
```

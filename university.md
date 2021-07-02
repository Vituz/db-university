<!-- Modellizzare la struttura di una tabella per memorizzare tutti i dati riguardanti una università:
- sono presenti diversi dipartimenti, ciascuno con i propri corsi di laurea;
- ogni corso di laurea è formato da diversi corsi;
- ogni corso può essere tenuto da diversi insegnanti e prevede più appelli d'esame;
- ogni studente è iscritto ad un corso di laurea;
- per ogni appello d'esame a cui lo studente ha partecipato, è necessario memorizzare il voto ottenuto, anche se non sufficiente
Nella cartella della repo create un file struttura.md nel quale inserite la stuttura delle tabelle come fatto in classe con me.
Poi usate diagrams.net per creare il diagramma E-R. Completato il diagramma cliccate nel menu in altro su FILE > EMBED > HTML per esportare il diagramma in formato html.
Copiate il codice che vi dá, create nella repo un file index.html e nel body incollate il codice come fatto in classe stamattina. -->


# University

## departments

- id                     UNIQUE AUTOINCREMENT PRIMARY_KEY
- name                     
- building
- desc
- note

## courses

- id                     UNIQUE AUTOINCREMENT PRIMARY_KEY
- department_id          FOREING_KEY
- name
- years_of_course
- desc
- note

## school_subjects

- id                     UNIQUE AUTOINCREMENT PRIMARY_KEY
- name
- code
- cfu
- desc
- note

## teachers

- id                     UNIQUE AUTOINCREMENT PRIMARY_KEY
- school_subject_id      FOREING_KEY
- name
- lastname
- note

## appeals

- id                     UNIQUE AUTOINCREMENT PRIMARY_KEY
- school_subject_id      FOREING_KEY
- name
- building
- date
- desc
- note

## votes

- id                    UNIQUE AUTOINCREMENT PRIMARY_KEY
- student_id            FOREING_KEY1
- appeal_id             FOREING_KEY2
- vote
- date

## student

- id                   UNIQUE AUTOINCREMENT PRIMARY_KEY
- courses_id           FOREING_KEY
- name
- lastname
- age
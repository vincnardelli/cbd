---
layout: page
title: Usare R e Rstudio
permalink: /guide/usare_r_rstudio
parent: Guide
nav_order: 2
---


# Usare R e RStudio
{:.no_toc}

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

## Usare R
R non è un programma che puoi aprire e iniziare a utilizzare, come Microsoft Word o Internet Explorer. Invece, R è un linguaggio informatico, come C, C++ o UNIX. Usi R scrivendo comandi nel linguaggio R e chiedendo al tuo computer di interpretarli. In passato, le persone eseguivano il codice R nella finestra di un terminale UNIX, come se fossero hacker in un film degli anni '80. Ora quasi tutti usano R con un'applicazione chiamata RStudio e ti consiglio di farlo anche tu.

### R e UNIX

Puoi comunque eseguire R in una finestra UNIX o BASH (prompt o Powershell) digitando il comando: R che apre un interprete R. Puoi quindi fare il tuo lavoro e chiudere l'interprete eseguendo q()quando hai finito.

## Utilizzo di RStudio
R di per sé è solo il 'cuore' della programmazione R, ma non ha un'interfaccia utente particolare. Se preferisci (come me) un'interfaccia più gradevole con funzionalità aggiuntive, ti suggerisco di utilizzare RStudio. RStudio è un ambiente di sviluppo integrato (IDE) e sarà il nostro strumento principale per interagire con R. Per installare RStudio, attenersi alla seguente procedura:

Vai su www.rstudio.com
Vai a Products > RStudio.
In questa pagina, scorri verso il basso e seleziona RStudio Desktop.
Scegli la versione di RStudio
Selezionare l' Open Source Edition facendo clic su Download RStudio Desktop.

Come ultimo passaggio, scorri verso il basso dove ti mostra un pulsante di download per il tuo sistema operativo. Il sito Web lo rileverà automaticamente. Ricevi anche un bel promemoria per installare prima R, nel caso non l'abbia ancora fatto.

Apri il file scaricato e segui le istruzioni di installazione. Ancora una volta, mantieni le impostazioni predefinite il più possibile.
Congratulazioni, sei pronto per imparare R. D'ora in poi devi solo avviare RStudio e non R. Naturalmente, se sei un tipo curioso, nulla ti impedirà di provare R senza RStudio.

### Personalizzazione di RStudio
Prima di iniziare a programmare, devi voler apportare subito alcune modifiche alle tue impostazioni per avere un'esperienza migliore (secondo la mia modita opinione). Per aprire le impostazioni di Rstudio devi cliccare su

RStudio > Preferenceso premere ⌘ + ,se sei su un Mac.

RStudio > Tools > Global Options oppure premere Ctrl + ,se si lavora su un computer Windows.

Ti consiglio di apportare almeno le seguenti modifiche per prepararti al successo fin dall'inizio:

Già nella prima scheda, ovvero  General > Basic, dovremmo apportare una delle modifiche più significative. Disattiva tutte le opzioni che iniziano con Restore. Ciò garantirà che ogni volta che avvii RStudio, inizi con una tabula rasa. A prima vista potrebbe sembrare controintuitivo non ricominciare tutto da dove eri rimasto, ma è fondamentale rendere tutti i tuoi progetti facilmente riproducibili. Inoltre, se si lavora insieme ad altri, non ripristinare le impostazioni personali garantisce anche che la programmazione funzioni su computer diversi. Pertanto, ti consiglio di deselezionare quanto segue:

Restore most recently opened project at startup,

Restore previsouly open source documents at startup,

Restore .Rdata into workspace at startup


Nella stessa scheda in Workspace, selezionare Never per l'impostazione Save workspace to .RData on exit. Si potrebbe pensare che sia saggio mantenere i risultati intermedi archiviati da una sessione R all'altra. Tuttavia, mi sono spesso ritrovato a risolvere problemi dovuti a questa impostazione. Con l'esperienza, scoprirai che questo evita molti mal di testa.

Naturalmente, se desideri personalizzare ulteriormente il tuo spazio di lavoro, puoi farlo. Il modo visivamente più efficace per modificare l'aspetto predefinito di RStudio è selezionare Appearance e scegliere un tema colore completamente diverso. Sentiti libero di navigare tra le varie opzioni e vedere cosa preferisci. Non c'è giusto o sbagliato qui. Fallo tuo.

## Aggiornare R e RStudio
Sebbene non sia strettamente qualcosa che ti aiuta a diventare un programmatore migliore, questo consiglio potrebbe tornare utile per evitare di trasformarti in un programmatore frustrato. Quando si aggiorna il software, è necessario aggiornare R e RStudio separatamente l'uno dall'altro. Sebbene sia R che RStudio lavorino a stretto contatto tra loro, costituiscono comunque parti separate di software. Pertanto, è essenziale tenere presente che l'aggiornamento di RStudio non aggiornerà automaticamente R. Ciò può diventare problematico se gli strumenti specifici installati tramite RStudio (come un algoritmo di apprendimento di fantasia) potrebbero non essere compatibili con le versioni precedenti di R . Inoltre, pacchetti R aggiuntivi (vedi Capitolo 3) sviluppati da altri sviluppatori sono pezzi separati che richiedono anche l'aggiornamento, indipendentemente da R e RStudio.

So cosa stai pensando: sembra già complicato e ingombrante. Tuttavia, stai tranquillo, puoi aggiornare facilmente tutti i tuoi pacchetti con RStudio. Pertanto, tutto ciò che devi ricordare è: R deve essere aggiornato separatamente da tutto il resto.

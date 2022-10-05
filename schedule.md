---
layout: page
title: Orari
description: Gli orari settimanali del corso.
nav_order: 9
---

# 🗓 Orari settimanali
Questo è lo schema degli orari settimanali del corso.
Per aggiornamenti visitare la [pagina ufficiale del corso su unicatt.it](https://docenti.unicatt.it/ppd2/it/docenti/35215/giuseppe-arbia/didattica).

{% for schedule in site.schedules %}
{{ schedule }}
{% endfor %}

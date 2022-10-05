---
layout: page
title: Contatti
description: A listing of all the course staff members.
nav_order: 99
---

# 🧔🏻‍♂️ Chi sono

{% assign instructors = site.staffers | where: 'role', 'Instructor' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}

Per il corso non è previsto un orario di ricevimento ma sono a disposizione in aula prima e dopo ogni lezione. 

Se hai bisogno di un ricevimento puoi richiederlo tramite questa pagina (Google Meet o in presenza) oppure per esigenze particolari puoi contattarmi via mail.
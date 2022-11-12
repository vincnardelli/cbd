---
layout: page
title: Testimonianze
permalink: /testimonianze/
nav_order: 2
---

# 🧑🏻‍🚀 Testimonianze

Durante il corso organizzeremo delle lezioni con ospiti che ci racconteranno come utilizzano il codice e i big data nella propria professione. 

Inviteremo gli ospiti anche in base al vostro interesse. 


[Compila il questionario](https://docs.google.com/forms/d/e/1FAIpQLSf-hUjaxFrClq1hq0i6jV3KsP2zQ5m7xU91L_ml7BaxLtOmXQ/viewform){: .btn .btn-blue }


## Calendario Testimonianze


{% assign instructors = site.staffers | where: 'role', 'Testimonianza' | sort: 'id' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}
---
layout: page
title: Testimonianze
permalink: /testimonianze/
nav_order: 2
---

# 🧑🏻‍🚀 Testimonianze

Durante il corso organizzeremo delle lezioni con ospiti che ci racconteranno come utilizzano il codice e i big data nella propria professione. 

Inviteremo gli ospiti anche in base al vostro interesse. 


[Compila il questionario](https://forms.gle/7bRTJCANXwnRoq7z9){: .btn .btn-blue }


## Calendario Testimonianze


{% assign instructors = site.staffers | sort: "id" | where: 'role', 'Testimonianza' %}
{% for staffer in instructors %}
{{ staffer }}
{% endfor %}
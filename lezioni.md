---
layout: page
title: Lezioni
permalink: /lezioni/
description: A feed containing all of the class announcements.
nav_order: 2
---

# 👨🏻‍🏫 Lezioni

{% assign lezioni = site.lezioni  | sort: 'number'  %}
{% for lezione in lezioni %}
{{ lezione }}
{% endfor %}

# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import PROJECTS with context %}

{{ PROJECTS.rootdir }}:
  file.directory:
    - user: {{ PROJECTS.hostuser.name }}
    - group: {{ PROJECTS.hostuser.group }}

{{ PROJECTS.rootdir }}/files:
  file.recurse:
    - source: salt://projects/files
    - user: {{ PROJECTS.hostuser.name }}
    - group: {{ PROJECTS.hostuser.group }}
    - show_changes: false

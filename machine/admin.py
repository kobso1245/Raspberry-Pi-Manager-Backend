# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from machine.models import Machine

# Register your models here.
@admin.register(Machine)
class MachineAdmin(admin.ModelAdmin):
    fields = ('name', 'ip')
    readonly_fields = ('is_up', )


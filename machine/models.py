# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Machine(models.Model):
    name = models.CharField(max_length=200)
    ip = models.GenericIPAddressField(protocol='IPV4')

    @property
    def is_up(self):
        """Is machine running"""
        #TODO: Add logic
        return True

    def __str__(self):
        return f'{self.name} - {self.ip} - {self.is_up}'
from rest_framework import serializers
from machine.models import Machine

class MachineSerializer(serializers.ModelSerializer):
    class Meta:
        model = Machine
        fields = ['id', 'name', 'ip', 'is_up']
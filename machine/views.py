from machine.models import Machine
from machine.serializers import MachineSerializer
from rest_framework import viewsets

class MachineViewSet(viewsets.ModelViewSet):
    """
    A viewset for viewing and editing user instances.
    """
    serializer_class = MachineSerializer
    queryset = Machine.objects.all()
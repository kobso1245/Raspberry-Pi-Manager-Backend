from machine.views import MachineViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'', MachineViewSet, basename='machine')
urlpatterns = router.urls
# chat/consumers.py
from asgiref.sync import async_to_sync
from channels.generic.websocket import AsyncWebsocketConsumer
import json

class MachineConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        await self.channel_layer.group_add(
            'obshtata',
            self.channel_name
        )
        print(self.channel_name)
        print('Connected')
        await self.accept()

    async def disconnect(self, close_code):
        print('Disconnected')
        pass

    async def receive(self, text_data):
        pass

    async def alert_ui(self, event):
        print('Message received')
        message = event['message']
        # Send message to WebSocket
        await self.send(text_data=json.dumps({
            'message': message
        }))
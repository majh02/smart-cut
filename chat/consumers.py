import json
from asgiref.sync import async_to_sync
from channels.generic.websocket import WebsocketConsumer, AsyncWebsocketConsumer
from api.models import ChatDetail
from api.mysql_conn import *
import base64


class ChatConsumer(WebsocketConsumer):
    def connect(self):
        self.room_name = self.scope['url_route']['kwargs']['room_name']
        self.room_group_name = 'chat_%s' % self.room_name

        # Join room group
        async_to_sync(self.channel_layer.group_add)(
            self.room_group_name,
            self.channel_name
        )

        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            self.room_group_name,
            self.channel_name
        )

    # Receive message from WebSocket
    def receive(self, text_data):
        text_data_json = json.loads(text_data)
        username = text_data_json['username']
        room = text_data_json['room']

        if 'message' in text_data_json:
            message = text_data_json['message']
            
            self.save_message(username, room, message, '', 1)

            # Send message to room group
            async_to_sync(self.channel_layer.group_send)(
                self.room_group_name,
                {
                    'type': 'chat_message',
                    'message': message,
                    'username': username
                }
            )
        else:
            file = text_data_json['base64File']

            self.save_message(username, room, '', file, 2)

            # Send message to room group
            async_to_sync(self.channel_layer.group_send)(
                self.room_group_name,
                {
                    'type': 'chat_file',
                    'file': file,
                    'username': username
                }
            )

    # Receive message from room group
    def chat_message(self, event):
        message = event['message']
        username = event['username']

        # Send message to WebSocket
        self.send(text_data=json.dumps({
            'message': message,
            'username':username
        }))

    def chat_file(self, event):
        file = event['file']
        username = event['username']

        # Send message to WebSocket
        self.send(text_data=json.dumps({
            'file': file,
            'username':username
        }))

    # Save message
    def save_message(self, username, room, message, img, type):
        r_bool, result = Procedure('set_chat_detail', room, username, message, img, type)
        message = ''
        
        if not r_bool:
            message = 'Failed mysql'
        else:
            message = 'Success mysql'

        print(result, message)

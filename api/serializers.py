from rest_framework import serializers


from .models import *

class ShopSerializer(serializers.ModelSerializer):
    class Meta:
        model = Shop
        fields = [
            'shop_name',
            'remark',
            'hp',
            'addr',
            'startdate',      
        ]
        
        
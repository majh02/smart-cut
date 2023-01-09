from django.shortcuts import render
from api.models import ChatRoom, ChatDetail, Userinfo, Designer, RecommendHair
from api.mysql_conn import *

def index(request):
    print(request.session['user'])
    userinfo = Userinfo.objects.get(email=request.session['user'])
    user_id = userinfo.user_id
    print(user_id)
    r_bool, chat_list = Procedure('get_user_chatlist', user_id)
    message = ''
    
    if not r_bool:
        message = 'Failed mysql'
    else:
        print(chat_list)
        print(len(chat_list))
        message = 'Success mysql'

    print(f"chat_list : {chat_list}")
    return render(request, 'chat/20_chatting.html', {"chat_list":chat_list, 'listCnt':len(chat_list), 'userinfo':userinfo})

def room(request, room_name):
    print(request.session['user'])
    userinfo = Userinfo.objects.get(email=request.session['user'])
    # user_id = userinfo.user_id
    
    chatRoom = ChatRoom.objects.get(room_id = room_name)
    # userinfo = Userinfo.objects.get(user_id = chatRoom.user_id)
    designer = Designer.objects.get(designer_id = chatRoom.designer_id)
    
    chat_detail = ChatDetail.objects.filter(room_id = room_name)

    return render(request, 'chat/21_chatRoom.html'
                , {
                    'room_name': room_name
                    , 'userinfo' : userinfo
                    , 'designer' : designer
                    , 'chat_detail' : chat_detail
                    , 'chatRoom' : chatRoom
                })


def room_test(request, room_name):
    # userinfo = Userinfo.objects.get(email=request.session['user'])
    user_id = 1
    chatRoom = ChatRoom.objects.get(room_id = room_name)
    userinfo = Userinfo.objects.get(user_id = chatRoom.user_id)
    designer = Designer.objects.get(designer_id = chatRoom.designer_id)
    
    chat_detail = ChatDetail.objects.filter(room_id = room_name)
    
    return render(request, 'back_test/21_chatRoom.html'
                , {
                    'room_name': room_name
                    , 'userinfo' : designer
                    , 'designer' : userinfo
                    , 'chat_detail' : chat_detail
                    , 'chatRoom' : chatRoom
                })


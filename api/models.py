from django.db import models


class AgreeInfo(models.Model):
    user = models.OneToOneField('Userinfo', models.DO_NOTHING, primary_key=True)
    agree_yn = models.CharField(db_column='AGREE_YN', max_length=1, blank=True, null=True)  # Field name made lowercase.
    agree_type = models.CharField(db_column='AGREE_TYPE', max_length=1, blank=True, null=True)  # Field name made lowercase.
    agree_date = models.DateField(db_column='AGREE_DATE', blank=True, null=True)  # Field name made lowercase.
    expire_date = models.DateField(db_column='EXPIRE_DATE', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'agree_info'
    
    def __str__(self):
        return self.user.user_name



class ChatDetail(models.Model):
    room = models.OneToOneField('ChatRoom', models.DO_NOTHING, primary_key=True)
    seq = models.IntegerField()
    writer = models.CharField(max_length=30, blank=True, null=True)
    message = models.TextField(blank=True, null=True)
    writedatetime = models.DateTimeField(blank=True, null=True)
    chat_type = models.IntegerField(blank=True, null=True)
    img = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'chat_detail'
        unique_together = (('room', 'seq'),)
        
    def __str__(self):
        return self.message



class ChatRoom(models.Model):
    room_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Userinfo', models.DO_NOTHING)
    designer = models.ForeignKey('Designer', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'chat_room'
        
    def __str__(self):
        return f'{self.user.user_name}--{self.designer}'


class Designer(models.Model):
    designer_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Userinfo', models.DO_NOTHING)
    shop = models.ForeignKey('Shop', models.DO_NOTHING)
    designer = models.CharField(max_length=100)
    photo = models.ImageField(max_length=255, blank=True, null=True, upload_to="designer_img/")
    hp = models.CharField(max_length=100)
    remark = models.TextField(blank=True, null=True)
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'designer'
        
    def __str__(self):
        return f"{self.designer} - {self.shop}"

class RecommendHair(models.Model):
    seq = models.AutoField(primary_key=True)
    user = models.ForeignKey('Userinfo', models.DO_NOTHING)
    heart = models.FloatField(db_column='Heart', blank=True, null=True)  # Field name made lowercase.
    oblong = models.FloatField(db_column='Oblong', blank=True, null=True)  # Field name made lowercase.
    round = models.FloatField(db_column='Round', blank=True, null=True)  # Field name made lowercase.
    square = models.FloatField(db_column='Square', blank=True, null=True)  # Field name made lowercase.
    oval = models.FloatField(db_column='Oval', blank=True, null=True)  # Field name made lowercase.
    user_faceshape = models.CharField(max_length=30, blank=True, null=True)
    # image = models.ImageField(max_length=255, blank=True, null=True, upload_to="image/")
    image = models.CharField(max_length=255, blank=True, null=True)
    crop_image = models.CharField(max_length=255, blank=True, null=True)
    hair1 = models.CharField(max_length=255, blank=True, null=True)
    hair2 = models.CharField(max_length=255, blank=True, null=True)
    hair3 = models.CharField(max_length=255, blank=True, null=True)
    hair4 = models.CharField(max_length=255, blank=True, null=True)
    hair5 = models.CharField(max_length=255, blank=True, null=True)
    remark = models.TextField(blank=True, null=True)
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'recommend_hair'
        unique_together = (('seq', 'user'),)
        
    def __str__(self):
        return f"{self.user} - {self.user_faceshape}"


class ReservReview(models.Model):
    reserv = models.OneToOneField('Reservation', models.DO_NOTHING, primary_key=True)
    shop = models.ForeignKey('Shop', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey('Userinfo', models.DO_NOTHING, blank=True, null=True)
    star = models.FloatField(blank=True, null=True, default=0)
    content = models.TextField(blank=True, null=True)
    writer = models.CharField(max_length=3, blank=True, null=True)
    remark = models.TextField(blank=True, null=True)
    photo = models.ImageField(max_length=255, blank=True, null=True, upload_to="review/")
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reserv_review'
        
    def __str__(self):
        return f"{self.user} - {self.content}"


class Reservation(models.Model):
    reserv_id = models.AutoField(primary_key=True)
    user = models.ForeignKey('Userinfo', models.DO_NOTHING)
    designer = models.ForeignKey(Designer, models.DO_NOTHING)
    shop = models.ForeignKey('Shop', models.DO_NOTHING)
    reserv_date = models.CharField(max_length=10, blank=True, null=True)
    reserv_time = models.CharField(max_length=10, blank=True, null=True)
    cut = models.CharField(max_length=20, blank=True, null=True)
    perm = models.CharField(max_length=20, blank=True, null=True)
    color = models.CharField(max_length=20, blank=True, null=True)
    clinic = models.CharField(max_length=20, blank=True, null=True)
    remark = models.TextField(blank=True, null=True)
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reservation'
        
    def __str__(self):
        return f"{self.user} - {self.designer}"



class Shop(models.Model):
    shop_id = models.AutoField(primary_key=True)
    bizno = models.CharField(max_length=100)
    shop_name = models.CharField(max_length=50)
    sub_name = models.CharField(max_length=25, blank=True, null=True)
    ceo = models.CharField(max_length=5)
    zip_code = models.CharField(max_length=6)
    score = models.FloatField(blank=True, null=True)
    lat = models.CharField(max_length=50, blank=True, null=True)
    lng = models.CharField(max_length=50, blank=True, null=True)
    addr = models.CharField(max_length=200)
    addr_det = models.CharField(max_length=200)
    hp = models.CharField(max_length=20)
    startdate = models.DateField(blank=True, null=True)
    remark = models.TextField(blank=True, null=True)
    event_name = models.CharField(max_length=100, blank=True, null=True)
    event_price = models.CharField(max_length=20, blank=True, null=True)
    pay_type = models.CharField(max_length=200, blank=True, null=True)
    oper_time = models.CharField(max_length=200, blank=True, null=True)
    oper_day = models.CharField(max_length=200, blank=True, null=True)
    break_day = models.CharField(max_length=200, blank=True, null=True)
    break_time = models.CharField(max_length=200, blank=True, null=True)
    holiday = models.CharField(max_length=200, blank=True, null=True)
    holiday_time = models.CharField(max_length=200, blank=True, null=True)
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)
    heart = models.IntegerField(blank=True, null=True)
    oblong = models.IntegerField(blank=True, null=True)
    oval = models.IntegerField(blank=True, null=True)
    round = models.IntegerField(blank=True, null=True)
    square = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shop'
        
    def __str__(self):
        return self.shop_name


class ShopFile(models.Model):
    shop = models.OneToOneField(Shop, models.DO_NOTHING, primary_key=True)
    main_img = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    img1 = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    img2 = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    img3 = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    img4 = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    img5 = models.ImageField(max_length=250, blank=True, null=True, upload_to="shop_img/")
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'shop_file'
        
    def __str__(self):
        return self.shop.shop_name


class Userinfo(models.Model):
    user_id = models.AutoField(primary_key=True)
    user_pw = models.CharField(max_length=255)
    user_name = models.CharField(max_length=10)
    age = models.CharField(max_length=10)
    gender = models.CharField(max_length=5)
    email = models.CharField(max_length=100)
    hp = models.CharField(max_length=100)
    thumbnail = models.ImageField(max_length=255, blank=True, null=True, upload_to="profile_thumbnail/")
    user_type = models.IntegerField(blank=True, null=True)
    is_active = models.IntegerField(blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'userinfo'
        
    def __str__(self):
        return self.user_name
    
    
class UserinfoDetail(models.Model):
    
    SKIN_CONDITION = (
        ('지성', '지성'),
        ('건성', '건성'),
        ('지루성', '지루성'),
        ('민감성', '민감성'),
        ('중성', '중성'),
        ('모름', '모름'),
    )
    
    HAIR_BOLD = (
        ('가는모발', '가는모발'),
        ('중간모발', '건중간모발성'),
        ('두꺼운모발', '두꺼운모발'),
        ('모름', '모름'),
    )

    CURL = (
        ('곱슬', '곱슬'),
        ('반곱슬', '반곱슬'),
        ('직모', '직모'),
        ('모름', '모름'),
    )

    HAIR_CONDITION = (
        ('끊김', '끊김'),
        ('푸석함', '푸석함'),
        ('건강함', '건강함'),
        ('모름', '모름'),
    )

    THICK_HAIR = (
        ('많음', '많음'),
        ('보통', '보통'),
        ('적음', '적음'),
        ('탈모', '탈모'),
    )

    HAIR_AGE = (
        ('많음', '많음'),
        ('조금', '조금'),
        ('없음', '없음'),
    )

    user = models.OneToOneField(Userinfo, models.DO_NOTHING, primary_key=True)
    skin_condition = models.CharField(max_length=10, blank=True, null=True, choices=SKIN_CONDITION)
    hair_bold = models.CharField(max_length=10, blank=True, null=True, choices=HAIR_BOLD)
    curl = models.CharField(max_length=10, blank=True, null=True, choices=CURL)
    hair_condition = models.CharField(max_length=10, blank=True, null=True, choices=HAIR_CONDITION)
    thick_hair = models.CharField(max_length=10, blank=True, null=True, choices=THICK_HAIR)
    hair_age = models.CharField(max_length=10, blank=True, null=True, choices=HAIR_AGE)
    remark = models.TextField(blank=True, null=True)
    regdatetime = models.DateTimeField(blank=True, null=True)
    updatedatetime = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'userinfo_detail'
        
    def __str__(self):
        return self.user.user_name
    
class Hairstyle(models.Model):
    gender = models.CharField(max_length=1, blank=True, null=True)
    hair = models.CharField(max_length=20, blank=True, null=True)
    content = models.TextField(blank=True, null=True)
    tags = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'hairstyle'
        
    def __str__(self):
        return self.hair
from django.db import models
from .enums import RoomTypeChoices

class Hostel(models.Model):
    name = models.CharField(max_length=16)
    email = models.EmailField()
    phone = models.CharField(max_length=12)
    location = models.URLField()
    
    def __str__(self):
        return self.name

    class Meta:
        verbose_name = 'Hostel'
        verbose_name_plural = 'Hostels'

class Room(models.Model):
    hostel = models.ForeignKey(to=Hostel, on_delete=models.CASCADE)
    number = models.IntegerField()
    floor = models.IntegerField()
    price = models.IntegerField()
    room_type = models.CharField(max_length=13, choices=RoomTypeChoices.choices)

    def __str__(self):
        return str(self.number)

    class Meta:
        verbose_name = 'Room'
        verbose_name_plural = 'Rooms'


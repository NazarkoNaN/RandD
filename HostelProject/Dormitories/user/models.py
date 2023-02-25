from django.db import models
from .enums import StudentGenderChoices, FacultyChoices
from hostels.models import Room 
from django.contrib.auth.models import User

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    gender = models.CharField(max_length=8, choices=StudentGenderChoices.choices)
    faculty = models.CharField(max_length=8, choices=FacultyChoices.choices)
    everage_score = models.IntegerField(null=True)
    room_id = models.ForeignKey(to=Room, null=True, on_delete=models.SET_NULL)
    payment_status = models.BooleanField(default=False)
    location = models.CharField(max_length=255, blank=True, null=True)

    def __unicode__(self):
        return self.user